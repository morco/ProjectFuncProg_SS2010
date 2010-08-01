module Expressions 
(
  makeFloat,
  evalExpression,
  evalStringExpression
)
where 


--------------------------------- <Imports> ---------------------------------

import Parser.ParserTypes(
                           NumExpr(..), 
                           Var(..), 
                           NumVar(..), 
                           NumFunction(..), 
                           Operand(..), 
                           StringExpr(..), 
                           BasicString(..),
                           StringFunction(..)
                         )
import Parser.Lexer.BasicParseStringToVal

import qualified Data.Map as M
import Control.Monad.State
import Data.Char (ord, chr, isDigit )

import ProgrammState

-------------------------------- </Imports> ---------------------------------



---------------------------------- <Nums> -----------------------------------

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

evalNumFunc (Fnxx name numExpr) = do
    state <- get
    let fn = M.lookup name $ custom_funcs state
    case fn of
         Just (var,expr)  ->  
              case M.lookup var $ floatVars state of
                   Just x -> do
                             arg <- evalExpression numExpr
                             updateFloatVar var arg
                             res <- evalExpression expr 
                             updateFloatVar var x
                             return res
                   Nothing -> do 
                             arg <- evalExpression numExpr
                             updateFloatVar var arg
                             res <- evalExpression expr 
                             updateFloatVar var 0
                             return res

         Nothing -> error $ "?UNDEF`D FUNCTION ERROR in line " 
                            ++ (show $ curPos state) ++ " !"


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

--------------------------------- </Nums> -----------------------------------


-------------------------------- <Strings> ----------------------------------

evalStringExpression :: StringExpr -> PState String
evalStringExpression (StringOp x) = evalBasicString x 
evalStringExpression (StringFunc x) = evalStringFunc x
evalStringExpression (StringExpr (bstr1,bstr2) strOp) = do
    --val1 <- evalBasicString bstr1 
    --val2 <- evalBasicString bstr2 
    val1 <- evalStringExpression bstr1 
    val2 <- evalStringExpression bstr2 
    return $ evalStringOp strOp val1 val2


evalBasicString :: BasicString -> PState String
evalBasicString (StringLiteral x) = return x
evalBasicString (StringVar_BString x) = do
    state <- get
    return $ getMapVal $ M.lookup (StringVar_Var x) (stringVars state)


evalStringOp :: String -> String -> String -> String
evalStringOp op op1 op2
    | op == "+" = op1 ++ op2


evalStringFunc :: StringFunction -> PState String
evalStringFunc (ChrFunc numExpr) = do
    state <- get
    res <- evalExpression numExpr 
    if res >= 0 && res <= 255
      then return $ [chr $ truncate res]
      else error $ "?ILLEGAL QUANTITY ERROR in line " 
                   ++ (show $ curPos state)  ++ ": Converting number '" 
                   ++ show res ++ "' to ASCII char not possible!"

evalStringFunc (StrFunc numExpr) = do
    res <- evalExpression numExpr
    return $ show res

evalStringFunc (LeftFunc strExpr numExpr) = do
    state <- get
    res <- evalExpression numExpr
    if res >= 0
      then do
        str <- evalStringExpression strExpr
        return $ take (truncate res) str
      else error $ "?ILLEGAL QUANTITY ERROR in line " 
                   ++ (show $ curPos state)  
                   ++ ": Length argument for string function '" 
                   ++ show res ++ "' is negative!"

evalStringFunc (RightFunc strExpr numExpr) = do
    state <- get
    res <- evalExpression numExpr
    if res >= 0
      then do
        str <- evalStringExpression strExpr
        let len = length str
            res' = truncate res
        if res' < len
          then return $ drop (len - res') str
          else return str
      else error $ "?ILLEGAL QUANTITY ERROR in line " 
                   ++ (show $ curPos state)  
                   ++ ": Length argument for string function '" 
                   ++ show res ++ "' is negative!"

evalStringFunc (MidFunc strExpr numExpr1 numExpr2) = do
    state <- get
    startPos <- evalExpression numExpr1
    len <- evalExpression numExpr2
    if startPos > 0 && len >= 0
      then do
        str <- evalStringExpression strExpr
        let hsStartPos = (truncate startPos) - 1
            len_str    = length str
        if hsStartPos < len_str
          then return $ take (truncate len) $ drop hsStartPos str
          else return ""
      else error $ "?ILLEGAL QUANTITY ERROR in line " 
                   ++ (show $ curPos state)  
                   ++ ": Length argument for string function '" 
                   ++ show len ++ "' is negative "
                   ++ "or index for string function '" 
                   ++ show startPos ++ "' is negative or zero!"


-------------------------------- </Strings> ---------------------------------