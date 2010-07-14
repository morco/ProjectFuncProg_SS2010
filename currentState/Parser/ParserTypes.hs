module Parser.ParserTypes where
 
-- This types are used from a variety of modules. Because of this and to 
--  make the other modules smaller and cleaner i have decided to modulize
--   the types used for parsing


------------------------------ <Token Datatypes> ----------------------------

data Token 
     = TkLineNumber Int 

------ <Reserved words> ---------------

     | TkPrint  
     | TkInput  
     | TkFor   
     | TkTo    
     | TkNext 
     | TkIf     
     | TkThen   
     | TkGoto   
     | TkStep   
     | TkLen    

------ </Reserved words> ---------------

------ <Combinators> ---------------

     | TkSingleLineCommandCombinator  
     | TkKomma  
     | TkStringConcat  

------ </Combinators> ---------------

------ <Compare Operators> ---------------

     | TkEqual  
     | TkLt      
     | TkGt      
     | TkUnEqual 
     | TkGE      
     | TkLE      

------ </Compare Operators> ---------------

     | TkPlus  
     | TkMinus 
     | TkTimes 
     | TkDiv   

------ <Variables, Strings, Numbers> ---------------

     | TkString String 
     | TkConst  Constant 
     | TkStringVar String 
     | TkIntVar    String 
     | TkFloatVar  String 

------ </Variables, Strings, Numbers> --------------
     | TkBracketOpen  
     | TkBracketClose  

     | TkLogOr  
     | TkLogAnd  
     | TkLogNeg  

     | TkReturn  
     | TkGoSub  
     
     | TkEnd  
     
     | TkGet  
     | TkRandom  
     | TkIntFunc  

     | TkStringStart
     | TkStringEnd
     | TkStringChar String

   deriving (Eq,Show)


data Constant 
     = TkIntConst Int  
     | TkFloatConst Float
   deriving (Eq, Show)


data TokenWrap 
    = TokenWrap { _type :: String, pos :: (Int,Int), _token :: Token }
    | TkEOF
    deriving (Show,Eq)


getTokenIntValue :: TokenWrap -> Int
getTokenIntValue (TokenWrap _ _ (TkLineNumber x)) = x
getTokenIntValue _ = error "Unallowed Token here!"


getTokenStringValue :: TokenWrap -> String
getTokenStringValue (TokenWrap _ _ (TkString str)) = str
getTokenStringValue (TokenWrap _ _ (TkStringVar str)) = str
getTokenStringValue (TokenWrap _ _ (TkIntVar str)) = str
getTokenStringValue (TokenWrap _ _ (TkFloatVar str)) = str
getTokenStringValue _ = error "Unallowed Token here!"


------------------------------ </Token Datatypes> ---------------------------


------------------------------ <Parser Datatypes> ---------------------------

data ParserState 
    = ParserState { 
         tokenList :: [TokenWrap], 
         lineNumbers :: [Int], 
         expectedLineNumbers :: [Int] 
      }


data Command
      = Command IOCommand
      | ControlStructure ControlStruct
      | Goto Int
      | NOOP
      | ArithAssignment NumVar NumExpr
      | StringAssignment StringVar StringExpr
      | Return
      | End
      deriving Show

data StringExpr
      = StringOp BasicString
      | StringExpr (BasicString,BasicString) String
      deriving Show

data BasicString
      = StringVar_BString StringVar
      | StringLiteral String
      deriving Show

data NumFunction
      = Len String
      | LenVar StringVar
      | Random Int
      | IntFunc NumExpr
      deriving Show


data ControlStruct
      = If BoolExpr [Command]
      | For NumVar (Operand,Operand,Operand) [(Int,[Command])]
      | GoSub Int 
-- Ruecksprungpunkt ist ja schon durch die ZeilenNr des gosub Befehls gegeben, und muss eigentlich nicht nochmal extra aufgeschrieben werden
      deriving Show


data BoolExpr
      = BoolExprString (StringExpr,StringExpr) String
      | BoolExprNum (NumExpr,NumExpr) String
      | BoolExprLog (BoolExpr,BoolExpr) String
      deriving Show

data IOCommand 
      = Print ([Output], Bool)
      | Input (InputStuff, Bool)
      | Get Var
      deriving Show

data Output
      = OutString String  
      | OutVar Var
      deriving Show

data InputStuff 
      = InputStuff [String] [Var]
      deriving Show

data NumExpr
      = NumExpr (NumExpr,NumExpr) String
      | NumOp Operand
      | NumFunc NumFunction
      deriving Show

data Operand
      = OpVar NumVar
      | IntConst Int
      | FloatConst Float
      deriving Show

data NumVar
      = IntVar String
      | FloatVar String
      deriving (Eq, Show, Ord)

data Var
      = StringVar_Var StringVar
      | NumVar_Var NumVar
      deriving (Eq, Show, Ord)

data StringVar
      = StringVar String
      deriving (Eq, Show, Ord)

------------------------------ </Parser Datatypes> --------------------------


