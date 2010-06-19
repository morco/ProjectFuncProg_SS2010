module Bool (evalBoolExpression) where

------------------------------------------------- <Imports> ------------------------------------------------------

import BasicHap(BoolExpr(..))
--import Control.Monad.State

import Strings
import ProgrammState(ProgramState)
import Nums

------------------------------------------------- </Imports> -----------------------------------------------------



{-
evalBoolExpression :: BoolExpr -> ProgramState -> Bool 
evalBoolExpression (BoolExprNum (numExpr1,numExpr2) strOp) state = 
    evalBoolFunc strOp (evalExpression numExpr1 state) (evalExpression numExpr2 state) 
evalBoolExpression (BoolExprString (strExpr1,strExpr2) strOp) state = 
    evalBoolFunc strOp (evalStringExpression strExpr1 state) (evalStringExpression strExpr2 state)
evalBoolExpression (BoolExprLog (boolExpr1,boolExpr2) strOp) state = 
    evalBoolLogic strOp (evalBoolExpression boolExpr1 state) (evalBoolExpression boolExpr2 state)
-}


-- This function evaluates boolen expressions, which means...
--   -> Comparison of 2 numerical expressions
--   -> Comparison of 2 string expressions
--   -> Adjunction of 2 boolean values with logical operators
--
-- It is currently implemented the pure way, even it uses state, but normally only reading, so implementing 
--  it in state monad seems currently more complicated than threading the state as argument
-- Because it can now also change the state (num expressions can do this because of random numbers, maybe 
--   more in the future) the return type is now a tupel with the result an the maybe changed state.
--  This makes it even more resonable to put in in state monad, but i currently see not the right way to do it
evalBoolExpression :: BoolExpr -> ProgramState -> (Bool,ProgramState) 
evalBoolExpression (BoolExprNum (numExpr1,numExpr2) strOp) state = 
    let 
       (val1,nstate1) = evalExpression numExpr1 state 
       (val2,nstate2) = evalExpression numExpr2 nstate1
    in (evalBoolFunc strOp val1 val2,nstate2)
evalBoolExpression (BoolExprString (strExpr1,strExpr2) strOp) state = 
    (evalBoolFunc strOp (evalStringExpression strExpr1 state) (evalStringExpression strExpr2 state),state)
evalBoolExpression (BoolExprLog (boolExpr1,boolExpr2) strOp) state = 
    let
       (val1,nstate1) = evalBoolExpression boolExpr1 state 
       (val2,nstate2) = evalBoolExpression boolExpr2 nstate1
    in (evalBoolLogic strOp val1 val2,nstate2)


{-
evalBoolExpression :: BoolExpr -> PState Bool 
evalBoolExpression (BoolExprNum (numExpr1,numExpr2) strOp) = do
    state <- get
    let (nstate,res1) = runState (evalExpression numExpr1) state
    let (nstate',res2) = runState (evalExpression numExpr2) state
    put nstate'
    return $ evalBoolFunc strOp res1 res2
evalBoolExpression (BoolExprString (strExpr1,strExpr2) strOp) = 
    return $ evalBoolFunc strOp (evalStringExpression strExpr1 state) (evalStringExpression strExpr2 state)
evalBoolExpression (BoolExprLog (boolExpr1,boolExpr2) strOp) = do
    state <- get
    let (nstate,res1) = runState (evalBoolExpression boolExpr1) state
    let (nstate',res2) = runState (evalBoolExpression boolExpr2) state
    put nstate'
    return $ evalBoolLogic strOp res1 res2
-}


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


