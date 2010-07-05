--------------------------------- <Imports> --------------------------------

import BasicHapMonad
import IO
import System ( getArgs )
import qualified Data.Map as M
import Data.List
import Control.Monad.State

import Strings
import ProgrammState
import Nums
import Bool

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
    runStateT (initState >> interpret pTree ) state
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
interpret [] = return ()
interpret ((lnNr,commands):xs) = do
    state <- get
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
evalCommand (Command (Input ((InputStuff lsComment vars), printLn))) = do 
    liftIO $ case lsComment of
               []  -> return ()
               [x] -> if printLn
                         then
                           putStrLn x
                         else
                           putStr x
    mapM_ (flip insertIOValue (putStr "? " >> getLine)) vars

evalCommand (Command (Get var)) = 
    insertIOValue var (putStr "? " >> myGetChar)

evalCommand (Command (Print (list, printLn))) = do 
    state <- get
    let printStr = foldl (++) "" $ map (flip buildOutString state) list
    liftIO $ if printLn
               then
                 putStrLn printStr
               else
                 putStr printStr
  where
    buildOutString :: Output -> ProgramState -> String
    buildOutString (OutString x) _ = x 
    buildOutString (OutVar x) state =                                      
        case x of
             StringVar_Var _          ->        
                        getMapVal $ M.lookup x (stringVars state) 
             NumVar_Var (IntVar _)    -> 
                 show $ getMapVal $ M.lookup x (intVars state)
             NumVar_Var (FloatVar _)  -> 
                 show $ getMapVal $ M.lookup x (floatVars state)

evalCommand NOOP = return ()            

-- end is not right this way, cause in c64 a program can be resumed
evalCommand End = do
    state <- get
    put $ state { progFinished = True }           

-- TODO: jumping to a wrong number should kill the program, maybe 
--  check this by parsing ??
evalCommand (Goto nr) = do
    state <- get
    put $ state { nextPos = nr }      
    return ()

evalCommand (ControlStructure (If boolExpr commands)) = do
    state <- get
    bVal <- evalBoolExpression boolExpr
    if bVal
      then
        mapM_ evalCommand commands
      else
        return ()

evalCommand (ArithAssignment var numExpr) = do
    state <- get
    res <- evalExpression numExpr
    case var of
       FloatVar _ -> updateFloatVar (NumVar_Var var) res 
       IntVar   _ -> updateIntVar (NumVar_Var var) (truncate res) 
    return ()

evalCommand (StringAssignment var stringExpr) = do
    val <- evalStringExpression stringExpr
    updateStringVar (StringVar_Var var) val
    return ()

evalCommand (ControlStructure (For var (start,step,end) commands)) = do
    -- only reading, should not change state
    start' <- makeFloat start 
    step'  <- makeFloat step   
    stop'  <- makeFloat end   
    evalFor var  start' step' stop' (concat $ map snd commands) True
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
            mapM_ evalCommand commands
            let inc = varVal + step
            case var of
                 NumVar_Var (FloatVar _ ) -> updateFloatVar var inc
                 NumVar_Var (IntVar _ )   -> updateIntVar var (truncate inc)
            evalFor var' start step end commands False

evalCommand (ControlStructure (GoSub lnNr)) = do
    state <- get
    let newState = 
         state { 
          backJumpAdressStack = (nextPos state) : (backJumpAdressStack state) 
         }
    put $ newState    
    evalCommand (Goto lnNr)

evalCommand (Return) = do
    state <- get
    let backJumpPoint = head $ backJumpAdressStack state
    put $ state { backJumpAdressStack = tail $ backJumpAdressStack state }
    evalCommand (Goto backJumpPoint)


--getConstant (TkIntConst x) = read (show x)
--getConstant (TkFloatConst x) = read (show x)
--getConstant (TkIntConst x) = x
--getConstant (TkFloatConst x) = -1


myGetChar :: IO String
myGetChar = do
    ch <- getChar
    return [ch]


insertIOValue :: Var -> IO String -> PState ()
insertIOValue x ioAct = do
    val <- liftIO $ ioAct
    case x of
      StringVar_Var _         -> updateStringVar x val
      -- if there is an unreadable input (no number), the runtime error 
      --  should be thrown immediately, so strict evaluation here
      NumVar_Var (IntVar _)   -> (updateIntVar x) $! (read val)
      NumVar_Var (FloatVar _) -> (updateFloatVar x) $! (read val)
    

