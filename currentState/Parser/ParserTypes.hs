module Parser.ParserTypes where
 
-- This types are used from a variety of modules. Because of this and to 
--  make the other modules smaller and cleaner i have decided to modulize
--   the types used for parsing


------------------------------ <Token Datatypes> ----------------------------

data Token 
     = TkLineNumber                  Int 

-------- <Reserved words> ----------------

  -- IO commands
     | TkPrint  
     | TkInput  
     | TkGet  

  -- Controlstructures
     | TkIf     
     | TkThen   
     | TkFor   
     | TkTo    
     | TkNext 
     | TkStep   
     | TkGoto  
     | TkGoSub  
     | TkReturn  
     | TkEnd  

  -- Numerical functions 
     | TkLen    
     | TkRandom  
     | TkIntFunc  

  -- Data commands
     | TkRead
     | TkData
     | TkRestore

  -- Others
     | TkComment
-------- </Reserved words> ---------------

-------- <Combinators> -------------------

     | TkSingleLineCommandCombinator  
     | TkKomma  
     | TkStringConcat  
     | TkBracketOpen  
     | TkBracketClose  

-------- </Combinators> ------------------

-------- <Boolean Operators> -------------

     | TkLogOr  
     | TkLogAnd  
     | TkLogNeg  

-------- </Boolean Operators> ------------

-------- <Compare Operators> -------------

     | TkEqual  
     | TkLt      
     | TkGt      
     | TkUnEqual 
     | TkGE      
     | TkLE      

-------- </Compare Operators> ------------

     | TkPlus  
     | TkMinus 
     | TkTimes 
     | TkDiv   

----- <Variables, Strings, Numbers> ------

     | TkString                   String 
     | TkConst                  Constant 
     | TkStringVar                String 
     | TkIntVar                   String 
     | TkFloatVar_Or_DataString   String 

----- </Variables, Strings, Numbers> -----

------- <Only temporarly needed> ---------

     | TkStringStart
     | TkStringEnd

------- </Only temporarly needed> --------

   deriving (Eq,Show)


data Constant 
     = TkIntConst     Int  
     | TkFloatConst Float
   deriving (Eq, Show)


data TokenWrap 
    = TokenWrap { _type :: String, pos :: (Int,Int), _token :: Token }
    | TkEOF
    deriving (Show,Eq)


getTkIntVal :: TokenWrap -> Int
getTkIntVal (TokenWrap _ _ (TkLineNumber x)) = x
getTkIntVal (TokenWrap _ _ (TkConst (TkIntConst x))) = x
getTkIntVal tk = 
    error ("Unallowed Token here! (" ++ (show $ _token tk) ++ ")")


getTkFltVal :: TokenWrap -> Float
getTkFltVal (TokenWrap _ _ (TkConst (TkFloatConst x))) = x
getTkFltVal tk = 
    error $ "Unallowed Token here! (" ++ (show $ _token tk) ++ ")"

getTkStrVal :: TokenWrap -> String
getTkStrVal (TokenWrap _ _ (TkString str)) = str
getTkStrVal (TokenWrap _ _ (TkStringVar str)) = str
getTkStrVal (TokenWrap _ _ (TkIntVar str)) = str
getTkStrVal (TokenWrap _ _ (TkFloatVar_Or_DataString str)) = str
getTkStrVal tk = 
    error $ "Unallowed Token here! (" ++ (show $ _token tk) ++ ")"


------------------------------ </Token Datatypes> ---------------------------


------------------------------ <Parser Datatypes> ---------------------------

type Program = [(Int, [Command])]

data ParserState 
    = ParserState { 
         tokenList           :: [TokenWrap], 
         lineNumbers         :: [Int], 
         expectedLineNumbers :: [Int],
         data_temp           :: [DataContent] 
      }


data ParseTree
    = ParseTree { program :: Program, pdata :: [DataContent] }
    deriving Show

data Command
    = NOOP
    | IO_Com             IOCommand
    | ControlStructure   ControlStruct
    | ArithAssignment    NumVar          NumExpr
    | StringAssignment   StringVar       StringExpr
    | Read               [Var]
    | Data               [DataContent]
    | Restore
    deriving Show

data StringExpr
    = StringOp    BasicString
    | StringExpr (BasicString,BasicString) String
    deriving Show

data BasicString
    = StringVar_BString   StringVar
    | StringLiteral       String
    deriving Show

data NumFunction
    = Len      String
    | LenVar   StringVar
    | Random   Int
    | IntFunc  NumExpr
    deriving Show


data ControlStruct
    = If BoolExpr [Command]
    | For NumVar  (Operand,Operand,Operand) [(Int,[Command])]
    | GoSub       Int 
    | Goto        Int
    | End
    | Return
    deriving Show


data BoolExpr
    = BoolExprString  (StringExpr,StringExpr) String
    | BoolExprNum     (NumExpr,NumExpr) String
    | BoolExprLog     (BoolExpr,BoolExpr) String
    deriving Show

data IOCommand 
    = Print   ([Output], Bool)
    | Input   (InputStuff, Bool)
    | Get     Var
    deriving Show

data Output
    = OutStringExpr  StringExpr
    | OutNumExpr     NumExpr
    deriving Show

data InputStuff 
    = InputStuff   [String] [Var]
    deriving Show

data NumExpr
    = NumExpr    (NumExpr,NumExpr) String
    | NumOp      Operand
    | NumFunc    NumFunction
    | NumMinus   NumExpr
    deriving Show

data Operand
    = OpVar        NumVar
    | IntConst     Int
    | FloatConst   Float
    deriving Show

data NumVar
    = IntVar    String
    | FloatVar  String
    deriving (Eq, Show, Ord)

data Var
    = StringVar_Var   StringVar
    | NumVar_Var      NumVar
    deriving (Eq, Show, Ord)

data StringVar
    = StringVar String
    deriving (Eq, Show, Ord)


data DataContent 
    = DataInt     Int
    | DataFloat   Float
    | DataString  String
    deriving (Eq, Show)

------------------------------ </Parser Datatypes> --------------------------


