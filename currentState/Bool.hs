module Bool (evalBoolExpression) where

------------------------------------------------- <Imports> ------------------------------------------------------

import Parser.ParserTypes(BoolExpr(..))
import Control.Monad.State

--import Strings
import ProgrammState
import Expressions

------------------------------------------------- </Imports> -----------------------------------------------------



-- This function evaluates boolen expressions, which means...
--   -> Comparison of 2 numerical expressions
--   -> Comparison of 2 string expressions
--   -> Adjunction of 2 boolean values with logical operators
--
-- Now in state monad cause it reads maybe variables and can also change the state.

evalBoolExpression :: BoolExpr -> PState Bool
evalBoolExpression (BoolExprNum (numExpr1,numExpr2) strOp) = do
    val1 <- evalExpression numExpr1
    val2 <- evalExpression numExpr2
    return $ evalBoolFunc strOp val1 val2

evalBoolExpression (BoolExprString (strExpr1,strExpr2) strOp) = do
    val1 <- evalStringExpression strExpr1
    val2 <- evalStringExpression strExpr2 
    return $ evalBoolFunc strOp val1 val2
 
evalBoolExpression (BoolExprLog (boolExpr1,boolExpr2) strOp) = do
    val1 <- evalBoolExpression boolExpr1 
    val2 <- evalBoolExpression boolExpr2 
    return $ evalBoolLogic strOp val1 val2




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


