module Strings (evalStringExpression) where

--import BasicHap ( StringExpr(..), BasicString(..), Var(StringVar_Var))
import BasicHapMonad ( StringExpr(..), BasicString(..), Var(StringVar_Var))
import ProgrammState
import qualified Data.Map as M

evalStringExpression (StringOp x) state = evalBasicString x state
evalStringExpression (StringExpr (bstr1,bstr2) strOp) state = 
    evalStringFunc strOp (evalBasicString bstr1 state) (evalBasicString bstr2 state)

evalBasicString (StringLiteral x) _ = x
evalBasicString (StringVar_BString x) state = getMapVal $ M.lookup (StringVar_Var x) (stringVars state)


evalStringFunc op op1 op2
    | op == "+" = op1 ++ op2


