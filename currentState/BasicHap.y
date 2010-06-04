{
--module BasicHap(getParseTree,SyntaxTree, Command, IOCommand, Vars) where
module BasicHap where

import BasicAlex
import Data.Char
--import qualified Data.Map as M

}

%name basicParse
%tokentype { Token }
%error { parseError }

%token 
      print           { TkPrint }
      input           { TkInput }
      string          { TkString $$ }
      var             { TkVar $$ }
      lineNr          { TkLineNumber $$ }
      ";"             { TkStringConcat }
      ":"             { TkSingleLineCommandCombinator }
--      ","             { TkStringConcatWithTab } -- <--- TODO!!!
      if              { TkIf }
      then            { TkThen }
      goto            { TkGoto }
      for             { TkFor }
      to              { TkTo }
      next            { TkNext }
      step            { TkStep }
--      float           { TkConst (TkFloatConst $$) }
--      int             { TkConst (TkIntConst $$) }
      int             { TkConst $$ }
--      float           { TkConst $$ }
      "="             { TkEqual }
      "<>"            { TkUnEqual }
      "<"             { TkLt }
      ">"             { TkGt }
      "<="            { TkLE }
      ">="            { TkGE }

      "+"             { TkPlus }

%%

{-
SyntaxTree     : lineNr Commands                {[Line $1 $2]}
               | lineNr Commands SyntaxTree     {(Line $1 $2):$3} -}

SyntaxTree     : lineNr Commands                {[($1,$2)]}
               | lineNr Commands SyntaxTree     {($1,$2):$3}

Commands       : Command                        {[$1]}
               | Command ":" Commands           {$1:$3}

Command        : IOCommand                      {Command $1}
               | ControlStruct                  {ControlStructure $1}
               | goto int                         {Goto ((\(TkIntConst x) -> x)$2)}
               | next Var                       {NOOP}
               | Assignment                     {$1}
--               | BoolExpr                       {NOOP}

Assignment      : Var "=" NumExpr     {Assignment $1 $3}
--               | Var "=" string      {}

NumExpr        : Operand "+" Operand  {NumExpr ($1,$3) "+"}
               | Operand              {NumOp $1}

Operand        : var     {makeOperandVar $1}
               | int     {makeOperandConstant $1}

ControlStruct  : if BoolExpr then IfBody        {If $2 $4}
               | for Var "=" int to int step int SyntaxTree  {For $2 ($4,$8,$6) $9} 

--IfBody       : int                               {GoTO ...}
IfBody         : Commands                          {$1} --  <--- verursacht shift/red conflicts
IfBody         : int                          {[NOOP]}

{-
BoolExpr       : Var "=" Var                    {BoolExprVarVar {var1 = $1, infixBoolFunc = (==), var2 = $3}}
               | Var "<" Var                    {BoolExprVarVar {var1 = $1, infixBoolFunc = (<), var2 = $3}}
               | Var ">" Var                    {BoolExprVarVar {var1 = $1, infixBoolFunc = (>), var2 = $3}}
               | Var "<>" Var                   {BoolExprVarVar {var1 = $1, infixBoolFunc = (/=), var2 = $3}}
               | Var "<=" Var                   {BoolExprVarVar {var1 = $1, infixBoolFunc = (<=), var2 = $3}}
               | Var ">=" Var                   {BoolExprVarVar {var1 = $1, infixBoolFunc = (>=), var2 = $3}}
               | Constant "=" Constant       {BoolExprConstConst {const1 = $1, infixBoolFunc = (==), const2 = $3}}
               | Constant "<" Constant       {BoolExprConstConst {const1 = $1, infixBoolFunc = (<), const2 = $3}} 
               | Constant ">" Constant       {BoolExprConstConst {const1 = $1, infixBoolFunc = (>), const2 = $3}}
               | Constant "<>" Constant      {BoolExprConstConst {const1 = $1, infixBoolFunc = (/=), const2 = $3}}
               | Constant "<=" Constant      {BoolExprConstConst {const1 = $1, infixBoolFunc = (<=), const2 = $3}}
               | Constant ">=" Constant      {BoolExprConstConst {const1 = $1, infixBoolFunc = (>=), const2 = $3}}
               | Constant "=" Var              {BoolExprVarConst {const' = $1, infixBoolFunc = (==), var = $3}}
               | Constant "<" Var              {BoolExprVarConst {const' = $1, infixBoolFunc = (<), var = $3}}
               | Constant ">" Var              {BoolExprVarConst {const' = $1, infixBoolFunc = (>), var = $3}}
               | Constant "<>" Var             {BoolExprVarConst {const' = $1, infixBoolFunc = (/=), var = $3}}
               | Constant "<=" Var             {BoolExprVarConst {const' = $1, infixBoolFunc = (<=), var = $3}}
               | Constant ">=" Var             {BoolExprVarConst {const' = $1, infixBoolFunc = (>=), var = $3}}
               | Var "=" Constant              {BoolExprVarConst {var = $1, infixBoolFunc = (==), const' = $3}}
               | Var "<" Constant              {BoolExprVarConst {var = $1, infixBoolFunc = (<), const' = $3}}
               | Var ">" Constant              {BoolExprVarConst {var = $1, infixBoolFunc = (>), const' = $3}}
               | Var "<>" Constant             {BoolExprVarConst {var = $1, infixBoolFunc = (/=), const' = $3}}
               | Var "<=" Constant             {BoolExprVarConst {var = $1, infixBoolFunc = (<=), const' = $3}}
               | Var ">=" Constant             {BoolExprVarConst {var = $1, infixBoolFunc = (>=), const' = $3}}
-}
 
BoolExpr       : Var "=" Var                    {BoolExprVarVar {var1 = $1, infixBoolFunc = "==", var2 = $3}}
               | Var "<" Var                    {BoolExprVarVar {var1 = $1, infixBoolFunc = "<", var2 = $3}}
               | Var ">" Var                    {BoolExprVarVar {var1 = $1, infixBoolFunc = ">", var2 = $3}}
               | Var "<>" Var                   {BoolExprVarVar {var1 = $1, infixBoolFunc = "/=", var2 = $3}}
               | Var "<=" Var                   {BoolExprVarVar {var1 = $1, infixBoolFunc = "<=", var2 = $3}}
               | Var ">=" Var                   {BoolExprVarVar {var1 = $1, infixBoolFunc = ">=", var2 = $3}}
               | Constant "=" Constant       {BoolExprConstConst {const1 = $1, infixBoolFunc = "==", const2 = $3}}
               | Constant "<" Constant       {BoolExprConstConst {const1 = $1, infixBoolFunc = "<", const2 = $3}} 
               | Constant ">" Constant       {BoolExprConstConst {const1 = $1, infixBoolFunc = ">", const2 = $3}}
               | Constant "<>" Constant      {BoolExprConstConst {const1 = $1, infixBoolFunc = "/=", const2 = $3}}
               | Constant "<=" Constant      {BoolExprConstConst {const1 = $1, infixBoolFunc = "<=", const2 = $3}}
               | Constant ">=" Constant      {BoolExprConstConst {const1 = $1, infixBoolFunc = ">=", const2 = $3}}
               | Constant "=" Var              {BoolExprVarConst {const' = $1, infixBoolFunc = "==", var = $3}}
               | Constant "<" Var              {BoolExprVarConst {const' = $1, infixBoolFunc = "<", var = $3}}
               | Constant ">" Var              {BoolExprVarConst {const' = $1, infixBoolFunc = ">", var = $3}}
               | Constant "<>" Var             {BoolExprVarConst {const' = $1, infixBoolFunc = "/=", var = $3}}
               | Constant "<=" Var             {BoolExprVarConst {const' = $1, infixBoolFunc = "<=", var = $3}}
               | Constant ">=" Var             {BoolExprVarConst {const' = $1, infixBoolFunc = ">=", var = $3}}
               | Var "=" Constant              {BoolExprVarConst {var = $1, infixBoolFunc = "==", const' = $3}} 
               | Var "<" Constant              {BoolExprVarConst {var = $1, infixBoolFunc = "<", const' = $3}}
               | Var ">" Constant              {BoolExprVarConst {var = $1, infixBoolFunc = ">", const' = $3}}
               | Var "<>" Constant             {BoolExprVarConst {var = $1, infixBoolFunc = "/=", const' = $3}}
               | Var "<=" Constant             {BoolExprVarConst {var = $1, infixBoolFunc = "<=", const' = $3}}
               | Var ">=" Constant             {BoolExprVarConst {var = $1, infixBoolFunc = ">=", const' = $3}}


Constant       : int                            {$1}
--               | float                          {$1}

IOCommand      : print Output                   {Print $2}
               | print                          {Print ([], True)}
               | input Input                    {Input $2}


Output         : string                         {([OutString $1], True)}
               | string ";"                     {([OutString $1], False)}
               | Var                            {([OutVar $1], True)}
               | Var ";"                        {([OutVar $1], False)}
               | string ";" Output              {((OutString $1):(fst $3), snd ($3))}
               | Var ";" Output                 {((OutVar $1):(fst $3), snd ($3))}

Input          : string ";" Var                 {(InputStuff [$1] $3, False)}
               | string Var                     {(InputStuff [$1] $2, True)}
               | Var                            {(InputStuff [] $1, False)}


Var            : var                            {$1} 


{

makeOperandVar (TkIntVar x) = IntVar x
makeOperandVar (TkFloatVar x) = FloatVar x
makeOperandVar _ = error "String vars not allowed!"

makeOperandConstant (TkIntConst x) = IntConst x
makeOperandConstant _ = error "invalid makeOperandConstant call"

parseError :: [Token] -> a
parseError ls = error ("Parse error on: " ++ (show ls))

data SyntaxTree  
      = Line Int [Command]
      | Lines SyntaxTree SyntaxTree
--      | []
      deriving Show

data Command
      = Command IOCommand
      | ControlStructure ControlStruct
      | Goto Int
      | NOOP
      | Assignment Var NumExpr
      deriving Show


data ControlStruct
      = If BoolExpr [Command]
      | For Var (Constant,Constant,Constant) [(Int,[Command])]
--      | Empty
      deriving Show

{-
data BoolExpr
      = BoolExprVarConst   { var :: Var , infixBoolFunc :: (Ord a) => a -> a -> Bool , const' :: Constant }
      | BoolExprVarVar     { var1 :: Var , infixBoolFunc :: (Ord a) => a -> a -> Bool , var2 :: Var }
      | BoolExprConstConst { const1 :: Constant , infixBoolFunc :: (Ord a) => a -> a -> Bool , const2 :: Constant }
      deriving Show
-}

data BoolExpr
      = BoolExprVarConst   { var :: Var , infixBoolFunc :: String , const' :: Constant }
      | BoolExprVarVar     { var1 :: Var , infixBoolFunc :: String , var2 :: Var }
      | BoolExprConstConst { const1 :: Constant , infixBoolFunc :: String , const2 :: Constant }
      deriving Show

data IOCommand 
      = Print ([Output], Bool)
      | Input (InputStuff, Bool)
      deriving Show

data Output
      = OutString String  
      | OutVar Var
      deriving Show

data InputStuff 
      = InputStuff [String] Var
      deriving Show

data NumExpr
      = NumExpr (Operand,Operand) String
      | NumOp Operand
      deriving Show

data Operand
      = IntVar String
      | FloatVar String
      | IntConst Int
      | FloatConst Float
      deriving Show

getParseTree = basicParse . alexScanTokens 


}

