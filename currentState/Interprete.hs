--------------------------------- <Imports> --------------------------------

import IO
import System ( getArgs )
import qualified Data.Map as M
import Control.Monad.State


import Parser.BasicHapMonad
import Parser.ParserTypes hiding (
                                   Token(..),
                                   TokenWrap(..),
                                   Constant(..),
                                   ParserState(..)
                                 )

import Expressions
import ProgrammState

import Debug.Trace(trace)

--------------------------------- </Imports> -------------------------------


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
    let res' = truncate res
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
insertIOValue :: Var -> IO String -> PState ()
insertIOValue var ioAct = insertValue var (liftIO $ ioAct) id read read


-- With this function a program jump is executed by taking the whole
--  program (== List) and dropping all lines at the beginning up to the
--   the line to which we want to jump
jump_prog :: Program -> LineNumber -> Program
jump_prog oldprog nxPos = dropWhile (\(a,_) -> a /= nxPos) oldprog
    
   
-- This action generalize the insertion of a variable pattern 
--  (there is made no difference between first time and update)
--   Because variables have different types (Strings, Ints, Floats) we need
--    some arguments here ;D. Of course the variable than a monadic action 
--     which determines how to get the value, and at least 3 functions who
--      say, how to convert the value get by the monadic action into an 
--       String, Int and Float value.
--        If you want some conversions to be impossible you have to make an
--         error function as conversions function
insertValue :: Var -> PState a -> (a -> String) -> (a -> Int)
                -> (a -> Float) -> PState ()
insertValue var getValAct toStringFunc toIntFunc toFloatFunc = do
      val <- getValAct
      case var of
      -- if there is an unreadable input (no number), the runtime error
      --  should be thrown immediately, so strict evaluation here
         -- non array vars
         StringVar_Var (StringVar x)            -> do
                   let key = StringVar x
                   (updateStringVar key) $! (toStringFunc val)
         NumVar_Var (NumVar_Int (IntVar x))     -> do
                   let key = IntVar x
                   (updateIntVar key)    $! (toIntFunc val)
         NumVar_Var (NumVar_Float (FloatVar x)) -> do
                   let key = FloatVar x
                   (updateFloatVar key)  $! (toFloatFunc val)
         -- array vars
         StringVar_Var (StringVar_Array name ix)            -> do
                   res <- mapM evalExpression ix
                   let key   = StringVar_Array name ix
                       index = map truncate res
                   (updateStringArrayVar key index) $! (toStringFunc val)
         NumVar_Var (NumVar_Int (IntVar_Array name ix))     -> do
                   res <- mapM evalExpression ix
                   let key   = IntVar_Array name ix
                       index = map truncate res
                   (updateIntArrayVar key index) $! (toIntFunc val)
         NumVar_Var (NumVar_Float (FloatVar_Array name ix)) -> do
                   res <- mapM evalExpression ix
                   let key   = FloatVar_Array name ix
                       index = map truncate res
                   (updateFloatArrayVar key index) $! (toFloatFunc val)
      
----------------------------- </Helping functions> ------------------------

 
----------------------------- <Error definitions> -------------------------

redim_error :: String -> LineNumber -> a
redim_error comment nr = printError "?REDIM'D ARRAY ERROR" comment nr

illqua_error :: String -> LineNumber -> a
illqua_error comment nr = printError "?ILLEGAL QUANTIFY ERROR" comment nr


undefst_error :: String -> LineNumber -> a
undefst_error comment nr = printError "?UNDEF'D STATEMENT ERROR" comment nr

interprete_error :: String -> LineNumber -> a
interprete_error comment nr = printError "INTERPRETE ERROR" comment nr



printError :: String -> String -> LineNumber -> a
printError err comment nr =
    let msg_tail = if null comment
                     then " !"
                     else ": " ++ comment ++ " !"
    in error $ err ++ " in line " ++ show nr ++ msg_tail

----------------------------- </Error definitions> ------------------------


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
    liftIO $ case lsComment of
               []  -> return ()
               [x] -> if printLn
                         then
                           putStrLn x
                         else
                           putStr x
               _   -> let ermsg = "Comment of INPUT command" 
                                  ++ " can only be a single STRING"
                      in interprete_error ermsg $ curPos state
    mapM_ (flip insertIOValue (putStr "? " >> getLine)) vars

-- The easiest way to get input chars and strings together is to make
--  the chars to strings by combining with the empty list, so this is done
evalCommand (IO_Com (Get vars)) = do
    let get_act = putStr "? " >> getChar >>= (return . flip (:) [])
    mapM_ (flip insertIOValue get_act) vars

evalCommand (IO_Com (Print (list, printLn))) = do 
    outStr <- mapM outputToString list
    let printStr = foldl (++) "" $ outStr
    liftIO $ if printLn
               then
                 putStrLn printStr
               else
                 putStr printStr
  where
    -- TODO: Int values should be ints, so no floats (no after komma signs) 
    outputToString :: Output -> PState String 
    outputToString (OutStringExpr x) = evalStringExpression x 
    outputToString (OutNumExpr x) = evalExpression x >>= (return . show)

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
        toInt_func = truncate
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

evalCommand (Next (For var (start,step,end))) = do
    state <- get
    step' <- makeFloat step   
    end'  <- makeFloat end   
    let flvars = floatVars state
        i      = getMapVal $ M.lookup var flvars
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
            let get_act    = getNextDataElement
                toStr_func = getDataString
                toInt_func = getDataInt
                toFlt_func = getDataFloat
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
  where
        dimArray :: (Var,[Operand]) -> PState ()
        dimArray (var,dim'') = do
            state <- get
            dim'  <- mapM makeFloat dim''
            -- +1 because in c64 basic dimension gives the highest index!
            let dim      = map (((+) 1) . truncate) dim'
                ins_func = \ _ -> Just (dim,M.empty)
                ln_nr = curPos state
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
                 _   -> do
                        let ermsg = "Dimensioning of non array"
                                    ++ " variable tried" 
                        interprete_error ermsg ln_nr 

evalCommand com = do
    state <- get
    let ln_nr = curPos state
    interprete_error ("Unknown command '" ++ show com ++ "'") ln_nr 



