module Strings (evalStringExpression) where

import Parser.ParserTypes( StringExpr(..), BasicString(..), Var(StringVar_Var))
import ProgrammState
import qualified Data.Map as M

import Control.Monad.State

--import Nums cyclic imports!! make possible!!

evalStringExpression :: StringExpr -> PState String
evalStringExpression (StringOp x) = evalBasicString x 
evalStringExpression (StringFunc x) = return "bla" -- evalStringFunc x
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

{-
evalStringFunc :: StringFunc -> PState String
evalStringFunc (ChrFunc numExpr) = do
    res <- evalExpression numExpr 
    if res >= 0 && res <= 255
      then return $ [chr res]
      else error "?ILLEGAL QUANTITY ERROR: Converting number '" 
                 ++ show res ++ "'to ASCII char not possible!"
-}
