----------------------------------------------------- <Imports> ------------------------------------------------------

import BasicHap
import BasicAlex
import IO
import System ( getArgs )

----------------------------------------------------- </Imports> -----------------------------------------------------



---------------------------------------------------- <Data types> ----------------------------------------------------

-- This type is for recording the state of the programm, which means currently the values of the variables
data State =
      State {
         stringVars :: (Map Var String),
         intVars    :: (Map Var Int),
         floatVars  :: (Map Var Float)
      }

-- TODO: 
--    ->  Use a bibliography type ??
--    ->  make a instance of Eq
-- A simple map type used for variables (var-name -> var-value)
data Map a b 
      = Empty
      | Map [(a,b)]


insert :: a -> b -> Map a b -> Map a b
insert key val Empty = Map [(key,val)]
insert key val (Map xs) = Map (xs ++ [(key,val)])


getValue :: (Eq a, Show a) => a -> Map a b -> b
--getValue key Empty = error ("Map is empty! with key " ++ (show key))
getValue key Empty = error "Map is empty! with key "
getValue key (Map []) = error ("key not found " ++ show key)
getValue key (Map ((k,v):xs)) = 
         if key == k
             then v
             else getValue key (Map xs)
                                   

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
        let state = State { 
                       stringVars = Empty, 
                       intVars    = Empty, 
                       floatVars  = Empty
                     }

        interpret (getParseTree contents) state
        hClose handle

------------------------------------------------------- </Main> ------------------------------------------------------

interpret :: SyntaxTree -> State -> IO State
interpret (Line _ []) state = return state
--interpret (Line ln ((ControlStructure x):xs)) state = evalCommand x state >>= interpret (Line ln xs) 
--interpret (Line ln ((Command x):xs)) state = evalCommand x state >>= interpret (Line ln xs) 
interpret (Line ln (x:xs)) state = evalCommand x state >>= interpret (Line ln xs) 
--interpret (Line ln ((Command x):xs)) state = interpret (Line ln xs) state 
interpret (Lines x otherCommands) state = 
            do
              newState <- interpret x state
              interpret otherCommands newState
              --return ()



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

                       let newState = 
                            case x of
                              TkStringVar _ -> State {
                                                  stringVars = insert x val (stringVars state),
                                                  intVars = intVars state,
                                                  floatVars = floatVars state
                                                }
                              TkIntVar _    -> State {
                                                  stringVars = stringVars state,
                                                  intVars = insert x (read val) (intVars state),
                                                  floatVars = floatVars state
                                                }
                              TkFloatVar _  -> State {
                                                  stringVars = stringVars state,
                                                  intVars = intVars state,
                                                  floatVars = insert x (read val) (floatVars state)
                                                }
                       
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
                                      TkStringVar _ -> getValue x (stringVars state)
                                      TkIntVar _    -> show $ getValue x (intVars state)
                                      TkFloatVar _  -> show $ getValue x (floatVars state)
                              in
                                stringVal ++ (buildOutString xs state)


evalCommand (ControlStructure (IF boolExpr commands)) state = 
            do
              let bVal = case boolExpr of
                           BoolExprVarConst _ _ _ -> 
                                 case (var boolExpr) of
                                   TkStringVar _ ->  
                                     --let
                                      --  f = (getBoolFunc (infixBoolFunc boolExpr)) (getConstant (const' boolExpr))
                                     --in
                                       -- f (getValue (var boolExpr) (stringVars state))
                                     evalBoolFunc (infixBoolFunc boolExpr) (getValue (var boolExpr) (stringVars state)) (show $ getConstant (const' boolExpr))
                                   TkIntVar _    ->  
                                     --let
                                       -- f = (getBoolFunc (infixBoolFunc boolExpr)) (getConstant (const' boolExpr))
                                     --in
                                       -- f (getValue var (intVars state))
                                     evalBoolFunc (infixBoolFunc boolExpr) (getValue (var boolExpr) (intVars state)) (getConstant $ const' boolExpr)
                                   TkFloatVar _  -> 
                                     --let
                                       -- f = (getBoolFunc (infixBoolFunc boolExpr)) (getConstant (const' boolExpr))
                                     --in
                                       -- f (getValue var (floatVars state))
                                     --evalBoolFunc (infixBoolFunc boolExpr) (getValue (var boolExpr) (floatVars state)) (getConstant $ const' boolExpr)
                                     evalBoolFunc (infixBoolFunc boolExpr) (getValue (var boolExpr) (floatVars state)) 5
              if bVal
                then
                   evalAllCommands commands state
                else
                   return state
                                      

evalCommand NOOP state = return state            



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
