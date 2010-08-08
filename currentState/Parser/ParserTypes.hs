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
     | TkOn    
     | TkGoto  
     | TkGoSub  
     | TkReturn  
     | TkEnd  

  -- Numerical functions 
     | TkLen    
     | TkRandom  
     | TkIntFunc  
     | TkAbsFunc  
     | TkAscFunc  
     | TkAtnFunc  
     | TkCosFunc  
     | TkExpFunc  
     | TkLogFunc  
     | TkValFunc  
     | TkSgnFunc  
     | TkSinFunc  
     | TkSqrFunc  
     | TkTanFunc  
     | TkDef
     | TkFnxx  String

  -- String functions 
     | TkChrFunc    
     | TkStrFunc    
     | TkLeftFunc    
     | TkRightFunc    
     | TkMidFunc    

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

--------- <Arith Operators> --------------

     | TkPlus  
     | TkMinus 
     | TkTimes 
     | TkDiv   

--------- </Arith Operators> -------------

----- <Variables, Strings, Numbers> ------

     | TkString                   String 
     | TkConst                  Constant 
     | TkStringVar                String 
     | TkIntVar                   String 
     | TkFloatVar_Or_DataString   String
     | TkDim 

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
getTkStrVal (TokenWrap _ _ (TkFnxx str)) = str
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
         data_temp           :: [DataContent],
         last_for            :: [ControlStruct],
         cur_basline         :: Int
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
    | Def                String          FloatVar       NumExpr
    | Next               ControlStruct
    | Dim                [(Var,[Operand])]
    deriving (Show,Eq)

data StringExpr
    = StringOp    BasicString
    | StringExpr (StringExpr,StringExpr) String
    | StringFunc  StringFunction
    deriving (Show,Eq,Ord)

data StringFunction
    = ChrFunc  NumExpr
    | LeftFunc  StringExpr NumExpr
    | MidFunc  StringExpr NumExpr NumExpr
    | RightFunc  StringExpr NumExpr
    | StrFunc  NumExpr
    deriving (Show,Eq,Ord)

data BasicString
    = StringVar_BString   StringVar
    | StringLiteral       String
    deriving (Show,Eq,Ord)

data NumFunction
    = Len      String
    | LenVar   StringVar
    | Random   Int
    | IntFunc  NumExpr
    | AbsFunc  NumExpr
    | AscFunc  StringExpr
    | AtnFunc  NumExpr
    | CosFunc  NumExpr
    | ExpFunc  NumExpr
    | LogFunc  NumExpr
    | ValFunc  StringExpr
    | SgnFunc  NumExpr
    | SinFunc  NumExpr
    | SqrFunc  NumExpr
    | TanFunc  NumExpr
    | Fnxx     String     NumExpr
    deriving (Show,Eq,Ord)


data ControlStruct
    = If Expr [Command]
    | For FloatVar  (Operand,Operand,Operand) 
    | GoSub       Int 
    | Goto        Int
    | On_Goto     NumExpr                   [Int]
    | On_Gosub    NumExpr                   [Int]
    | End
    | Return
    deriving (Show,Eq)

data CompExpr
    = NumCompare (NumExpr   ,NumExpr   ) String
    | StrCompare (StringExpr,StringExpr) String
    deriving (Show,Eq,Ord)


data IOCommand 
    = Print   ([Output], Bool)
    | Input   (InputStuff, Bool)
    | Get     [Var]
    deriving (Show,Eq)

data Output
    = OutStringExpr  StringExpr
    | OutNumExpr     NumExpr
    deriving (Show,Eq)

data InputStuff 
    = InputStuff   [String] [Var]
    deriving (Show,Eq)

data NumExpr
    = NumExpr    (NumExpr,NumExpr) String
    | NumOp      Operand
    | NumFunc    NumFunction
    | NumMinus   NumExpr
    | NumNot     NumExpr
    | NumComp    CompExpr
    deriving (Show,Eq,Ord)

data Expr 
    = Expr_Num NumExpr
    | Expr_Str StringExpr
    deriving (Show,Eq,Ord)

data Operand
    = OpVar        NumVar
    | IntConst     Int
    | FloatConst   Float
    deriving (Show,Eq,Ord)

data NumVar
    = NumVar_Int    IntVar
    | NumVar_Float  FloatVar
    deriving (Eq, Show, Ord)

data Var
    = StringVar_Var   StringVar
    | NumVar_Var      NumVar
    deriving (Eq, Show, Ord)

data StringVar
    = StringVar         String
    | StringVar_Array   String  [NumExpr]
    deriving (Eq, Show, Ord)

data IntVar
    = IntVar         String
    | IntVar_Array   String  [NumExpr]
    deriving (Eq, Show, Ord)

data FloatVar
    = FloatVar         String
    | FloatVar_Array   String  [NumExpr]
    deriving (Eq, Show, Ord)


data DataContent 
    = DataInt     Int
    | DataFloat   Float
    | DataString  String
    deriving (Eq, Show)

------------------------------ </Parser Datatypes> --------------------------


