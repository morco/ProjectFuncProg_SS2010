module Nums where 
----------------------------------------------------- <Imports> ------------------------------------------------------

import BasicHap(NumExpr(..), Var(..), NumVar(..), NumFunction(..), Operand(..))
import qualified Data.Map as M

import ProgrammState

----------------------------------------------------- </Imports> -----------------------------------------------------



---------------------------------------------------- <Data types> ----------------------------------------------------



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


