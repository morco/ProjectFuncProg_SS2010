--------------------------------- <Imports> --------------------------------

import IO
import System ( getArgs )
import qualified Data.Map as M (lookup,insert,delete)
import Control.Monad.State
import Data.Char (toLower)
import Data.List (findIndices)

import Parser.BasicHapMonad
import Parser.ParserTypes hiding (
                                   Token(..),
                                   TokenWrap(..),
                                   Constant(..),
                                   ParserState(..)
                                 )

import Expressions
import ProgrammState
import Definitions

import BinaryOps

import Debug.Trace(trace)

--------------------------------- </Imports> -------------------------------

--data HandleWrapper 
 --   = HandleWrapper Handle
 --   deriving (Eq,Ord)
     

--------------------------------- <Main> -----------------------------------

-- TODO: 
--    -> Speed it up, awfully slow even for very small examples
--    -> Handle types!!! (Vars, Constants (only one type of constant!!))

-- main principle:
--            -> get basic programm file path from arguments
--            -> open file
--            -> parse 
--            -> interprete

main :: IO ()
main = do
    -- needed to have output and getLine in the same line   
    hSetBuffering stdout NoBuffering      
    -- needed for getChar to read at once   
    hSetBuffering stdin NoBuffering  

    args <- getArgs
    handle <- openFile (head args) ReadMode
    contents <- hGetContents handle
    let pTree = getParseTree contents
        state = getNewState $! pTree
    runStateT (initState >> interpret (completeProgram state) ) state
    hClose handle

--------------------------------- </Main> ----------------------------------


----------------------------- <Helping functions> -------------------------
-- This functions helps or sometimes do the main work by evaluating 
--  special commands, the main reason, why they are not in where clauses 
--   is that they are needed by more than one command


-- This action does the stuff for the "on" command. This command has the
--  following structure: an numerical expression and a list of line numbers
--   It evaluates the expressions and makes a jump to the line in the list,
--    given by the expressions result, e.g. if the expressions evaluates to
--     "1" it makes and goto (or gosub) to the first line number in the 
--      list (Basic starts here counting by 1!!). If the expression 
--       evaluates to "0" it is jumped over (see also "if" command).
--  This is implemented by evaluating the expression and then contructing
--   a regular Goto or Gosub command with the correct line number and 
--    then executing this command
doOn :: NumExpr -> (LineNumber -> ControlStruct) -> [LineNumber] 
         -> PState ()
doOn numExpr constr linenums = do   
    res <- evalExpression numExpr
    let res' = floatToIntConvert res
    if res' > 0 && res' <= length linenums
      then evalCommand $ ControlStructure $ constr $ linenums !! (res' - 1)
      else 
        if res' < 0
          then do 
            state <- get
            let ermsg = "Negative argument '" ++ show res'
                        ++ "' for ON command not allowed!"
            illqua_error ermsg $ curPos state
          else return ()


-- A simple wrapper for inserting vars from IO actions. Simple said it
--  generalize the lift operation
--insertIOValue :: Var -> IO String -> PState ()
--insertIOValue var ioAct = insertValue var (liftIO $ ioAct) id read read
insertIOValue :: Var -> PState String -> PState ()
insertIOValue var ioAct = insertValue var ioAct id read read


-- With this function a program jump is executed by taking the whole
--  program (== List) and dropping all lines at the beginning up to the
--   the line to which we want to jump
jump_prog :: Program -> LineNumber -> Program
jump_prog oldprog nxPos = dropWhile (\(a,_) -> a /= nxPos) oldprog
    
----------------------------- </Helping functions> ------------------------


-- The main interpret function, works on a Program, which means a list 
-- which pairs up line numbers with a list of commands.
--  Because commands like "goto" and "end" can change the program flow 
--  and finish so the program before the this list is empty,
--   there have to be some checkings done here, which works like this:
--     1. Update the nextPos of state, which is in the normal case the 
--         following line in the program list 
--          (Caution, this means not, it has to have the line number + 1 !)
--     2. Evaluate all commands of the current line
--     3. Check if a command set the program finished flag true, if so, 
--         terminate at once
interpret :: Program -> PState ()
interpret []                   = 
    get >>= \st -> put $ st { progFinished = True } 
interpret ((lnNr,commands):xs) = do
    state <- get
    -- update the current line pointer
    put $ state { curPos = lnNr }
    -- update the next line pointer
    updateStateNextPos xs 
    -- execute all commands of this line
    newState1 <- get
    mapM_ evalCommand commands
    newState2 <- get
    -- check if an command set the program finished flag
    if progFinished newState2
      then
        return ()
      else
        interpret xs


-- This Function handles the hole work, it evaluates all commands in 
--  their right manner
-- TODO: 
--     -> action is very, very ugly!!! (Generalizing things seems possible
evalCommand :: Command -> PState ()
evalCommand (IO_Com (Input ((InputStuff lsComment vars), printLn))) = do
    state <- get
    let out_handle = basic_stdout state 
    liftIO $ case lsComment of
               []  -> return ()
               [x] -> if printLn
                         then
                           hPutStrLn out_handle x
                         else
                           hPutStr out_handle x
               _   -> let ermsg = "Comment of INPUT command" 
                                  ++ " can only be a single STRING"
                      in interprete_error ermsg $ curPos state
    mapM_ (flip insertIOValue (liftIO $ (putStr "? " >> getLine))) vars

-- The easiest way to get input chars and strings together is to make
--  the chars to strings by combining with the empty list, so this is done
evalCommand (IO_Com (Get vars)) = do
    state <- get
    let out_h = Just $ basic_stdout state
    getCommand stdin out_h vars
   -- let get_act = putStr "? " >> getChar >>= (return . flip (:) [])
  --  mapM_ (flip insertIOValue get_act) vars

evalCommand (IO_Com (Print (list, printLn))) = do 
    state <- get
    let out_h = basic_stdout state
    printCommand out_h list printLn 
{-    outStr <- mapM outputToString list
    let printStr = foldl (++) "" $ outStr
    liftIO $ if printLn
               then
                 putStrLn printStr
               else
                 putStr printStr
  where
    outputToString :: Output -> PState String 
    outputToString (OutStringExpr x) = evalStringExpression x 
    outputToString (OutNumExpr    x) = do
        res <- evalExpression x 
        let str = if isIntValue res
                    then show $ truncate res
                    else show res
        return str
  
    isIntValue :: Float -> Bool 
    isIntValue flnr = 
        let coma_part = flnr - (fromIntegral $ truncate flnr)
        in if coma_part == 0
             then True
             else False-}

evalCommand NOOP = return ()            

-- end is not right this way, cause in c64 a program can be resumed
evalCommand (ControlStructure End) = do
    state <- get
    put $ state { progFinished = True }           

evalCommand (ControlStructure (Goto nr)) = do
    state <- get
    let changedprog = jump_prog (completeProgram state) nr
    if null changedprog 
      then do
        let ermsg = "GOTO to nirwana(line: " ++ show nr ++ ")"
        undefst_error ermsg $ curPos state
      else 
        interpret changedprog 

evalCommand (ControlStructure (If expr commands)) = do
    bVal <- evalBoolExpression expr
    if bVal
      then
        mapM_ evalCommand commands
      else
        return ()

evalCommand (ArithAssignment var numExpr) = do
    state <- get
    let ln_nr      = curPos state
        var'       = NumVar_Var var
        get_act    = evalExpression numExpr
        str_err    = "STRING value in numerical expression"
        toStr_func = \_ -> interprete_error str_err ln_nr
        toInt_func = floatToIntConvert
        toFlt_func = id
    insertValue var' get_act toStr_func toInt_func toFlt_func

evalCommand (StringAssignment var stringExpr) = do 
    state <- get
    let ln_nr      = curPos state
        var'       = StringVar_Var var 
        get_act    = evalStringExpression stringExpr
        toStr_func = id
        num_err    = " value in STRING expression"
        toInt_func = \_ -> interprete_error ("INT" ++ num_err) ln_nr 
        toFlt_func = \_ -> interprete_error ("FLOAT" ++ num_err) ln_nr
    insertValue var' get_act toStr_func toInt_func toFlt_func

-- this implementation works only with correct folded fors and nexts
evalCommand (ControlStructure (For var (start,_,_))) = do
    state  <- get
    -- only reading, should not change state
    start' <- makeFloat start 
    if fromNext state 
      then 
        put $ state { 
                fromNext  = False 
              }
      else do -- first iteration
        -- set body var to init value (can only be float var!)
        updateFloatVar var start'  
        -- put this for line at the top of the for stack and set the
        --  come from next flag to false
        state' <- get
        put $ state' { 
                for_lines = (curPos state') : (for_lines state'),
                fromNext  = False 
              }

evalCommand (Next (For (FloatVar name) (start,step,end))) = do
    state <- get
    step' <- makeFloat step   
    end'  <- makeFloat end   
    let flvars = floatVars state
        var    = FloatVar name
        i      = getMapVal $ M.lookup name flvars
        i'     = i + step'
        fors   = for_lines state
    if i' > end'
      then -- for is completed
        put $ state { for_lines = tail fors } -- delete head == my for
      else do -- start next iteration
        updateFloatVar var i' -- increment var
        state' <- get
        -- say the for, this is not first iteration
        put $ state' { fromNext = True } 
        -- finally make some kind of goto to the for header, this is not
        --  a normal goto, because can happen, that you jump not only 
        --   between lines, but also between commands in a single line
        let nlist    = jump_prog (completeProgram state) $ head fors
            myfor    = ControlStructure (For var (start,step,end))
            -- the following is for jumping in the for line to the right 
            --  command or other said, dropping all commands which stand 
            --   befor our jumping for
            fstline  = head nlist
            com'     = dropWhile ((/=) myfor) $ snd $ fstline
            fstline' = (fst $ fstline, com')
        interpret (fstline' : tail nlist)   

evalCommand (ControlStructure (GoSub lnNr)) = do
    state <- get
    let newState = 
         state { 
          backJumpAdressStack = (nextPos state):(backJumpAdressStack state) 
         }
    put $ newState    
    evalCommand (ControlStructure $ Goto $ lnNr)

evalCommand (ControlStructure Return) = do
    state <- get
    let backJumpPoint = head $ backJumpAdressStack state
    put $ state { backJumpAdressStack = tail $ backJumpAdressStack state }
    evalCommand (ControlStructure $ Goto backJumpPoint)

evalCommand (Read vars) = mapM_ readVar vars
  where
        readVar :: Var -> PState ()
        readVar var = do
            state <- get
            let get_act    = getNextDataElement
                ln_nr      = curPos state
                toStr_func = getDataString
                toInt_func = flip getDataInt ln_nr
                toFlt_func = flip getDataFloat ln_nr
            insertValue var get_act toStr_func toInt_func toFlt_func    

evalCommand Restore = do
    state <- get
    put $ state { dataPointer = 0 }
    
evalCommand (Def name var numExpr) = do
    state <- get
    let md_cf = M.insert name (var,numExpr) $ custom_funcs state
    put $ state { custom_funcs = md_cf }

evalCommand (ControlStructure (On_Goto numExpr linenums)) = 
    doOn numExpr Goto linenums

evalCommand (ControlStructure (On_Gosub numExpr linenums)) = 
    doOn numExpr GoSub linenums

evalCommand (Dim myvars) = mapM_ dimArray myvars  
  {-where
        dimArray :: (Var,[Operand]) -> PState ()
        dimArray (var,dim'') = do
            state <- get
            dim'  <- mapM makeFloat dim''
            -- +1 because in c64 basic dimension gives the highest index!
            let dim      = map (((+) 1) . floatToIntConvert) dim'
                ins_func = \ _ -> Just (dim,M.empty)
                ln_nr    = curPos state
                test_dim = filter ((<=) 1) dim
            if dim == test_dim
              then
                case var of 
                     StringVar_Var (StringVar name )            -> 
                          -- Check if array was dimensioned already
                          case M.lookup name $ stringArrayVars state of
                               Just _  -> redim_error [] ln_nr
                               Nothing -> do
                                  let map    = stringArrayVars state
                                      newars = M.alter ins_func name map
                                  put $ state { stringArrayVars = newars }
                     NumVar_Var (NumVar_Int (IntVar name ))     -> 
                          -- Check if array was dimensioned already
                          case M.lookup name $ intArrayVars state of
                               Just _  -> redim_error [] ln_nr
                               Nothing -> do
                                  let map    = intArrayVars state
                                      newars = M.alter ins_func name map
                                  put $ state { intArrayVars = newars }
                     NumVar_Var (NumVar_Float (FloatVar name )) -> 
                          -- Check if array was dimensioned already
                          case M.lookup name $ floatArrayVars state of
                               Just _  -> redim_error [] ln_nr
                               Nothing -> do
                                  let map    = floatArrayVars state
                                      newars = M.alter ins_func name map
                                  put $ state { floatArrayVars = newars }
                     other -> do
                          let ermsg = "Dimensioning of non array"
                                      ++ " variable '" ++ show other 
                                      ++ "' tried" 
                          interprete_error ermsg ln_nr
              else do
                let ermsg = "Tried Dimensioning '" ++ show dim 
                            ++ "' contains 0 or negative value" 
                illqua_error ermsg ln_nr    -}

evalCommand (IO_Com (Open fileID devID secID path_mode)) = do
    state <- get
    let (fid_min,fid_max) = file_id_range
        ln_nr             = curPos state
    if fileID >= fid_min && fileID <= fid_max
      then do
        let devID' = getDevID devID ln_nr 
        handleDevices fileID devID' secID path_mode     
        {-let devID' = getDevID devID ln_nr
        if devID' == devID_monitor && secID == Nothing
          -- standard output
          then insertFileHandle fileID stdout            
          -- currently have to be device == filesys, now we need a 
          --  valid second id
          else if devID' == devID_filesys
                 then do
            {-
            -- sec id needed???
            let secID' = case secID of
                              Nothing             -> defaultSecondID 
                              Just secID_read     -> secID_read
                              Just secID_write    -> secID_write
                              -- eof is written automatically every time
                              Just secID_writeEOF -> secID_write 
                              Just other          -> do
                                    let ermsg = "Unsupported SecondID '" 
                                                ++ show other ++ "'"
                                    io_error ermsg ln_nr
             -}
                -- middle args ftype needed for something??
                   let (path,_,mode) = case path_mode of 
                                            Nothing -> 
                                               let ermsg = "You have to give a " 
                                                           ++ "path/mode for "
                                                           ++ "file system IO"
                                               in io_error ermsg ln_nr
                                            Just x  -> 
                                               splitpath_mode x ln_nr
                   handle <- liftIO $ openFile path mode
                   insertFileHandle fileID handle
                 else io_error "Invalid OPEN configuration" ln_nr
         -}
      else do
        let ermsg = "FileID '" ++ show fileID ++ "' is not in valid range " 
                    ++ show file_id_range
        io_error ermsg ln_nr
 
   where
     handleDevices :: Int -> Int -> Maybe Int -> Maybe String -> PState () 
     handleDevices fileID devID secID path_mode
      | devID == devID_monitor  = 
           if secID == Nothing
             -- standard output
             then insertFileHandle fileID stdout
             else do 
               state <- get
               io_error "Invalid OPEN configuration" $ curPos state
      | devID == devID_filesys  = do
           state <- get
           let ln_nr = curPos state
            {-
            -- sec id needed???
            let secID' = case secID of
                              Nothing             -> defaultSecondID 
                              Just secID_read     -> secID_read
                              Just secID_write    -> secID_write
                              -- eof is written automatically every time
                              Just secID_writeEOF -> secID_write 
                              Just other          -> do
                                    let ermsg = "Unsupported SecondID '" 
                                                ++ show other ++ "'"
                                    io_error ermsg ln_nr
             -}
           -- middle args ftype needed for something??
           let (path,_,mode) = case path_mode of 
                                    Nothing -> 
                                       let ermsg = "You have to give a " 
                                                   ++ "path/mode for "
                                                   ++ "file system IO"
                                        in io_error ermsg ln_nr
                                    Just x  -> splitpath_mode x ln_nr
           handle <- liftIO $ openFile path mode
           insertFileHandle fileID handle
      | devID == devID_keyboard = do
           if secID == Nothing
             -- standard input
             then insertFileHandle fileID stdin
             else do 
               state <- get
               io_error "Invalid OPEN configuration" $ curPos state
      | otherwise               = do
           state <- get
           io_error "Invalid OPEN configuration" $ curPos state

evalCommand (IO_Com (Close fileID)) = do
    state <- get
    let handle       = getMapVal $ M.lookup fileID $ file_handles state
        new_fhandles = M.delete fileID $ file_handles state
        new_eofs     = M.delete (show handle) $ eof_reached state
    liftIO $ hClose handle
    put $ state { 
            file_handles = new_fhandles, 
            eof_reached  = new_eofs
          }
    
evalCommand (IO_Com (GetF fileID vars)) = do
    state <- get
    let my_handle = getMapVal $ M.lookup fileID $ file_handles state
    getCommand my_handle Nothing vars

evalCommand (IO_Com (PrintF fileID (output,printLn))) = do
    state <- get
    let my_handle = getMapVal $ M.lookup fileID $ file_handles state
        bs_stdout = basic_stdout state
    if my_handle == bs_stdout
      then if null output
             then put $ state { basic_stdout = stdout }
             else return ()
      else return ()
    printCommand my_handle output printLn 

evalCommand (IO_Com (InputF fileID vars)) = do
    state <- get
    let my_handle = getMapVal $ M.lookup fileID $ file_handles state
    mapM_ (flip insertIOValue (getfileInput my_handle)) vars

evalCommand (IO_Com (Cmd fileID m_string)) = do
    state <- get
    let my_handle = getMapVal $ M.lookup fileID $ file_handles state
    put $ state { basic_stdout = my_handle }
    case m_string of
         Nothing -> return ()
         Just x  -> evalCommand $ IO_Com $ Print ([OutStringExpr $ StringOp $ StringLiteral $ x],True)

evalCommand com = do
    state <- get
    let ln_nr = curPos state
    interprete_error ("Unknown command '" ++ show com ++ "'") ln_nr 


getfileInput :: Handle -> PState String
getfileInput handleIn = do
    inp <- myHGetChar handleIn
    if inp == io_sep || inp == '\n'
      then return [] -- seperator case, stop parsing, ignore separator sign
      else do
        rst <- getfileInput handleIn
        return (inp : rst)

getCommand :: Handle -> Maybe Handle -> [Var] -> PState ()
getCommand handleIn handleOut vars = do
    let pre_liner = case handleOut of
                         Just h  -> liftIO $ hPutStr h "? "
                         Nothing -> return ()
        get       = myHGetChar handleIn
        get_act   = pre_liner >> get >>= (return . flip (:) [])
    mapM_ (flip insertIOValue get_act) vars


--hgetCharEOF :: Handle -> IO Char
hGetCharEOF handle =  (hGetChar handle) `catch` eofHandler 
  where
    eofHandler e = if isEOFError e 
                     then return '\0' -- safe way ??
                     else error "getCHar error; TODO!!!"

myHGetChar :: Handle -> PState Char
myHGetChar handle =  do
    nc <- liftIO $ hGetCharEOF handle
    if nc == '\0'
      then do -- EOF case
         state <- get 
         let eofs = eof_reached state
         case M.lookup (show handle) $ eofs of
              Nothing -> do -- all ok, set the register flag
                  let new_eofs = M.insert (show handle) True eofs
                      st_ref   = getMapVal $ M.lookup "ST" $ floatVars state
                      st_ref_bin = reverse $ toBin $ floatToIntConvert st_ref
                      st_ref_bin' = reverse $ take 5 st_ref_bin ++ [1] ++ drop 6 st_ref_bin
                      new_st_ref  = fromIntegral $ toIntFromBin $ trace ("new ST val in bin = " ++ show st_ref_bin) st_ref_bin'
                  trace ("updating ST var to: " ++ show new_st_ref) $ updateFloatVar (FloatVar "ST") new_st_ref
                  state' <- get
                  put $ state' { eof_reached = new_eofs } 
                  return '\n'
              Just _  -> -- eof thrown second time, error case
                  error "EOF ERROR: TODO!"
      else return nc


printCommand :: Handle -> [Output] -> Bool -> PState ()
printCommand handleOut output printLn = do
    outStr <- mapM outputToString output
    let printStr = foldl (++) "" $ outStr
    liftIO $ if printLn
               then
                 hPutStrLn handleOut printStr
               else
                 hPutStr handleOut printStr
  where
    outputToString :: Output -> PState String 
    outputToString (OutStringExpr x) = evalStringExpression x 
    outputToString (OutNumExpr    x) = do
        res <- evalExpression x 
        let str = if isIntValue res
                    then show $ truncate res
                    else show res
        return str
  
    isIntValue :: Float -> Bool 
    isIntValue flnr = 
        let coma_part = flnr - (fromIntegral $ truncate flnr)
        in if coma_part == 0
             then True
             else False

splitpath_mode :: String -> LineNumber -> (String,String,IOMode)
splitpath_mode str ln_nr =
    let seps = findIndices ((==) io_sep) str
    in case length seps of
            0 -> (str,default_type,default_mode)
            1 -> let (path,ftype) = splitAt (head seps) str
                     nm_ftype     = getType $ map toLower ftype
                 in (path,nm_ftype,default_mode)
            2 -> let (path,rst)   = splitAt (head seps) str
                     rst'         = tail rst -- first sign is the first comma!
	             newIdx       = findIndices ((==) io_sep) rst'
                     (ftype,mode) = splitAt (head newIdx) rst'
                     nm_ftype     = getType $ map toLower ftype
                     nm_mode      = basicToHaskellMode $ tail mode -- s.a.
                 in (path,nm_ftype,nm_mode)
            x -> let ermsg = "Invalid path/mode format string '" 
                             ++ str ++ "', correct format is: "
                             ++ "\"<path>[,<type>][,<mode>]\""
                 in io_error ermsg ln_nr
                    
 
