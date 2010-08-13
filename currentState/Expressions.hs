module Expressions 
(
  makeFloat,
  evalExpression,
  evalStringExpression,
  evalBoolExpression,
  isIntValue
)
where 


--------------------------------- <Imports> --------------------------------

import Parser.ParserTypes(
                           NumExpr(..), 
                           Var(..), 
                           NumVar(..), 
                           NumFunction(..), 
                           Operand(..), 
                           StringExpr(..), 
                           BasicString(..),
                           StringFunction(..),
                           FloatVar(..),
                           IntVar(..),
                           StringVar(..),
                           CompExpr(..),
                           Expr(..)
                         )
import Parser.Lexer.BasicParseStringToVal

import qualified Data.Map as M (lookup)
import System.Time (getClockTime, ClockTime(..))
import Control.Monad.State
import Data.Char (ord, chr)

import {-# SOURCE #-} ProgrammState
import Definitions
import BinaryOps

import BasicTime

--import Debug.Trace(trace)

-------------------------------- </Imports> --------------------------------



---------------------------------- <Nums> ----------------------------------

-- Evaluates a numerical expression, which means...
--    1. For an Operand, make a float value out of it
--    2. For a numerical function, returns the result of this function
--    3. For a numerical expression, evaluate both operands (can also be 
--        numerical expressions) and combine them wit the given operation
--    4. For an unary minus, eval expression and return the negative value
--    5. For binary not, eval expression and invert all bits  
--    6. For compare operation: Compare logical and convert bool value to 
--        int c64-like (0 = False, other = True)
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
evalExpression (NumNot expr) = do
    res <- evalExpression expr  
    -- for "not" second parameter is ignored
    return $ fromIntegral $ evalLogicExpression "not" res 0
evalExpression (NumExpr (op1, op2) op) = do
    val1  <- evalExpression op1
    val2  <- evalExpression op2
    state <- get 
    return $ evalArithFunc op val1 val2 $ curPos state
evalExpression (NumComp compExpr) = do
    res <- evalCompareExpression compExpr 
    return $ fromIntegral $ boolToInt $ res
    



evalCompareExpression :: CompExpr -> PState Bool
evalCompareExpression (NumCompare (numExpr1,numExpr2) strOp) = do
    val1 <- evalExpression numExpr1
    val2 <- evalExpression numExpr2
    state <- get
    return $ evalCompFunc strOp val1 val2 $ curPos state

evalCompareExpression (StrCompare (strExpr1,strExpr2) strOp) = do  
    val1 <- evalStringExpression strExpr1
    val2 <- evalStringExpression strExpr2
    state <- get
    return $ evalCompFunc strOp val1 val2 $ curPos state


evalCompFunc :: (Ord a) => Operator -> a -> a -> LineNumber -> Bool
evalCompFunc str arg1 arg2 ln_nr
    | str == "==" = arg1 == arg2
    | str == "/=" = arg1 /= arg2
    | str == "<"  = arg1 <  arg2
    | str == ">"  = arg1 >  arg2
    | str == "<=" = arg1 <= arg2
    | str == ">=" = arg1 >= arg2
    | otherwise   = let ermsg = "Unsupported compare operator '" 
                                ++ str ++ "'"
                    in eval_error ermsg ln_nr



-- Takes an operand an makes it to a float value to have an intern unique
--  base, considering type safety it is maybe not the best way to deal 
--   with int values
makeFloat :: Operand -> PState Float
makeFloat (OpVar (NumVar_Int intvar)) = do
    val <- getIntVarValue intvar
    --state <- get
    --let val = getMapVal $ M.lookup name (intVars state)
    return $ fromIntegral val
{-
makeFloat (OpVar (NumVar_Float (FloatVar "ST"))) = do
    state <- get
    let st_reg = getMapVal $ M.lookup "ST" (floatVars state)
    updateFloatVar (FloatVar "ST") 0 -- reset state register by every lookup, good idea??
    return st_reg
-}

makeFloat (OpVar (NumVar_Float floatVar)) = do
    --state <- get 
    val <- getFloatVarValue floatVar
    --return $ getMapVal $ M.lookup name (floatVars state)
    return val
{-
makeFloat (OpVar (NumVar_Int (IntVar_Array name ix))) = do
    state <- get
    res <- mapM evalExpression ix
    let key       = name
        ind       = map floatToIntConvert res
        (dim,ar)  = getMapVal $ M.lookup key (intArrayVars state)
    if length ind == length dim && allSmaller ind dim
      then do
        let val   = getMapVal $ M.lookup ind ar
        return $ fromIntegral val
      else
        let ln_nr = curPos state
        in printArrayIndex_error ind name dim ln_nr

makeFloat (OpVar (NumVar_Float (FloatVar_Array name ix))) = do
    state <- get 
    res <- mapM evalExpression ix
    let key       = name
        ind       = map floatToIntConvert res
        (dim,ar)  = getMapVal $ M.lookup key (floatArrayVars state)
    if length ind == length dim && allSmaller ind dim
      then do
        let val   = getMapVal $ M.lookup ind ar
        return val
      else
        let ln_nr = curPos state
        in printArrayIndex_error ind name dim ln_nr
-}

makeFloat (IntConst   x) = return $ fromIntegral x
makeFloat (FloatConst x) = return x
makeFloat TI_Reg         = do
    curtime <- getTimeCountValue
    return curtime



evalNumFunc :: NumFunction -> PState Float
evalNumFunc (Len strExpr)     = do
    res <- evalStringExpression strExpr
    return $ fromIntegral $ length $ res

evalNumFunc (Random numExpr)      = do
    arg <- evalExpression numExpr
    if arg > 0
      -- use the current random sequence, so do nothing here
      then return ()
      else do
        seed <- if arg == 0
                  -- create a new sequence (with random seed??)
                  then makeRandomSeed
                  -- create a new sequence with argument as seed             
                  else
                    -- haskell only takes ints as seed!
                    return $ floatToIntConvert arg
        createNewRandomSequence seed
    -- return the next random value of current random sequence 
    getNextRandomValue 
        
  where
        makeRandomSeed :: PState Int
        makeRandomSeed = do
            nr1 <- getNextRandomValue
            nr2 <- getNextRandomValue
            nr3 <- getNextRandomValue
            let flt_rand = (nr1 * 1000) * (nr2 * 1000) / (nr3 * 1000)
            return $ floatToIntConvert flt_rand

evalNumFunc (IntFunc numExpr) = do
    res <- evalExpression numExpr
    return $ fromIntegral $ (floatToIntConvert res :: Int)

evalNumFunc (AbsFunc numExpr) = evalExpression numExpr >>= (return . abs)

evalNumFunc (AscFunc strExpr) = 
    evalStringExpression strExpr >>= (return . fromIntegral . ord . head)

evalNumFunc (AtnFunc numExpr) = evalExpression numExpr >>= (return . atan)

evalNumFunc (CosFunc numExpr) = evalExpression numExpr >>= (return . cos)

evalNumFunc (ExpFunc numExpr) = do
    res <- evalExpression numExpr 
    if res < max_exp
      then return $ exp res
      else do
        state <- get
        let ermsg = "EXP argument '" ++ show res ++ "' is bigger than max" 
                    ++ " allowed value '" ++ show max_exp ++ "'"
        overflw_error ermsg $ curPos state

evalNumFunc (LogFunc numExpr) = do
    res <- evalExpression numExpr 
    if res > 0
      then return $ log res
      else do
        state <- get
        let ermsg = "LOG argument '" ++ show res 
                    ++ "' is zero or negative"
        illqua_error ermsg $ curPos state

evalNumFunc (ValFunc strExpr) = 
    evalStringExpression strExpr >>= (return . getNumberParseablePart) 
 
evalNumFunc (SgnFunc numExpr) = evalExpression numExpr >>= (return . signum)
 
evalNumFunc (SinFunc numExpr) = evalExpression numExpr >>= (return . sin)
 
evalNumFunc (SqrFunc numExpr) = do
    res <- evalExpression numExpr 
    if res >= 0
      then return $ sqrt res
      else do
        state <- get
        let ermsg = "SQR argument '" ++ show res ++ "' is negative"
        illqua_error ermsg $ curPos state
 
evalNumFunc (TanFunc numExpr) = evalExpression numExpr >>= (return . tan)

evalNumFunc (Fnxx name numExpr) = do
    state <- get
    let fn = M.lookup name $ custom_funcs state
    case fn of
         Just ((FloatVar var_name),expr)  -> do
              -- because variables of "def fnxx" can have same names 
              --  as regular float vars and seems to shadow them for their
              --   execution time (experimenting with emulator), we have 
              --    to save the old value of an maybe existing regular var
              --     With this, we can use normal expression evaluation
              --      for dealing with custom functions
              let oldval = case M.lookup var_name $ floatVars state of
                                Just x  -> x
                                Nothing -> 0
                  var    = FloatVar var_name
              -- evaluate the argument
              arg <- evalExpression numExpr
              -- save the evaluated argument as variable contents
              updateFloatVar var arg
              -- evaluate the saved formula (= num expr)
              res <- evalExpression expr 
              -- write original value back
              updateFloatVar var oldval
              -- return the result of the formula
              return res

         Nothing -> undeffn_error [] $ curPos state

--evalNumFunc fnc = error $ "Evaluation error: Unsupported numerical function '" ++ show fnc ++ "'"

evalArithFunc :: Operator -> Float -> Float -> LineNumber -> Float
evalArithFunc str arg1 arg2 ln_nr 
    | str == "+"  = arg1 + arg2
    | str == "-"  = arg1 - arg2
    | str == "*"  = arg1 * arg2
    | str == "/"  = arg1 / arg2
    | str == "&&" = fromIntegral $ evalLogicExpression str arg1 arg2
    | str == "||" = fromIntegral $ evalLogicExpression str arg1 arg2
    | otherwise   = let ermsg = "Unsupported arithmetical operator '" 
                                ++ str ++ "'"
                    in eval_error ermsg ln_nr


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
evalStringExpression (StringOp x)   = evalBasicString x 
evalStringExpression (StringFunc x) = evalStringFunc x
evalStringExpression (StringExpr (bstr1,bstr2) strOp) = do
    val1  <- evalStringExpression bstr1 
    val2  <- evalStringExpression bstr2
    state <- get 
    return $ evalStringOp strOp val1 val2 $ curPos state


evalBasicString :: BasicString -> PState String
evalBasicString (StringLiteral x) = return x
{-
evalBasicString (StringVar_BString (StringVar "TI$")) = do
    updateTimeValue 
    state <- get
    return $ getMapVal $ M.lookup "TI$" (stringVars state)
-}
evalBasicString (StringVar_BString strVar) = do
    val <- getStringVarValue strVar
    return val
  --  state <- get
  --  return $ getMapVal $ M.lookup name (stringVars state)

{-
evalBasicString (StringVar_BString (StringVar_Array name ix)) = do
    state <- get 
    res <- mapM evalExpression ix
    let key       = name
        ind       = map floatToIntConvert res
        (dim,ar)  = getMapVal $ M.lookup key (stringArrayVars state)
    if length ind == length dim && allSmaller ind dim
      then do
        let val   = getMapVal $ M.lookup ind ar
        return val
      else
        let ln_nr = curPos state
        in printArrayIndex_error ind name dim ln_nr
-}


evalStringOp :: Operator -> String -> String -> LineNumber -> String
evalStringOp op op1 op2 ln_nr
    | op == "+" = op1 ++ op2
    | otherwise = let ermsg = "Unsupported STRING operator '" 
                              ++ op ++ "'"
                  in eval_error ermsg ln_nr


evalStringFunc :: StringFunction -> PState String
evalStringFunc (ChrFunc numExpr) = do
    res <- evalExpression numExpr 
    if res >= 0 && res <= 255
      then return $ [chr $ floatToIntConvert res]
      else do
        state <- get
        let ermsg = "Converting number '" ++ show res 
                    ++ "' to ASCII char not possible"
        illqua_error ermsg $ curPos state

evalStringFunc (StrFunc numExpr) = do
    res <- evalExpression numExpr
    let str = if isIntValue res
                then show $ floatToIntConvert res
                else show $ res
    return str

evalStringFunc (LeftFunc strExpr numExpr) = do
    res <- evalExpression numExpr
    if res >= 0
      then do
        str <- evalStringExpression strExpr
        return $ take (floatToIntConvert res) str
      else do 
        state <- get
        let ermsg = "Length argument for string function '" 
                    ++ show res ++ "' is negative" 
        illqua_error ermsg $ curPos state

evalStringFunc (RightFunc strExpr numExpr) = do
    res <- evalExpression numExpr
    if res >= 0
      then do
        str <- evalStringExpression strExpr
        let len  = length str
            res' = floatToIntConvert res
        if res' < len
          then return $ drop (len - res') str
          else return str
      else do 
        state <- get
        let ermsg = "Length argument for string function '" 
                    ++ show res ++ "' is negative" 
        illqua_error ermsg $ curPos state

evalStringFunc (MidFunc strExpr numExpr1 numExpr2) = do
    startPos <- evalExpression numExpr1
    len <- evalExpression numExpr2
    if startPos > 0 && len >= 0
      then do
        str <- evalStringExpression strExpr
        let hsStartPos = (floatToIntConvert startPos) - 1
            len_str    = length str
        if hsStartPos < len_str
          then return $ take (floatToIntConvert len) $ drop hsStartPos str
          else return ""
      else do 
        state <- get
        let ermsg = "Length argument for string function '" 
                    ++ show len ++ "' is negative "
                    ++ "or index for \n\t\t\t  string function '" 
                    ++ show startPos ++ "' is negative or zero"
        illqua_error ermsg $ curPos state


-------------------------------- </Strings> ---------------------------------


---------------------------------- <Bools> ----------------------------------

evalBoolExpression :: Expr -> PState Bool
evalBoolExpression (Expr_Str strExpr) = do
    val <- evalStringExpression strExpr
    return $ stringToBool val

evalBoolExpression (Expr_Num numExpr) = do
    val <- evalExpression numExpr
    return $ intToBool $ floatToIntConvert val
    



stringToBool :: String -> Bool
stringToBool "" = False
stringToBool _  = True

intToBool :: Int -> Bool
intToBool 0 = False
intToBool _ = True


boolToInt :: Bool -> Int
boolToInt True  = (-1)
boolToInt False = 0


---------------------------------- </Bools> ---------------------------------

isIntValue :: Float -> Bool
isIntValue flnr =
    let coma_part = flnr - (fromIntegral $ truncate flnr)
    in if coma_part == 0
         then True
         else False


