--------------------------------- <Imports> --------------------------------

import Parser.BasicHapMonad
import Parser.ParserTypes hiding (
                                   Token(..),
                                   TokenWrap(..),
                                   Constant(..),
                                   ParserState(..)
                                 )
import IO
import System ( getArgs )
import qualified Data.Map as M
import Data.List
import Control.Monad.State

--import Nums
--import Strings
import Expressions
import ProgrammState
import Bool

import Debug.Trace

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

main = do
    -- needed to have output and getLine in the same line   
    hSetBuffering stdout NoBuffering      
    -- needed for getChar to read at once   
    hSetBuffering stdin NoBuffering  

    args <- getArgs
    handle <- openFile (head args) ReadMode
    contents <- hGetContents handle
    let pTree = getParseTree contents
    let state = getNewState $! pTree
    runStateT (initState >> interpret (completeProgram state) ) state
    hClose handle

--------------------------------- </Main> ----------------------------------

-- The main interpret function, works on a Program, which means a list 
-- which pairs up linenumbers with a list of commands.
--  Because commands like "goto" and "end" can change the program flow 
--  ("end" even let terminate the program at once),
--   there have to be some checkings done here, which works like this:
--     1. Update the nextPos of state, which is in the normal case the 
--         following line in the program list 
--          (Caution, this means not, it has to have the line number + 1 !)
--     2. Evaluate all commands of the current line
--     3. Check if a command set the program finished flag true, if so, 
--         terminate at once
--     4. Check if a command changed the nextPos pointer, if so, set the 
--         current working program list to this position, else, 
--          go on normally
interpret :: Program -> PState ()
interpret [] = get >>= \st -> put $ st { progFinished = True } -- >> return ()
interpret ((lnNr,commands):xs) = do
   {- state <- get
    put $ state { curPos = lnNr }
    updateStateNextPos xs 
    newState1 <- get
    mapM_ evalCommand commands
    newState2 <- get
    if (progFinished newState2)
      then
        return ()
      else
        let realNxPos = (nextPos newState2) 
        in if (nextPos newState1) == realNxPos 
             then 
               interpret xs
             else 
               interpret $ getNewList (completeProgram newState2) realNxPos   -}           
    state <- get
    put $ state { curPos = lnNr }
    updateStateNextPos xs 
    newState1 <- get
    mapM_ evalCommand commands
    newState2 <- get
    if (progFinished newState2)
      then
        return ()
      else
        let realNxPos = (nextPos newState2) 
        in if (nextPos newState1) == realNxPos 
             then 
               interpret xs
             else 
               interpret $ getNewList (completeProgram newState2) realNxPos              
  where
    getNewList oldList nxPos = dropWhile (\(a,_) -> a /= nxPos) oldList


-- This Function handles the hole work, it evaluates all commands in 
--  their right way
-- TODO: 
--     -> action is very, very ugly!!! (Generalizing things seems possible
evalCommand :: Command -> PState ()
evalCommand (IO_Com (Input ((InputStuff lsComment vars), printLn))) = do 
    liftIO $ case lsComment of
               []  -> return ()
               [x] -> if printLn
                         then
                           putStrLn x
                         else
                           putStr x
    mapM_ (flip insertIOValue (putStr "? " >> getLine)) vars

-- The easiest way to get input chars and strings together is to make
--  the chars to strings by combining with the empty list, so this is done
evalCommand (IO_Com (Get var)) = 
    insertIOValue var (putStr "? " >> getChar >>= (return . flip (:) [])) 

evalCommand (IO_Com (Print (list, printLn))) = do 
    state <- get
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

-- TODO: jumping to a wrong number should kill the program, maybe 
--  check this by parsing ??
evalCommand (ControlStructure (Goto nr)) = do
    state <- get
    --put $ state { nextPos = nr }      
    --trace ("New list found!") $ interpret $ trace ("Find new list, ln = " ++ show nr) $ getNewList (completeProgram state) nr 
    interpret $ getNewList (completeProgram state) nr 
    


evalCommand (ControlStructure (If boolExpr commands)) = do
    state <- get
    bVal <- evalBoolExpression boolExpr
    if bVal
      then
        mapM_ evalCommand commands
      else
        return ()

evalCommand (ArithAssignment var numExpr) = 
    insertValue (NumVar_Var var) (evalExpression numExpr) (\x -> error "strig val in um expr") truncate id
{-    state <- get
    res <- evalExpression numExpr
    case var of
       NumVar_Float _ -> updateFloatVar (NumVar_Var var) res 
       NumVar_Int   _ -> updateIntVar (NumVar_Var var) (truncate res) 
-}

evalCommand (StringAssignment var stringExpr) = 
 --   trace ("Stringasignm: " ++ show var ++ ",  " ++ show stringExpr) $ insertValue (StringVar_Var var) (evalStringExpression stringExpr) id (\x -> error "num value in string expr") (\x -> error "num value in string expr")
    insertValue (StringVar_Var var) (evalStringExpression stringExpr) id (\x -> error "num value in string expr") (\x -> error "num value in string expr")
    --val <- evalStringExpression stringExpr
    --updateStringVar (StringVar_Var var) val



{-
evalCommand (ControlStructure (For var (start,step,end) commands lines)) = do
    -- only reading, should not change state
    start' <- makeFloat start 
    step'  <- makeFloat step   
    stop'  <- makeFloat end   
    state  <- get
    let nxLine = nextPos state
    --evalFor var  start' step' stop' (commands ++ (concat $ map snd lines)) True
    evalFor var  start' step' stop' ((curPos state,commands) : lines) True
    newst <- get
    put $ newst { nextPos = nxLine }
  where
    evalFor var' start step end commands isFirst = do
        state <- get
        let var = NumVar_Var var'
        if isFirst
          then 
            case var of
                 NumVar_Var (FloatVar _ ) -> 
                        updateFloatVar var start
                 NumVar_Var (IntVar _ )   -> 
                        updateIntVar var (truncate start)
          else
            return () 
        state1 <- get
        let varVal =  
             case var' of
                  IntVar _   ->
                     let intVal =  getMapVal $ M.lookup var (intVars state1)
                     in  fromIntegral intVal
                  FloatVar _ -> 
                     getMapVal $ M.lookup var (floatVars state1)
        if (varVal > end)
          then
            return ()
          else do
            --mapM_ evalCommand commands
            interpret commands
            let inc = varVal + step
            case var of
                 NumVar_Var (FloatVar _ ) -> updateFloatVar var inc
                 NumVar_Var (IntVar _ )   -> updateIntVar var (truncate inc)
            evalFor var' start step end commands False
-}

-- this implementation works only with correct folded fors and nexts
--evalCommand (ControlStructure (For var (start,step,end))) = do
evalCommand (ControlStructure (For var (start,_,_))) = do
    state  <- get
    -- only reading, should not change state
    start' <- makeFloat start 
    --step'  <- makeFloat step   
    --stop'  <- makeFloat end   
    if fromNext state 
      then 
        put $ state { 
                fromNext  = False 
              }
      else do -- first iteration
        -- set body var to init value
        updateFloatVar (NumVar_Var $ NumVar_Float var) start' -- can only be float var!
        --trace ("First It Var: " ++ show var) $ updateFloatVar (NumVar_Var var) start' -- can only be float var!
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
    let i = getMapVal $ M.lookup (NumVar_Var $ NumVar_Float var) (floatVars state)
    --let i = trace ("look for for var: " ++ show var) $ getMapVal $ M.lookup (NumVar_Var var) (floatVars state)
    let i' = i + step'
    let fors = for_lines state
    if i' > end'
      then -- for is completed
        put $ state { for_lines = tail fors } -- delete head == my for
        -- return ()
      else do -- start next iteration
        updateFloatVar (NumVar_Var $ NumVar_Float var) i' -- increment var
        state' <- get
        put $ state' { fromNext = True } -- say the for, this is not first iteration
        -- finally make some kind of goto to the for header, this is not
        --  a normal goto, because can happen, that you jump not only between
        --   lines, but also between commands in a single line
        let nlist    = getNewList (completeProgram state) $ head fors
            com'     = dropWhile ((/=) (ControlStructure (For var (start,step,end)))) $ snd $ head nlist
            fstline' = (fst $ head nlist, com')
        interpret (fstline' : tail nlist)   
        




evalCommand (ControlStructure (GoSub lnNr)) = do
    state <- get
    let newState = 
         state { 
          backJumpAdressStack = (nextPos state) : (backJumpAdressStack state) 
         }
    put $ newState    
    --evalCommand (ControlStructure $ Goto $ trace ("Gosub: Jumping to -> " ++ (show lnNr)) lnNr)
    evalCommand (ControlStructure $ Goto $ lnNr)

evalCommand (ControlStructure Return) = do
    state <- get
    let backJumpPoint = head $ backJumpAdressStack state
    put $ state { backJumpAdressStack = tail $ backJumpAdressStack state }
    evalCommand (ControlStructure $ Goto backJumpPoint)

evalCommand (Read vars) = mapM_ readVar vars

evalCommand Restore = do
    state <- get
    put $ state { dataPointer = 0 }
    
evalCommand (Def name var numExpr) = do
    state <- get
    let md_cf = M.insert name (var,numExpr) $ custom_funcs state
    put $ state { custom_funcs = md_cf }

evalCommand (ControlStructure (On_Goto numExpr lines)) = 
    doOn numExpr Goto lines
   {- res <- evalExpression numExpr
    let res' = truncate res
    if res' > 0 && res' < length lines
      then evalCommand $ ControlStructure $ Goto $ lines !! (res' - 1)
      else 
        if res' < 0
          then do 
            state <- get
            error $ "?ILLEGAL QUANTIFY ERROR in line " 
                    ++ (show $ curPos state) ++ ": Negative argument '" 
                    ++ (show res') ++ "' for ON command not allowed!"
          else return ()
-}

evalCommand (ControlStructure (On_Gosub numExpr lines)) = 
    doOn numExpr GoSub lines

evalCommand (Dim myvars) = mapM_ dimArray myvars  


dimArray :: (Var,[Operand]) -> PState ()
dimArray (var,dim'') = do
    state <- get
    dim'  <- mapM makeFloat dim''
    let dim = map (((+) 1) . truncate) dim' -- because in c64 basic dimension gives the highest index!
    case var of 
      StringVar_Var (StringVar name )  -> 
            -- Check if array was dimensioned already
            case M.lookup name $ stringArrayVars state of
                 Just _ -> error "?REDIM'D ARRAY ERROR"
                 Nothing -> do
                    let newars = M.alter (\ _ -> Just (dim,M.empty)) name $ stringArrayVars state
                    put $ state { stringArrayVars = newars }
      NumVar_Var (NumVar_Int (IntVar name ))   -> 
            -- Check if array was dimensioned already
            case M.lookup name $ intArrayVars state of
                 Just _ -> error "?REDIM'D ARRAY ERROR"
                 Nothing -> do
                    let newars = M.alter (\ _ -> Just (dim,M.empty)) name $ intArrayVars state
                    put $ state { intArrayVars = newars }
      NumVar_Var (NumVar_Float (FloatVar name )) -> 
            -- Check if array was dimensioned already
            case M.lookup name $ floatArrayVars state of
                 Just _ -> error "?REDIM'D ARRAY ERROR"
                 Nothing -> do
                    let newars = M.alter (\ _ -> Just (dim,M.empty)) name $ floatArrayVars state
                    put $ state { floatArrayVars = newars }
      _   -> error "non array variable!"




doOn :: NumExpr -> (Int -> ControlStruct) -> [Int] -> PState ()
doOn numExpr constr lines = do   
    res <- evalExpression numExpr
    --let res' = trace ("Doing on with: " ++ (show $ truncate res)) $ truncate res
    let res' = truncate res
    if res' > 0 && res' <= length lines
      then evalCommand $ ControlStructure $ constr $ lines !! (res' - 1)
      else 
        if res' < 0
          then do 
            state <- get
            error $ "?ILLEGAL QUANTIFY ERROR in line " 
                    ++ (show $ curPos state) ++ ": Negative argument '" 
                    ++ (show res') ++ "' for ON command not allowed!"
          else return ()


readVar :: Var -> PState ()
readVar var = 
    insertValue var getNextDataElement getDataString getDataInt getDataFloat 


insertIOValue :: Var -> IO String -> PState ()
insertIOValue var ioAct = insertValue var (liftIO $ ioAct) id read read

--getConstant (TkIntConst x) = read (show x)
--getConstant (TkFloatConst x) = read (show x)
--getConstant (TkIntConst x) = x
--getConstant (TkFloatConst x) = -1


getNewList oldList nxPos = dropWhile (\(a,_) -> a /= nxPos) oldList
    
   

insertValue :: Var -> PState a -> (a -> String) -> (a -> Int)
                -> (a -> Float) -> PState ()
insertValue var getValAct toStringFunc toIntFunc toFloatFunc = do
      val <- getValAct
-- trace ("updatevar; " ++ show var) $ case var of
      case var of
      -- if there is an unreadable input (no number), the runtime error
      --  should be thrown immediately, so strict evaluation here
      --    StringVar_Var _             -> (updateStringVar var) $! (toStringFunc val)
      --    NumVar_Var (NumVar_Int _)   -> (updateIntVar var) $! (toIntFunc val)
      --    NumVar_Var (NumVar_Float _) -> (updateFloatVar var) $! (toFloatFunc val)
         StringVar_Var (StringVar _) -> (updateStringVar var) $! (toStringFunc val)
         NumVar_Var (NumVar_Int (IntVar _))   -> (updateIntVar var) $! (toIntFunc val)
         NumVar_Var (NumVar_Float (FloatVar _)) -> (updateFloatVar var) $! (toFloatFunc val)
      -- array case
         StringVar_Var (StringVar_Array name ix)           -> do
                       res <- mapM evalExpression ix
                       let key   = StringVar_Array name ix
                           index = map truncate res
                       (updateStringArrayVar key index) $! (toStringFunc val)
               --        stnew <- get
               --        return $ trace ("update string arrays! " ++ (show $ stringArrayVars stnew)) ()
         NumVar_Var (NumVar_Int (IntVar_Array name ix))   -> do
                       res <- mapM evalExpression ix
                       let key   = IntVar_Array name ix
                           index = map truncate res
                       (updateIntArrayVar key index) $! (toIntFunc val)
         NumVar_Var (NumVar_Float (FloatVar_Array name ix)) -> do
                       res <- mapM evalExpression ix
                       let key   = FloatVar_Array name ix
                           index = map truncate res
                       (updateFloatArrayVar key index) $! (toFloatFunc val)
      

 
