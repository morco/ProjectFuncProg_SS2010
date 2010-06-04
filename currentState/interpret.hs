----------------------------------------------------- <Imports> ------------------------------------------------------

import BasicHap
import BasicAlex
import IO
import System ( getArgs )
import qualified Data.Map as M
import Data.List

----------------------------------------------------- </Imports> -----------------------------------------------------



---------------------------------------------------- <Data types> ----------------------------------------------------

-- This type is for recording the state of the programm, which means currently the values of the variables
data State =
      State {
         stringVars :: (M.Map Var String),
         intVars    :: (M.Map Var Int),
         floatVars  :: (M.Map Var Float),
         completeProgramm :: [(Int, [Command])]
      }


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
        let state = State { 
                       stringVars = M.empty, 
                       intVars    = M.empty, 
                       floatVars  = M.empty,
                       completeProgramm = pTree
                     }

        interpret pTree state
        hClose handle

------------------------------------------------------- </Main> ------------------------------------------------------

--interpret :: SyntaxTree -> State -> IO State
interpret [] state = return state
interpret ((_,commands):xs) state = 
      do
        newState <- evalAllCommands commands state
        interpret xs newState



-- TODO: 
--     -> action is very, very ugly!!! (Generalizing things seems possible)
evalCommand :: Command -> State -> IO State
evalCommand (Command (Input ((InputStuff lsComment var), printLn))) state =  
      do
         case lsComment of
           []  -> return ()
           [x] -> if printLn
                       then
                         putStrLn x
                       else
                         putStr x
                     
         let vars = [var]
         listInsert vars (putStr "? " >> getLine) state
      where
         -- TODO: input seems to have only one var at max, so maybe simplify
         listInsert [] _ state = return state
         listInsert (x:xs) ioAct state = 
              do
                 val <- ioAct

                 let newState = updateVar x val state 
                       
                 listInsert xs ioAct newState


evalCommand (Command (Print (list, printLn))) state = 
       do 
         if printLn
           then
             putStrLn (buildOutString list state)
           else
             putStr (buildOutString list state)
         return state
      where
         buildOutString [] _ = ""
         buildOutString ((OutString x):xs) state = x ++ (buildOutString xs state)
         buildOutString ((OutVar x):xs) state =                               
               let
                 stringVal = 
                    case x of
                      TkStringVar _ -> getMapVal $ M.lookup x (stringVars state) 
                      TkIntVar _    -> show $ getMapVal $ M.lookup x (intVars state)
                      TkFloatVar _  -> show $ getMapVal $ M.lookup x (floatVars state)
               in
                 stringVal ++ (buildOutString xs state)

-- TODO: Only on case of BoolExpr is handled currently, extend!
evalCommand (ControlStructure (If boolExpr commands)) state = 
       do
         let bVal = 
              case boolExpr of
                 BoolExprVarConst _ _ _ -> 
                     case (var boolExpr) of
                       TkStringVar _ ->  
                          evalBoolFunc (infixBoolFunc boolExpr) (getMapVal $ M.lookup (var boolExpr) (stringVars state)) (show $ getConstant (const' boolExpr))
                       TkIntVar _    ->  
                          evalBoolFunc (infixBoolFunc boolExpr) (getMapVal $ M.lookup (var boolExpr) (intVars state)) (getConstant $ const' boolExpr)
                       TkFloatVar _  -> 
                          evalBoolFunc (infixBoolFunc boolExpr) (getMapVal $ M.lookup (var boolExpr) (floatVars state)) 5
         if bVal
           then
              evalAllCommands commands state
           else
              return state
                                      

evalCommand NOOP state = return state            


evalCommand (Goto nr) state = 
    let
      newPos = dropWhile (\(x,_) -> x /= nr ) (completeProgramm state)
    in
      interpret newPos state          

-- Frage: Zuweisung an String-Variable so ohne weiteres moeglich ???
evalCommand (Assignment var numExpr) state = return $ updateVar var (show $ evalExpression numExpr state) state


evalCommand (ControlStructure (For var (start,step,end) commands)) state = 
      evalFor var (makeFloat start) (makeFloat step) (makeFloat end) (concat $ map snd commands) state True
    where
      evalFor var start step end commands state isFirst = 
          do
            let state1 = 
                 if isFirst
                   then 
                     updateVar var (show start) state
                   else
                     state 

            let varVal =  
                 case var of
                   TkIntVar _   -> fromIntegral $ getMapVal $ M.lookup var (intVars state1)
                   TkFloatVar _ -> getMapVal $ M.lookup var (floatVars state1)
                   _            -> error "No String vars allowed as for var!"
          
            if (varVal > end)
                 then
                   return state
                 else
                   do
                     state2 <- evalAllCommands commands state1
                     let state3 = updateVar var (show $ varVal + step) state2
                     evalFor var start step end commands state3 False
      
     
      makeFloat (TkIntConst x) = fromIntegral x
      makeFloat (TkFloatConst x) = x



evalAllCommands :: [Command] -> State -> IO State
evalAllCommands [] state = return state
evalAllCommands (x:xs) state = evalCommand x state >>= evalAllCommands xs


--getConstant (TkIntConst x) = read (show x)
--getConstant (TkFloatConst x) = read (show x)
getConstant (TkIntConst x) = x
getConstant (TkFloatConst x) = -1

-- geht so leider nicht
{-useOnVariableContent var func state =
                   case var of
                      TkStringVar _ -> func getValue var (stringVars state)
                      TkIntVar _    -> func getValue var (intVars state)
                      TkFloatVar _  -> func getValue var (floatVars state)
-}

getMapVal (Just x) = x
getMapVal _  = error "Var not found!"


evalExpression (NumOp (IntConst x)) state = fromIntegral x
--evalExpression (NumExpr ((IntConst x),(IntConst y)) op) state = evalArithFunc op x y
evalExpression (NumExpr ((FloatConst x),(FloatConst y)) op) state = evalArithFunc op x y
evalExpression (NumExpr (op1,op2) op) state =
      evalExpression (NumExpr (makeFloatConst op1,makeFloatConst op2) op) state 
  where
     makeFloatConst (IntVar x) = FloatConst $ fromIntegral $ getMapVal $ M.lookup (TkIntVar x) (intVars state)
     makeFloatConst (FloatVar x) = FloatConst $ getMapVal $ M.lookup (TkFloatVar x) (floatVars state)
     makeFloatConst (IntConst x) = FloatConst $ fromIntegral x
     makeFloatConst flconst = flconst

evalArithFunc :: (Num a) => String -> a -> a -> a
evalArithFunc str arg1 arg2 
        | str == "+" = arg1 + arg2


--makeFloat (IntVar x) = FloatConst $ fromIntegral $ getMapVal $ M.lookup (TkIntVar x) (intVars state)
--makeFloat (FloatVar x) = FloatConst $ getMapVal $ M.lookup (TkFloatVar x) (floatVars state)
--makeFloat (IntConst x) = FloatConst $ fromIntegral x
--makeFloat () = flconst


evalBoolFunc :: (Ord a) => String -> a -> a -> Bool
evalBoolFunc str arg1 arg2
        | str == "==" = arg1 == arg2
        | str == "/=" = arg1 /= arg2
        | str == "<" = arg1 < arg2
        | str == ">" = arg1 > arg2
        | str == "<=" = arg1 <= arg2
        | str == ">=" = arg1 >= arg2



updateVar var val state =  
    let
       --val' = show val
       val' = val 
         {-case var of -- hier wuerd ich eigentlich gerne sowas sagen, wie wenn Val vom Typ String
           TkStringVar _ -> val
           _      -> show val-}
    in                  
      case var of
        TkStringVar _ -> state {
                            stringVars = M.alter (\ _ -> Just val') var (stringVars state)
                          }
        TkIntVar _    -> state {
                            intVars = M.alter (\ _ -> Just $ truncate (read val' :: Float)) var (intVars state)
                          }
        TkFloatVar _  -> state {
                            floatVars = M.alter (\ _ -> Just $ read val') var (floatVars state)
                          }


