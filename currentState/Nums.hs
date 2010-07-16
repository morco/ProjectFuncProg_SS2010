module Nums 
(
  makeFloat,
  evalExpression
)
where 

--------------------------------- <Imports> ---------------------------------

import Parser.ParserTypes(
                           NumExpr(..), 
                           Var(..), 
                           NumVar(..), 
                           NumFunction(..), 
                           Operand(..)
                         )
import qualified Data.Map as M
import Control.Monad.State

import ProgrammState


-------------------------------- </Imports> ---------------------------------




-- Evaluates a numerical expression, which means...
--    1. For an Operand, make a float value out of it
--    2. For a numerical function, returns the result of this function
--    3. For a numerical expression, evaluate both operands (can also be 
--        numerical expressions) and combine them wit the given operation
--
--  This function is in State Monad because it can contain variables and 
--   also alter state (currently only by random number operations, maybe 
--    more in the future).  
evalExpression :: NumExpr -> PState Float
evalExpression (NumFunc x) = evalNumFunc x 
evalExpression (NumOp x) = makeFloat x 
evalExpression (NumMinus expr) = do
    res <- evalExpression expr  
    return (-res)
evalExpression (NumExpr (op1, op2) op) = do
    val1 <- evalExpression op1
    val2 <- evalExpression op2
    return $ evalArithFunc op val1 val2 


-- Takes an operand an makes it to a float value to have an intern unique
--  base, considering type safety it is maybe not the best way to deal 
--   with int values
makeFloat :: Operand -> PState Float
makeFloat (OpVar (IntVar x)) = do
    state <- get
    let val = getMapVal $ M.lookup (NumVar_Var (IntVar x)) (intVars state)
    return $ fromIntegral val

makeFloat (OpVar (FloatVar x)) = do
    state <- get 
    return $ getMapVal $ M.lookup (NumVar_Var (FloatVar x)) (floatVars state)

makeFloat (IntConst x) = return $ fromIntegral x
makeFloat (FloatConst x) = return x



evalNumFunc :: NumFunction -> PState Float
evalNumFunc (LenVar strVar) = do
    state <- get
    let val = getMapVal $ M.lookup (StringVar_Var strVar) (stringVars state)
    return $ fromIntegral $ length $ val

evalNumFunc (Random _) = getNextRandomValue

evalNumFunc (IntFunc numExpr) = do
    res <- evalExpression numExpr
    return $ fromIntegral $ truncate res



--evalArithFunc :: (Num a) => String -> a -> a -> a
evalArithFunc str arg1 arg2 
    | str == "+" = arg1 + arg2
    | str == "-" = arg1 - arg2
    | str == "*" = arg1 * arg2
    | str == "/" = arg1 / arg2


-- This function returns the next random number, and to consume it really, 
--  it alters the state, so that the random number list is beheaded ;D
-- The dropWhile seems necessary cause Basic delivers values in the 
--  range (0,1), but Haskell in the range [0,1). So for the case, we get 
--   the 0 we have to drop it
--
-- Maybe this function belongs in the Programstate module, but the use is 
--  very arithmetical, so I put it here for the moment
getNextRandomValue :: PState Float
getNextRandomValue = do
    state <- get
    let newRandomList = dropWhile ((==) 0) (randomNumbers state)
    let newRandNumber = head newRandomList        
    put $ state { randomNumbers = tail newRandomList }
    return newRandNumber


