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

-- TODO: 
--    ->  Use a bibliography type ??
--    ->  make a instance of Eq
-- A simple map type used for variables (var-name -> var-value)
{-data Map a b 
      = Empty
      | Map [(a,b)]


insert :: a -> b -> Map a b -> Map a b
insert key val Empty = Map [(key,val)]
insert key val (Map xs) = Map ([(key,val)] ++ xs)


getValue :: (Eq a, Show a) => a -> Map a b -> b
--getValue key Empty = error ("Map is empty! with key " ++ (show key))
getValue key Empty = error "Map is empty! with key "
getValue key (Map []) = error ("key not found " ++ show key)
getValue key (Map ((k,v):xs)) = 
         if key == k
             then v
             else getValue key (Map xs)
-}                                 

---------------------------------------------------- </Data types> ---------------------------------------------------


-------------------------------------------------------- <Main> ------------------------------------------------------

-- TODO: 
--    -> Use Happy?? (Alex seems to do the trick)
--    -> Speed it up, awfully slow even for very small examples

-- main principle:
--            -> get basic programm file path from arguments
--            -> open file
--            -> parse (currently only Alex!!)
--            -> interprete

main = do
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
--     -> putStr before getLine in same Line (how ???)
--evalCommand :: Command -> State -> IO State
evalCommand (Command (Input ((InputStuff lsComment var), printLn))) state = -- return state 
--evalCommand (Input ((InputStuff [x] var), printLn)) state = -- return state 
      do
         mapM_ putStrLn lsComment
                     --mapM_ putStr lsComment
                     {-case lsComment of
                        []  -> return ()
                        [x] -> if printLn
                                  then
                                    putStrLn x
                                  else
                                    putStr x-}
                     
         let vars = [var]
         listInsert vars getLine state
      where
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


evalCommand (ControlStructure (If boolExpr commands)) state = 
       do
         let bVal = 
              case boolExpr of
                 BoolExprVarConst _ _ _ -> 
                     case (var boolExpr) of
                       TkStringVar _ ->  
                                     --let
                                      --  f = (getBoolFunc (infixBoolFunc boolExpr)) (getConstant (const' boolExpr))
                                     --in
                                       -- f (getValue (var boolExpr) (stringVars state))
                          evalBoolFunc (infixBoolFunc boolExpr) (getMapVal $ M.lookup (var boolExpr) (stringVars state)) (show $ getConstant (const' boolExpr))
                       TkIntVar _    ->  
                                     --let
                                       -- f = (getBoolFunc (infixBoolFunc boolExpr)) (getConstant (const' boolExpr))
                                     --in
                                       -- f (getValue var (intVars state))
                          evalBoolFunc (infixBoolFunc boolExpr) (getMapVal $ M.lookup (var boolExpr) (intVars state)) (getConstant $ const' boolExpr)
                       TkFloatVar _  -> 
                                     --let
                                       -- f = (getBoolFunc (infixBoolFunc boolExpr)) (getConstant (const' boolExpr))
                                     --in
                                       -- f (getValue var (floatVars state))
                                     --evalBoolFunc (infixBoolFunc boolExpr) (getValue (var boolExpr) (floatVars state)) (getConstant $ const' boolExpr)
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
          --  print "Start"
            let state1 = --state
                 if isFirst
                   then 
                     updateVar var (show start) state
                   else
                     state 
            
        --    print ("After first: " ++ (show $ M.toList $ floatVars state1))
        --    print ("After send: " ++ (show $ M.lookup var (floatVars state1)))

            let varVal = --4 
                 case var of
                   TkIntVar _   -> fromIntegral $ getMapVal $ M.lookup var (intVars state1)
                   TkFloatVar _ -> getMapVal $ M.lookup var (floatVars state1)
                   _            -> error "No String vars allowed as for var!"

          --  let state4 = 
      --      print "Before equals"
          
            if (varVal > end)
            --if 3 == 5
                 then
                   return state
                 else
                   do
    --                 print "Start Rek"
                     state2 <- evalAllCommands commands state1
--                     print "end eval all"
                     let state3 = updateVar var (show $ varVal + step) state2
                     
  --                   print "Pre Rek"
 
                     evalFor var start step end commands state3 False

         --   return state
          {-  if varVal > end
               then 
                 return state
               else
                 return state-}
      
     
      makeFloat (TkIntConst x) = fromIntegral x
      makeFloat (TkFloatConst x) = x



evalAllCommands [] state = return state
--evalAllCommands ((ControlStructure x):xs) state = evalCommand x state >>= evalAllCommands xs
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

evalArithFunc str arg1 arg2 
        | str == "+" = arg1 + arg2


--makeFloat (IntVar x) = FloatConst $ fromIntegral $ getMapVal $ M.lookup (TkIntVar x) (intVars state)
--makeFloat (FloatVar x) = FloatConst $ getMapVal $ M.lookup (TkFloatVar x) (floatVars state)
--makeFloat (IntConst x) = FloatConst $ fromIntegral x
--makeFloat () = flconst

{-
getBoolFunc str
        | str == "==" = (==)
        | str == "/=" = (/=)
        | str == "<" = (<)
        | str == ">" = (>)
        | str == "<=" = (<=)
        | str == ">=" = (>=)
-}

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


