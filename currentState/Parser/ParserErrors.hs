module Parser.ParserErrors where

import Parser.ParserTypes(Token(..),
                         -- Constant(..),
                         TokenWrap(..),ParserState(..),getTkIntVal)

import qualified Data.Map as M
import Data.List(intercalate,delete) 
import Control.Monad.State

import Debug.Trace(trace)



data RuleType
    = LINE_NUMBER
    | STRING_LITERAL
    | STRING_VARIABLE
    | FLOAT_VARIABLE
    | INT_VARIABLE
    | OPERATOR String
    | COMMAND_INPUT
    | STRING_NL_SURPRESSOR String
 
    | CONSTANT
    | INT_CONSTANT
    | FLOAT_CONSTANT
    | EXPRESSION
    | NUMERICAL_EXPRESSION
    | STRING_EXPRESSION
    | BOOLEAN_EXPRESSION
    | SYNTACTIC_ELEMENT String
    | STRING_ASSIGNMENT
    | INT_ASSIGNMENT
    | FLOAT_ASSIGNMENT

    | COMMAND
    | VARIABLE
    | LINE

    | NOT_IMPLEMENTED

    | COMMAND_GETF
    deriving (Ord, Show, Eq)


tokenToRuleType :: Token -> RuleType
tokenToRuleType TkInput = COMMAND_INPUT
tokenToRuleType TkGetF  = COMMAND_GETF
tokenToRuleType (TkLineNumber _) = LINE_NUMBER
tokenToRuleType (TkStringVar _) = STRING_VARIABLE
tokenToRuleType (TkIntVar _) = INT_VARIABLE
--tokenToRuleType (TkFloatVar _) = FLOAT_VARIABLE
tokenToRuleType (TkFloatVar_Or_DataString _) = FLOAT_VARIABLE -- TODO!!!
tokenToRuleType (TkStringConcat) = STRING_NL_SURPRESSOR ";"
tokenToRuleType (TkString _) = STRING_LITERAL
--tokenToRuleType other = error ("not implement token: " ++ show other)
tokenToRuleType _ = NOT_IMPLEMENTED


expecting :: M.Map [RuleType] [RuleType] 
expecting = 
    M.fromList 
    [
     ([NOT_IMPLEMENTED],[NOT_IMPLEMENTED]),
     ([LINE_NUMBER], [COMMAND,VARIABLE] ),
     ([FLOAT_VARIABLE,LINE_NUMBER], [OPERATOR "="] ),
     ([INT_VARIABLE,LINE_NUMBER], [OPERATOR "="] ),
     ([STRING_VARIABLE,LINE_NUMBER], [OPERATOR "="] ),
     ([COMMAND_INPUT], [STRING_LITERAL,VARIABLE] ),
     ([COMMAND_GETF], [INT_CONSTANT] ),
     ([INT_CONSTANT,COMMAND_GETF], [VARIABLE] ),
     ([STRING_NL_SURPRESSOR ";",STRING_LITERAL,COMMAND_INPUT], [VARIABLE] ),
     ([STRING_LITERAL,COMMAND_INPUT], [STRING_NL_SURPRESSOR ";",VARIABLE] )
    ]


context :: M.Map [RuleType] String
context = 
    M.fromList 
    [
     ([NOT_IMPLEMENTED], "Context missing"),
     ([LINE_NUMBER,STRING_VARIABLE], "String Assignment" ),
     ([LINE_NUMBER,FLOAT_VARIABLE], "Float Assignment" ),
     ([LINE_NUMBER,INT_VARIABLE], "Int Assignment" ),
     ([COMMAND_INPUT], "Input Command" ),
     ([COMMAND_GETF], "File IO with get# Command" )
    ]



getExpectingMessage :: TokenWrap -> State ParserState (String,String)
getExpectingMessage errortok = do
    state <- get
    let allToks = tokenList state 
    let (expect,cont) = getExpecting errortok allToks
    return ("Expecting: " ++ (intercalate " or " $ map show expect), cont)

  where
     getExpecting :: TokenWrap -> [TokenWrap] -> ([RuleType],String)
     getExpecting ertok tkList = 
         let preds = reverse $ takeWhile ((/=) ertok) tkList
         in getExpecting' preds []

     getExpecting' [] _ = ([LINE_NUMBER],"")
     getExpecting' (x:xs) key = 
         let newKey = key ++ [tokenToRuleType $ _token x]
             expect = M.lookup newKey expecting
         in case expect of
                 Just y -> (y, getContext (reverse newKey) [])
                 Nothing -> getExpecting' xs newKey

     getContext [] _ = ""
     getContext (x:xs) newKey =
         let newKey' = newKey ++ [x]
             -- cxt = trace (show newKey') $ M.lookup newKey' context
             cxt = M.lookup newKey' context
         in case cxt of
                 Just y -> y
                 Nothing -> getContext xs newKey'
     


getMapVal :: Maybe a -> a
getMapVal (Just x) = x
getMapVal _  = error "Var not found!"



buildLineNumber :: TokenWrap -> State ParserState Int
buildLineNumber tkWrap = do
    state <- get
    let lnNrs = lineNumbers state
    -- let nr = (trace $! (show $ getTkIntVal tkWrap)) $! (getTkIntVal tkWrap)
    let nr = getTkIntVal tkWrap
    if elem nr lnNrs
      then do
        let (ln,col) = pos tkWrap
        let posText = "Line " ++ (show ln) ++ "," ++ "Column " ++ (show col) ++ ": "
        error (posText ++ "Duplicate LINE_NUMBER " ++ show nr)
        else do
          let newState = state { 
                           lineNumbers = nr : lnNrs, 
                           expectedLineNumbers = delete nr $ expectedLineNumbers state 
                         }
          put newState
          return nr


{- checkAllExpectedLineNumbersGot :: a -> State ParserState a
checkAllExpectedLineNumbersGot = do
    state <- get
    if (null $ expectedLineNumbers state)
      then
        return ()
      else
        error ("Missing lines: " ++ (show $ expectedLineNumbers state))
-}



parseError :: [TokenWrap] -> State ParserState a
parseError ls = do
    (expect,coxt) <- getExpectingMessage (head ls)
    -- error ("Parse error on: " ++ (show ls))
    let (ln,col) = pos $ head ls
    let posText = "Line " ++ (show ln) ++ "," ++ "Column " ++ (show col) ++ ": "
    let erTk = (", but was: " ++ (show $ tokenToRuleType $ _token $ head ls))
    -- error ("Used rules(" ++ (show $ length readStr) ++ "): " ++ (foldl (\s y -> s ++ " " ++ y) "" readStr) ++ erTk)
    let cxt = "\n        Context seems to be: " ++ coxt
    error (posText ++ expect ++ erTk ++ cxt)

