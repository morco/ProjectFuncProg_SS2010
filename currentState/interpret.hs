----------------------------------------------------- <Imports> ------------------------------------------------------

import BasicHap
import IO
import System ( getArgs )
import qualified Data.Map as M
import Data.List
import Control.Monad.State

import Strings
import ProgrammState
import Nums

----------------------------------------------------- </Imports> -----------------------------------------------------



---------------------------------------------------- <Data types> ----------------------------------------------------
{-
-- This type is for recording the state of the programm, which means currently the values of the variables
data State =
      State {
         stringVars :: (M.Map Var String),
         intVars    :: (M.Map Var Int),
         floatVars  :: (M.Map Var Float),
         completeProgramm :: [(Int, [Command])],
         nextPos :: Int
      }
-}

---------------------------------------------------- </Data types> ---------------------------------------------------


-------------------------------------------------------- <Main> ------------------------------------------------------

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

        args <- getArgs
        handle <- openFile (head args) ReadMode
        contents <- hGetContents handle
        let pTree = getParseTree contents
        let state = getNewState pTree
        {-let state = State { 
                       stringVars = M.empty, 
                       intVars    = M.empty, 
                       floatVars  = M.empty,
                       completeProgramm = pTree,
                       nextPos = 0
                     }
-}
       -- interpret pTree state
        runStateT (initState >> interpret pTree ) state
        hClose handle

------------------------------------------------------- </Main> ------------------------------------------------------


interpret :: Program -> PState ()
interpret [] = return ()
interpret ((lnNr,commands):xs) = do
    updateStateNextPos xs 
    newState1 <- get
    evalAllCommands commands
    newState2 <- get
    let realNextPos = (nextPos newState2)
    if (nextPos newState1) == realNextPos 
       then 
         interpret xs
       else do
         let newList = dropWhile (\(a,_) -> a /= realNextPos) (completeProgram newState2)
         interpret newList                 



evalAllCommands :: [Command] -> PState ()
evalAllCommands [] = return ()
evalAllCommands (x:xs) = evalCommand x >> evalAllCommands xs 


-- TODO: 
--     -> action is very, very ugly!!! (Generalizing things seems possible)
evalCommand :: Command -> PState ()
evalCommand (Command (Input ((InputStuff lsComment var), printLn))) = do 
    liftIO $ case lsComment of
               []  -> return ()
               [x] -> if printLn
                         then
                           putStrLn x
                         else
                           putStr x
                     
    let vars = [var]
    listInsert vars (putStr "? " >> getLine)

    where
         -- TODO: input seems to have only one var at max, so maybe simplify
      listInsert :: [Var] -> IO String -> PState ()
      listInsert [] _ = return ()
      listInsert (x:xs) ioAct = do
          --liftIO $ val <- ioAct
          val <- liftIO $ ioAct
          --val <- ioAct

          case x of
            StringVar_Var _         -> updateStringVar x val
            NumVar_Var (IntVar _)   -> updateIntVar x (read val)
            NumVar_Var (FloatVar _) -> updateFloatVar x (read val)
                       
          listInsert xs ioAct


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
    liftIO $ if printLn
               then
                 putStrLn (buildOutString list state)
               else
                 putStr (buildOutString list state)
    return ()
    
    where
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
          stringVal ++ (buildOutString xs state)


evalCommand NOOP = return ()            


evalCommand (Goto nr) = do
    state <- get
    put $ state { nextPos = nr }      
    return ()
   

evalCommand (ControlStructure (If boolExpr commands)) = do
    state <- get
    let bVal = evalBoolExpression boolExpr state
    if bVal
      then
        evalAllCommands commands
      else
        return ()
                                      


evalCommand (ArithAssignment var numExpr) = do
    state <- get
    let res = evalExpression numExpr state
    case var of
       FloatVar _ -> updateFloatVar (NumVar_Var var) res 
       IntVar   _ -> updateIntVar (NumVar_Var var) (truncate res) 
    return ()


evalCommand (StringAssignment var stringExpr) = do
    state <- get   
    updateStringVar (StringVar_Var var) (evalStringExpression stringExpr state)
    return ()


evalCommand (ControlStructure (For var (start,step,end) commands)) = do
    state <- get
    evalFor var (makeFloat start state) (makeFloat step state) (makeFloat end state) (concat $ map snd commands) True
    
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
              evalAllCommands commands
              case var of
                NumVar_Var (FloatVar _ ) -> updateFloatVar var (varVal + step)
                NumVar_Var (IntVar _ )   -> updateIntVar var (truncate (varVal + step))
              evalFor var' start step end commands False
     





--getConstant (TkIntConst x) = read (show x)
--getConstant (TkFloatConst x) = read (show x)
--getConstant (TkIntConst x) = x
--getConstant (TkFloatConst x) = -1

evalBoolExpression :: BoolExpr -> ProgramState -> Bool 
evalBoolExpression (BoolExprNum (numExpr1,numExpr2) strOp) state = 
    evalBoolFunc strOp (evalExpression numExpr1 state) (evalExpression numExpr2 state) 
evalBoolExpression (BoolExprString (strExpr1,strExpr2) strOp) state = 
    evalBoolFunc strOp (evalStringExpression strExpr1 state) (evalStringExpression strExpr2 state)
evalBoolExpression (BoolExprLog (boolExpr1,boolExpr2) strOp) state = 
    evalBoolLogic strOp (evalBoolExpression boolExpr1 state) (evalBoolExpression boolExpr2 state)


-- Union both following Functions ??
evalBoolLogic :: String -> Bool -> Bool -> Bool
evalBoolLogic str arg1 arg2
       | str == "||" = arg1 || arg2
       | str == "&&" = arg1 && arg2
--       | str == "neg"


evalBoolFunc :: (Ord a) => String -> a -> a -> Bool
evalBoolFunc str arg1 arg2
        | str == "==" = arg1 == arg2
        | str == "/=" = arg1 /= arg2
        | str == "<" = arg1 < arg2
        | str == ">" = arg1 > arg2
        | str == "<=" = arg1 <= arg2
        | str == ">=" = arg1 >= arg2


