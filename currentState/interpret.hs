----------------------------------------------------- <Imports> ------------------------------------------------------

import BasicHap
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
         completeProgramm :: [(Int, [Command])],
         nextPos :: Int
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
                       completeProgramm = pTree,
                       nextPos = 0
                     }

       -- interpret pTree state
        interpret pTree (modState pTree state)
        hClose handle

------------------------------------------------------- </Main> ------------------------------------------------------

--interpret :: SyntaxTree -> State -> IO State
interpret [] state = return state
interpret ((lnNr,commands):xs) state = 
      do
        let newState1 = modState xs state
        newState2 <- evalAllCommands commands newState1
        let realNextPos = (nextPos newState2)
        if (nextPos newState1) == realNextPos 
           then 
             interpret xs newState2
           else
             do
               let newList = dropWhile (\(a,_) -> a /= realNextPos) (completeProgramm state)
               interpret newList newState2                  


modState [] state = state
modState ((lnNrNext,_):_) state = state { nextPos = lnNrNext}


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
                      StringVar_Var _ -> getMapVal $ M.lookup x (stringVars state) 
                      NumVar_Var (IntVar _)    -> show $ getMapVal $ M.lookup x (intVars state)
                      NumVar_Var (FloatVar _)  -> show $ getMapVal $ M.lookup x (floatVars state)
               in
                 stringVal ++ (buildOutString xs state)


evalCommand (ControlStructure (If boolExpr commands)) state = 
       do
         let bVal = 
              case boolExpr of
                 BoolExprNum (numExpr1,numExpr2) strOp -> evalBoolFunc strOp (evalExpression numExpr1 state) (evalExpression numExpr2 state) 
                 BoolExprString (strExpr1,strExpr2) strOp -> evalBoolFunc strOp (evalStringExpression strExpr1 state) (evalStringExpression strExpr2 state) 
         if bVal
           then
              evalAllCommands commands state
           else
              return state
                                      

evalCommand NOOP state = return state            


evalCommand (Goto nr) state = return state { nextPos = nr }         


-- Frage: Zuweisung an String-Variable so ohne weiteres moeglich ???
evalCommand (ArithAssignment var numExpr) state = return $ updateVar (NumVar_Var var) (show $ evalExpression numExpr state) state

evalCommand (StringAssignment var stringExpr) state = return $ updateVar (StringVar_Var var) (evalStringExpression stringExpr state) state

evalCommand (ControlStructure (For var (start,step,end) commands)) state = 
      evalFor var (makeFloat start state) (makeFloat step state) (makeFloat end state) (concat $ map snd commands) state True
    where
      evalFor var' start step end commands state isFirst = 
          do
            let var = NumVar_Var var'
            let state1 = 
                 if isFirst
                   then 
                     updateVar var (show start) state
                   else
                     state 

            let varVal =  
                 case var' of
                   IntVar _   -> fromIntegral $ getMapVal $ M.lookup var (intVars state1)
                   FloatVar _ -> getMapVal $ M.lookup var (floatVars state1)
          
            if (varVal > end)
                 then
                   return state
                 else
                   do
                     state2 <- evalAllCommands commands state1
                     let state3 = updateVar var (show $ varVal + step) state2
                     evalFor var' start step end commands state3 False
     



evalAllCommands :: [Command] -> State -> IO State
evalAllCommands [] state = return state
evalAllCommands (x:xs) state = evalCommand x state >>= evalAllCommands xs


--getConstant (TkIntConst x) = read (show x)
--getConstant (TkFloatConst x) = read (show x)
--getConstant (TkIntConst x) = x
--getConstant (TkFloatConst x) = -1


getMapVal (Just x) = x
getMapVal _  = error "Var not found!"


evalExpression (NumFunc x) state = evalNumFunc x state
evalExpression (NumOp (IntConst x)) _ = fromIntegral x
evalExpression (NumOp other) state = makeFloat other state
evalExpression (NumExpr ((FloatConst x),(FloatConst y)) op) state = evalArithFunc op x y
evalExpression (NumExpr (op1,op2) op) state =
      evalExpression (NumExpr (FloatConst $ makeFloat op1 state,FloatConst $ makeFloat op2 state) op) state 


makeFloat (OpVar (IntVar x)) state = fromIntegral $ getMapVal $ M.lookup (NumVar_Var (IntVar x)) (intVars state)
makeFloat (OpVar (FloatVar x)) state = getMapVal $ M.lookup (NumVar_Var (FloatVar x)) (floatVars state)
makeFloat (IntConst x) _ = fromIntegral x
makeFloat (FloatConst x) _ = x


evalNumFunc (LenVar strVar) state = fromIntegral $ length $ getMapVal $ M.lookup (StringVar_Var strVar) (stringVars state)
      


evalArithFunc :: (Num a) => String -> a -> a -> a
evalArithFunc str arg1 arg2 
        | str == "+" = arg1 + arg2



evalStringExpression (StringOp x) state = evalBasicString x state
evalStringExpression (StringExpr (bstr1,bstr2) strOp) state = evalStringFunc strOp (evalBasicString bstr1 state) (evalBasicString bstr2 state)

evalBasicString (StringLiteral x) _ = x
evalBasicString (StringVar_BString x) state = getMapVal $ M.lookup (StringVar_Var x) (stringVars state)


evalStringFunc op op1 op2
        | op == "+" = op1 ++ op2


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
        StringVar_Var _ -> state {
                            stringVars = M.alter (\ _ -> Just val') var (stringVars state)
                          }
        NumVar_Var (IntVar _)    -> state {
                            intVars = M.alter (\ _ -> Just $ truncate (read val' :: Float)) var (intVars state)
                          }
        NumVar_Var (FloatVar _)  -> state {
                            floatVars = M.alter (\ _ -> Just $ read val') var (floatVars state)
                          }


