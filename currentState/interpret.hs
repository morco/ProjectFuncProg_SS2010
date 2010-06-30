------------------------------------------------- <Imports> ------------------------------------------------------

--import BasicHap
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

------------------------------------------------- </Imports> -----------------------------------------------------


---------------------------------------------------- <Main> ------------------------------------------------------

-- TODO: 
--    -> Speed it up, awfully slow even for very small examples
--    -> Handle types!!! (Vars, Constants (only one type of constant!!))

-- main principle:
--            -> get basic programm file path from arguments
--            -> open file
--            -> parse 
--            -> interprete

main = do
    hSetBuffering stdout NoBuffering  -- needed to have output and getLine in the same line   
    hSetBuffering stdin NoBuffering  -- needed for getChar to read at once   

    args <- getArgs
    handle <- openFile (head args) ReadMode
    contents <- hGetContents handle
    let pTree = getParseTree contents
    let state = getNewState pTree
    runStateT (initState >> interpret pTree ) state
    hClose handle

--------------------------------------------------- </Main> ------------------------------------------------------

-- The main interpret function, works on a Program, which means a list of pairs linenumbers with a list of commands
--  Because commands like goto and end can change the program flow end even let terminate the program at once,
--   there have to be some checkings done here, which works like this:
--     1. Update the nextPos of state, which is in the normal case the following line in the program list 
--         (Caution, this means not, it has the line number + 1 !)
--     2. Evaluate all commands of the current line
--     3. Check if a command set the program finished flag true, if so, terminate at once
--     4. Check if a command changed the nextPos pointer, if set the current working program list to this position,
--         else, go on normally
interpret :: Program -> PState ()
interpret [] = return ()
interpret ((lnNr,commands):xs) = do
    state <- get
    updateStateNextPos xs 
    newState1 <- get
    --evalAllCommands commands
    mapM_ evalCommand commands
    newState2 <- get
    if (progFinished newState2)
      then
        return ()
      else
        let realNextPos = (nextPos newState2) in
        if (nextPos newState1) == realNextPos 
          then 
            interpret xs
          else 
            let newList = dropWhile (\(a,_) -> a /= realNextPos) (completeProgram newState2) in
            interpret newList                 

{-
-- well a simple map should do it
evalAllCommands :: [Command] -> PState ()
evalAllCommands [] = return ()
evalAllCommands (x:xs) = evalCommand x >> evalAllCommands xs 
-}

-- This Function handles the hole work, it evaluates all commands in their right way
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
                     
    --let vars = [var]
    --listInsert vars (putStr "? " >> getLine)
    mapM_ (flip insertIOValue (putStr "? " >> getLine)) vars

{-    where
         -- TODO: input seems to have only one var at max, so maybe simplify
         listInsert :: [Var] -> IO String -> PState ()
         listInsert [] _ = return ()
         listInsert (x:xs) ioAct = do
             val <- liftIO $ ioAct

             case x of
               StringVar_Var _         -> updateStringVar x val
               NumVar_Var (IntVar _)   -> updateIntVar x (read val)
               NumVar_Var (FloatVar _) -> updateFloatVar x (read val)
                       
         listInsert xs ioAct
-}


evalCommand (Command (Get var)) = do 
    --let vars = [var]
    --listInsert vars (putStr "? " >> myGetChar)
    insertIOValue var (putStr "? " >> myGetChar)

evalCommand (Command (Print (list, printLn))) = do 
   -- ka, wie es so gehen wuerde, weil igrendwie muesste man da ja den Value daraus haben, und nicht den STate
   {- liftIO $ if printLn
               then
                 putStrLn $ "hvalfunc" (buildOutString list)
               else
                 putStr $ "hvalfunc" (buildOutString list)
    return ()
    
    where
      
      buildOutString :: ... -> PState String
      buildOutString [] _ = return ""
      buildOutString ((OutString x):xs) state = do
          restString <- "holeValueFunc" (buildOutString xs)
          return (x ++ restString)
      buildOutString ((OutVar x):xs) = do  
          state <- get                            
          let stringVal = 
                case x of
                  StringVar_Var _          ->        getMapVal $ M.lookup x (stringVars state) 
                  NumVar_Var (IntVar _)    -> show $ getMapVal $ M.lookup x (intVars state)
                  NumVar_Var (FloatVar _)  -> show $ getMapVal $ M.lookup x (floatVars state)
          
          restString <- "holevalfunc" (buildOutString xs)
          return (stringVal ++ restString) -}
    state <- get
    let printStr = foldl (++) "" $ map (flip buildOutString state) list
    liftIO $ if printLn
               then
                 --putStrLn (buildOutString list state)
                 putStrLn printStr
               else
                 --putStr (buildOutString list state)
                 putStr printStr
    --return ()
    
    where
      {-
      buildOutString :: [Output] -> ProgramState -> String
      buildOutString [] _ = ""
      buildOutString ((OutString x):xs) state = x ++ (buildOutString xs state)
      buildOutString ((OutVar x):xs) state =                                      
          let stringVal = 
                case x of
                  StringVar_Var _          ->        getMapVal $ M.lookup x (stringVars state) 
                  NumVar_Var (IntVar _)    -> show $ getMapVal $ M.lookup x (intVars state)
                  NumVar_Var (FloatVar _)  -> show $ getMapVal $ M.lookup x (floatVars state)
          in
          stringVal ++ (buildOutString xs state)-}

      buildOutString :: Output -> ProgramState -> String
      buildOutString (OutString x) _ = x 
      buildOutString (OutVar x) state =                                      
                case x of
                  StringVar_Var _          ->        getMapVal $ M.lookup x (stringVars state) 
                  NumVar_Var (IntVar _)    -> show $ getMapVal $ M.lookup x (intVars state)
                  NumVar_Var (FloatVar _)  -> show $ getMapVal $ M.lookup x (floatVars state)


evalCommand NOOP = return ()            

-- end is not right this way, cause in c64 a program can be resumed
evalCommand End = do
    state <- get
    put $ state { progFinished = True }           

-- TODO: jumping to a wrong number should kill the program, maybe check this by parsing ??
evalCommand (Goto nr) = do
    state <- get
    put $ state { nextPos = nr }      
    return ()
   

evalCommand (ControlStructure (If boolExpr commands)) = do
    state <- get
    --let bVal = evalBoolExpression boolExpr state
    --let (bVal,nstate) = evalBoolExpression boolExpr state
    --put nstate
    bVal <- evalBoolExpression boolExpr
    if bVal
      then
        --evalAllCommands commands
        mapM_ evalCommand commands
      else
        return ()
                                      


evalCommand (ArithAssignment var numExpr) = do
    state <- get
    --let res = evalExpression numExpr state
    --let (res,nstate) = runState (evalExpression numExpr) state
    --let (res,nstate) = evalExpression numExpr state
    --put nstate
    res <- evalExpression numExpr
    case var of
       FloatVar _ -> updateFloatVar (NumVar_Var var) res 
       IntVar   _ -> updateIntVar (NumVar_Var var) (truncate res) 
    return ()


evalCommand (StringAssignment var stringExpr) = do
    --state <- get  
    val <- evalStringExpression stringExpr
    updateStringVar (StringVar_Var var) val
    return ()


evalCommand (ControlStructure (For var (start,step,end) commands)) = do
    --state <- get
    -- only reading, should not change state
    --let start' = makeFloat start state -- evalState (makeFloat start) state
    --let step'  = makeFloat step state   -- evalState (makeFloat step) state
    --let stop'  = makeFloat end state   -- evalState (makeFloat stop) state
    start' <- makeFloat start -- evalState (makeFloat start) state
    step'  <- makeFloat step    -- evalState (makeFloat step) state
    stop'  <- makeFloat end    -- evalState (makeFloat stop) state
    evalFor var  start' step' stop' (concat $ map snd commands) True
    
   where
      evalFor var' start step end commands isFirst = do
          state <- get
          let var = NumVar_Var var'
          if isFirst
            then 
              case var of
                NumVar_Var (FloatVar _ ) -> updateFloatVar var start
                NumVar_Var (IntVar _ )   -> updateIntVar var (truncate start)
            else
              return () 

          state1 <- get
          let varVal =  
               case var' of
                 IntVar _   -> fromIntegral $ getMapVal $ M.lookup var (intVars state1)
                 FloatVar _ -> getMapVal $ M.lookup var (floatVars state1)
          
          if (varVal > end)
            then
              return ()
            else do
              --evalAllCommands commands
              mapM_ evalCommand commands
              case var of
                NumVar_Var (FloatVar _ ) -> updateFloatVar var (varVal + step)
                NumVar_Var (IntVar _ )   -> updateIntVar var (truncate (varVal + step))
              evalFor var' start step end commands False
     

evalCommand (ControlStructure (GoSub lnNr)) = do
    state <- get
    --put $ state { backJumpAdressStack = (currentLine state) : (backJumpAdressStack state) }
    put $ state { backJumpAdressStack = (nextPos state) : (backJumpAdressStack state) }
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

{-
listInsert :: [Var] -> IO String -> PState ()
listInsert [] _ = return ()
listInsert (x:xs) ioAct = do
    val <- liftIO $ ioAct

    case x of
      StringVar_Var _         -> updateStringVar x val
      NumVar_Var (IntVar _)   -> updateIntVar x (read val)
      NumVar_Var (FloatVar _) -> updateFloatVar x (read val)
                       
    listInsert xs ioAct
-}


insertIOValue :: Var -> IO String -> PState ()
insertIOValue x ioAct = do
    val <- liftIO $ ioAct

    case x of
      StringVar_Var _         -> updateStringVar x val
      NumVar_Var (IntVar _)   -> updateIntVar x (read val)
      NumVar_Var (FloatVar _) -> updateFloatVar x (read val)
    

