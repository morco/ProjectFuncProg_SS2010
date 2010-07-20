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
import Parser.Lexer.BasicParseStringToVal

import qualified Data.Map as M
import Control.Monad.State
import Data.Char (ord, chr, isDigit )

import ProgrammState
import Strings

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
    return $ fromIntegral $ floor res


evalNumFunc (AbsFunc numExpr) = evalExpression numExpr >>= (return . abs)

evalNumFunc (AscFunc strExpr) = 
    evalStringExpression strExpr >>= (return . fromIntegral . ord . head)

evalNumFunc (AtnFunc numExpr) = evalExpression numExpr >>= (return . atan)

evalNumFunc (CosFunc numExpr) = evalExpression numExpr >>= (return . cos)

evalNumFunc (ExpFunc numExpr) = do
    res <- evalExpression numExpr 
    if res < 88.0296919
      then return $ exp res
      else error $ "?OVERFLOW ERROR: EXP argument '" 
                   ++ show res ++ "' is bigger than max" 
                   ++ "allowed value '88.0296919'"

evalNumFunc (LogFunc numExpr) = do
    res <- evalExpression numExpr 
    if res > 0
      then return $ log res
      else error $ "?ILLEGAL QUANTITY ERROR: LOG argument '" 
                   ++ show res ++ "' is zero or negative!"

evalNumFunc (ValFunc strExpr) = 
    evalStringExpression strExpr >>= (return . getNumberParseablePart) 
 
evalNumFunc (SgnFunc numExpr) = evalExpression numExpr >>= (return . signum)
 
evalNumFunc (SinFunc numExpr) = evalExpression numExpr >>= (return . sin)
 
evalNumFunc (SqrFunc numExpr) = do
    res <- evalExpression numExpr 
    if res >= 0
      then return $ sqrt res
      else error $ "?ILLEGAL QUANTITY ERROR: SQR argument '"
                   ++ show res ++ "' is negative!"

 
evalNumFunc (TanFunc numExpr) = evalExpression numExpr >>= (return . tan)


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


