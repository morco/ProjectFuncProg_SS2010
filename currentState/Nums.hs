module Nums where 
----------------------------------------------------- <Imports> ------------------------------------------------------

import BasicHap(NumExpr(..), Var(..), NumVar(..), NumFunction(..), Operand(..))
import qualified Data.Map as M

import ProgrammState

import Control.Monad.State

----------------------------------------------------- </Imports> -----------------------------------------------------



---------------------------------------------------- <Data types> ----------------------------------------------------


{-
evalExpression (NumFunc x) state = evalNumFunc x state
--evalExpression (NumOp (IntConst x)) _ = fromIntegral x
evalExpression (NumOp other) state = makeFloat other state
evalExpression (NumExpr ((FloatConst x),(FloatConst y)) op) state = evalArithFunc op x y
evalExpression (NumExpr (op1,op2) op) state =
      evalExpression (NumExpr (FloatConst $ makeFloat op1 state,FloatConst $ makeFloat op2 state) op) state 
-}


evalExpression :: NumExpr -> ProgramState -> Float
evalExpression (NumFunc x) state = evalNumFunc x state
evalExpression (NumOp x) state = makeFloat x state
--evalExpression (NumExpr (NumExpr x y, op2) op) state = 
  --  evalArithFunc op (evalExpression (NumExpr x y) state) (evalExpression op2 state)
evalExpression (NumExpr (op1, op2) op) state = 
    evalArithFunc op (evalExpression op1 state) (evalExpression op2 state)


{-
evalExpression :: NumExpr -> PState Float
evalExpression (NumFunc x) = get >>= return $ evalNumFunc x 
evalExpression (NumOp x) = get >>= return $ makeFloat x 
evalExpression (NumExpr (op1, op2) op) = do
    state <- get
    val1 <- (evalStateT (evalExpression op1) state)
    val2 <- (evalStateT (evalExpression op2) state)
    return $ evalArithFunc op val1 val2 
-}

makeFloat :: Operand -> ProgramState -> Float
makeFloat (OpVar (IntVar x)) state = fromIntegral $ getMapVal $ M.lookup (NumVar_Var (IntVar x)) (intVars state)
makeFloat (OpVar (FloatVar x)) state = getMapVal $ M.lookup (NumVar_Var (FloatVar x)) (floatVars state)
makeFloat (IntConst x) _ = fromIntegral x
makeFloat (FloatConst x) _ = x

{-
makeFloat :: Operand -> PState Float
makeFloat (OpVar (IntVar x))= fromIntegral $ getMapVal $ M.lookup (NumVar_Var (IntVar x)) (intVars state)
makeFloat (OpVar (FloatVar x)) state = getMapVal $ M.lookup (NumVar_Var (FloatVar x)) (floatVars state)
makeFloat (IntConst x) _ = return $ fromIntegral x
makeFloat (FloatConst x) _ = return x
-}

evalNumFunc :: NumFunction -> ProgramState -> Float 
evalNumFunc (LenVar strVar) state = 
    fromIntegral $ length $ getMapVal $ M.lookup (StringVar_Var strVar) (stringVars state)
      

{-
evalNumFunc :: NumFunction -> PState Float 
evalNumFunc (LenVar strVar) = 
    fromIntegral $ length $ getMapVal $ M.lookup (StringVar_Var strVar) (stringVars state)
-}

--evalArithFunc :: (Num a) => String -> a -> a -> a
evalArithFunc str arg1 arg2 
        | str == "+" = arg1 + arg2
        | str == "-" = arg1 - arg2
        | str == "*" = arg1 * arg2
        | str == "/" = arg1 / arg2


