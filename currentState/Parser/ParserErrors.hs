module Parser.ParserErrors where
-- import BasicAlexMonad

-- import ProgrammState -- leads to cyclcic imports!!

import qualified Data.Map as M

import Data.List 

import Control.Monad.State

-- import BasicHapMonad(ParserState(..))

import Debug.Trace

import Parser.ParserTypes(Token(..),Constant(..),TokenWrap(..),ParserState(..))

-- data ParserState = ParserState { tokenList :: [TokenWrap], lineNumbers :: [Int], expectedLineNumbers :: [Int] }

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
    deriving (Ord, Show, Eq)


tokenToRuleType TkInput = COMMAND_INPUT
tokenToRuleType (TkLineNumber _) = LINE_NUMBER
tokenToRuleType (TkStringVar _) = STRING_VARIABLE
tokenToRuleType (TkIntVar _) = INT_VARIABLE
tokenToRuleType (TkFloatVar _) = FLOAT_VARIABLE
tokenToRuleType (TkStringConcat) = STRING_NL_SURPRESSOR ";"
tokenToRuleType (TkString _) = STRING_LITERAL

{-
expecting = 
    M.fromList 
    [
     ((LINE_NUMBER,FLOAT_VARIABLE), [OPERATOR "="] ),
     ((LINE_NUMBER,INT_VARIABLE), [OPERATOR "="] ),
     ((LINE_NUMBER,STRING_VARIABLE), [OPERATOR "="] ),
     ((LINE_NUMBER,STRING_VARIABLE), [OPERATOR "="] ),
     ((WILDCARD,COMMAND_INPUT), [STRING_LITERAL,VARIABLE] )
    ]
-}

expecting = 
    M.fromList 
    [
     ([LINE_NUMBER], [COMMAND,VARIABLE] ),
     ([FLOAT_VARIABLE,LINE_NUMBER], [OPERATOR "="] ),
     ([INT_VARIABLE,LINE_NUMBER], [OPERATOR "="] ),
     ([STRING_VARIABLE,LINE_NUMBER], [OPERATOR "="] ),
     ([COMMAND_INPUT], [STRING_LITERAL,VARIABLE] ),
     ([STRING_NL_SURPRESSOR ";",STRING_LITERAL,COMMAND_INPUT], [VARIABLE] ),
     ([STRING_LITERAL,COMMAND_INPUT], [STRING_NL_SURPRESSOR ";",VARIABLE] )
    ]


context :: M.Map [RuleType] String
context = 
    M.fromList 
    [
     ([LINE_NUMBER,STRING_VARIABLE], "String Assignment" ),
     ([LINE_NUMBER,FLOAT_VARIABLE], "Float Assignment" ),
     ([LINE_NUMBER,INT_VARIABLE], "Int Assignment" ),
     ([COMMAND_INPUT], "Input Command" )
    ]


{-
singleContext =
    M.fromList
    [
     (COMMAND_INPUT,True)
    ]
-}

getExpectingMessage ertok = do
    state <- get
    let allToks = tokenList state -- "holeGesamteTokenList aus state" state -- TODO!!!
    -- let preds = get2Predecessor ertok allToks
    -- let expect = getMapVal $ M.lookup preds expecting
    let (expect,cont) = getExpecting ertok allToks
    return ("Expecting: " ++ (intercalate "or" $ map show expect), cont)

  where
     {-get2Predecessor tok tkList =
          let elPos = getElemFirstPos tok 0 tkList
          in case elPos of
                  0 -> (WILDCARD,WILDCARD)
                  1 -> let parent = tokenToRuleType (_token $ head tkList)                        
                       in  (WILDCARD,parent)
                  _ -> let parent = tokenToRuleType (_token $ tkList !! (elPos - 1)) 
                       in case M.lookup parent singleContext of
                               Just _ -> let grandparent = 
                                                tokenToRuleType (_token $ tkList !! (elPos - 2))
                                         in  (grandparent,parent)
                               Nothing -> (WILDCARD,parent)


     getElemFirstPos _ _ [] = error "Element was not in list!"
     getElemFirstPos elem curPos (x:xs) = 
         if elem == x
           then curPos
           else getElemFirstPos elem (curPos + 1) xs -}


     getExpecting ertok tkList = 
         let preds = reverse $ takeWhile ((/=) ertok) tkList
         in getExpecting' preds []

     getExpecting' [] key = ([LINE_NUMBER],"")
     getExpecting' (x:xs) key = 
         let newKey = key ++ [tokenToRuleType $ _token x]
             exp = M.lookup newKey expecting
         in case exp of
                 Just x -> (x, getContext (reverse newKey) [])
                 Nothing -> getExpecting' xs newKey

     getContext [] _ = ""
     getContext (x:xs) newKey =
         let newKey' = newKey ++ [x]
             -- cxt = trace (show newKey') $ M.lookup newKey' context
             cxt = M.lookup newKey' context
         in case cxt of
                 Just x -> x
                 Nothing -> getContext xs newKey'
     


getMapVal :: Maybe a -> a
getMapVal (Just x) = x
getMapVal _  = error "Var not found!"

