module Strings (evalStringExpression) where

import Parser.ParserTypes( StringExpr(..), BasicString(..), Var(StringVar_Var))
import ProgrammState
import qualified Data.Map as M

import Control.Monad.State


evalStringExpression :: StringExpr -> PState String
evalStringExpression (StringOp x) = evalBasicString x 
evalStringExpression (StringExpr (bstr1,bstr2) strOp) = do
    val1 <- evalBasicString bstr1 
    val2 <- evalBasicString bstr2 
    return $ evalStringFunc strOp val1 val2


evalBasicString :: BasicString -> PState String
evalBasicString (StringLiteral x) = return x
evalBasicString (StringVar_BString x) = do
    state <- get
    return $ getMapVal $ M.lookup (StringVar_Var x) (stringVars state)


evalStringFunc :: String -> String -> String -> String
evalStringFunc op op1 op2
    | op == "+" = op1 ++ op2


