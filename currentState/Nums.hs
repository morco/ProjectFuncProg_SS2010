module Nums 
(
  makeFloat,
  evalExpression
)
where 

------------------------------------------------- <Imports> ------------------------------------------------------

import BasicHap(NumExpr(..), Var(..), NumVar(..), NumFunction(..), Operand(..))
import qualified Data.Map as M

import ProgrammState

--import Control.Monad.State

------------------------------------------------- </Imports> -----------------------------------------------------



{-
evalExpression (NumFunc x) state = evalNumFunc x state
--evalExpression (NumOp (IntConst x)) _ = fromIntegral x
evalExpression (NumOp other) state = makeFloat other state
evalExpression (NumExpr ((FloatConst x),(FloatConst y)) op) state = evalArithFunc op x y
evalExpression (NumExpr (op1,op2) op) state =
      evalExpression (NumExpr (FloatConst $ makeFloat op1 state,FloatConst $ makeFloat op2 state) op) state 
-}

{-
evalExpression :: NumExpr -> ProgramState -> Float
evalExpression (NumFunc x) state = evalNumFunc x state
evalExpression (NumOp x) state = makeFloat x state
--evalExpression (NumExpr (NumExpr x y, op2) op) state = 
  --  evalArithFunc op (evalExpression (NumExpr x y) state) (evalExpression op2 state)
evalExpression (NumExpr (op1, op2) op) state = 
    evalArithFunc op (evalExpression op1 state) (evalExpression op2 state)
-}


{-
evalExpression :: NumExpr -> PState Float
evalExpression (NumFunc x) = evalNumFunc x 
evalExpression (NumOp x) = makeFloat x 
evalExpression (NumExpr (op1, op2) op) = do
    state <- get
    (val1,nstate) <- liftIO $ runStateT (evalExpression op1) state
    --let (nstate',val2) = runStateT (evalExpression op2) nstate
    --val1' <- liftIO val1
    --val2' <- liftIO val2
    return $ evalArithFunc op val1 val2 
-}

-- Evaluates a numerical expression, which means...
--    1. For an Operand, make a float value out of it
--    2. For a numerical function, returns the result of this function
--    3. For a numerical expression, evaluate both operands (can also be numerical expressions) and 
--        combine them wit the given operation
--
--  This function is currently pure, although it uses state, and can also alter it (currently only for random
--   numbers, maybe more in the future). Maybe it is resonable to put it into state monad but i see not the 
--    right way to do this at the moment, so at the moment it returns a pair with the result and the maybe 
--     changed state
evalExpression :: NumExpr -> ProgramState -> (Float,ProgramState)
evalExpression (NumFunc x) state = evalNumFunc x state
evalExpression (NumOp x) state = (makeFloat x state,state)
evalExpression (NumExpr (op1, op2) op) state = 
    let 
       (val1,nstate1) = evalExpression op1 state
       (val2,nstate2) = evalExpression op2 nstate1
    in (evalArithFunc op val1 val2, nstate2) 


-- Takes an operand an makes it to a float value to have an intern unique base, considering type safety
--  it is maybe not the best way to deal with int values
makeFloat :: Operand -> ProgramState -> Float
makeFloat (OpVar (IntVar x)) state = fromIntegral $ getMapVal $ M.lookup (NumVar_Var (IntVar x)) (intVars state)
makeFloat (OpVar (FloatVar x)) state = getMapVal $ M.lookup (NumVar_Var (FloatVar x)) (floatVars state)
makeFloat (IntConst x) _ = fromIntegral x
makeFloat (FloatConst x) _ = x


{-
makeFloat :: Operand -> PState Float
makeFloat (OpVar (IntVar x))= do
    state <- get
    return $ fromIntegral $ getMapVal $ M.lookup (NumVar_Var (IntVar x)) (intVars state)
makeFloat (OpVar (FloatVar x)) = do
    state <- get
    return $ getMapVal $ M.lookup (NumVar_Var (FloatVar x)) (floatVars state)
makeFloat (IntConst x) = return $ fromIntegral x
makeFloat (FloatConst x) = return x
-}

{-
evalNumFunc :: NumFunction -> ProgramState -> Float 
evalNumFunc (LenVar strVar) state = 
    fromIntegral $ length $ getMapVal $ M.lookup (StringVar_Var strVar) (stringVars state)
  -}    


evalNumFunc :: NumFunction -> ProgramState -> (Float,ProgramState) 
evalNumFunc (LenVar strVar) state = 
    (fromIntegral $ length $ getMapVal $ M.lookup (StringVar_Var strVar) (stringVars state),state)
evalNumFunc (Random _) state = getNextRandomValue state
evalNumFunc (IntFunc numExpr) state = 
    let (res,nstate) = evalExpression numExpr state
    in (fromIntegral $ truncate res ,nstate)

{-
evalNumFunc :: NumFunction -> PState Float 
evalNumFunc (LenVar strVar) = return 3 -- do
   -- state <- get
   -- return $ fromIntegral $ length $ getMapVal $ M.lookup (StringVar_Var strVar) (stringVars state)
-}

--evalArithFunc :: (Num a) => String -> a -> a -> a
evalArithFunc str arg1 arg2 
    | str == "+" = arg1 + arg2
    | str == "-" = arg1 - arg2
    | str == "*" = arg1 * arg2
    | str == "/" = arg1 / arg2


-- This function returns the next random number, and to consume it realy, it alters the state, so that 
--  the random number list is beheaded ;D
-- The dropWhile seems necessary cause Basic delivers values in the range (0,1), 
--  but Haskell in the range [0,1). So for the case, we get the 0 we have to drop it
--
-- Maybe this function belongs in the Programstate module, but because I see currently no good way to put it in
--  state monad, and also the use is very arithmetical I put it here for the moment
getNextRandomValue :: ProgramState -> (Float,ProgramState)
getNextRandomValue state = 
    let 
       newRandomList = dropWhile ((==) 0) (randomNumbers state)
       newRandNumber = head newRandomList        
    in (newRandNumber,state{ randomNumbers = tail newRandomList })

