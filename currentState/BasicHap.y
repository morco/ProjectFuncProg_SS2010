{
--module BasicHap(getParseTree,SyntaxTree, Command, IOCommand, Vars) where
module BasicHap where

import BasicAlex
import Data.Char

}

%name basicParse
%tokentype { Token }
%error { parseError }

%token 
      print           { TkPrint }
      input           { TkInput }
      stringLiteral          { TkString $$ }
      stringVar             { TkStringVar $$ }
      intVar             { TkIntVar $$ }
      floatVar             { TkFloatVar $$ }
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
      "-"             { TkMinus }
      "*"             { TkTimes }
      "/"             { TkDiv }

      len             { TkLen }
      "("             { TkBracketOpen }
      ")"             { TkBracketClose }

      or              { TkLogOr }
      and             { TkLogAnd }
      neg             { TkLogNeg }

      return          { TkReturn }
      gosub           { TkGoSub }
%%


SyntaxTree          : lineNr Commands                               {[($1,$2)]}
                    | lineNr Commands SyntaxTree                    {($1,$2):$3}
                    | lineNr next NumVar                            {[($1, [NOOP])]} -- muss aktuell so hier extra 
                                                                                     --  stehen, sonst parst er das 
                                                                                     --   ganze Programm als Inhalt 
                                                                                     --    des 1. for
                    | lineNr return                                  {[($1, [Return])]} 

 
Commands            : Command                                        {[$1]}
                    | Command ":" Commands                           {$1:$3}

Command             : IOCommand                                      {Command $1}
                    | ControlStruct                                  {ControlStructure $1}
                    | goto int                                       {Goto ((\(TkIntConst x) -> x)$2)}
--               | next Var                       {NOOP}
                    | Assignment                                     {$1}
                    | return                                     {Return}


Assignment          : NumVar "=" NumExpr                             {ArithAssignment $1 $3}
                    | stringVar "=" StringExpr                       {StringAssignment (StringVar $1) $3}

StringExpr          : BasicString                                    {StringOp $1}
                    | BasicString "+" BasicString                    {StringExpr ($1,$3) "+"} 

BasicString         : stringLiteral                                  {StringLiteral $1}
--                  | StringOperation                                {String_Operation $1}
                    | stringVar                                      {StringVar_BString (StringVar $1)}

NumFunction         : len "(" stringLiteral ")"                      {Len $3}
                    | len "(" stringVar ")"                          {LenVar (StringVar $3)}


NumExpr             : NumExpr NumOperationsLev2 Term                 {NumExpr ($1,$3) $2}
                    | Term                                           {$1}
                    | NumFunction                                    {NumFunc $1}


NumOperationsLev2   : "+"               {"+"}          
                    | "-"               {"-"}


NumOperationsLev1   : "*"               {"*"}
                    | "/"               {"/"}


Term                : Term NumOperationsLev1 Factor          {NumExpr ($1,$3) $2}
                    | Factor                           {$1}

Factor              : Operand                    {NumOp $1}
                    | "(" NumExpr ")"            {$2}

Operand             : NumVar                                         {OpVar $1}
                    | int                                            {makeArithOperandConstant $1}

ControlStruct       : if BoolExpr then IfBody                        {If $2 $4}
                    | if BoolExpr IfBody                             {If $2 $3}
                    | for NumVar "=" Operand to Operand step Operand SyntaxTree {For $2 ($4,$8,$6) $9} -- step auch var??
                    | for NumVar "=" Operand to Operand SyntaxTree   {For $2 ($4,(makeArithOperandConstant (TkIntConst 1)),$6) $7} 
                    | gosub int           {GoSub ((\(TkIntConst x) -> x)$2)}

IfBody              : int                                            {[Goto ((\(TkIntConst x) -> x)$1)]}
--IfBody              : Commands                                       {$1} --  <--- verursacht shift/red conflicts
                    | Commands                                       {$1} --  <--- verursacht shift/red conflicts


BoolExpr            : SimpleBoolExpr                                     {$1}
                    | "(" BoolExpr ")" LogicOperation "(" BoolExpr ")"   {BoolExprLog ($2,$6) $4}

LogicOperation      : or                                             {"||"} -- Kurzschlussauswertung ???
                    | and                                            {"&&"}
                    | neg                                            {"neg"}

SimpleBoolExpr      : StringExpr CompareOperator StringExpr          {BoolExprString ($1,$3) $2}
                    | NumExpr CompareOperator NumExpr                {BoolExprNum ($1,$3) $2}
 
CompareOperator     : "="                                            {"=="}
                    | "<"                                            {"<"}
                    | ">"                                            {">"}
                    | "<>"                                           {"/="}
                    | "<="                                           {"<="}
                    | ">="                                           {">="}

Constant            : int                                            {$1}
--               | float                          {$1}

IOCommand           : print Output                                   {Print $2}
                    | print                                          {Print ([], True)}
                    | input Input                                    {Input $2}


Output              : stringLiteral                                  {([OutString $1], True)}
                    | stringLiteral";"                               {([OutString $1], False)}
                    | Var                                            {([OutVar $1], True)}
                    | Var ";"                                        {([OutVar $1], False)}
                    | stringLiteral";" Output                        {((OutString $1):(fst $3), snd ($3))}
                    | Var ";" Output                                 {((OutVar $1):(fst $3), snd ($3))}

Input               : stringLiteral";" Var                           {(InputStuff [$1] $3, False)}
                    | stringLiteral Var                              {(InputStuff [$1] $2, True)}
                    | Var                                            {(InputStuff [] $1, False)}


Var                 : stringVar                                      {StringVar_Var (StringVar $1)} 
                    | NumVar                                         {NumVar_Var $1}

NumVar              : intVar                                         {IntVar $1}
                    |  floatVar                                      {FloatVar $1}

{


-- TODO: FLoat COnstants
makeArithOperandConstant (TkIntConst x) = IntConst x
makeiArithOperandConstant _ = error "invalid makeOperandConstant call"

parseError :: [Token] -> a
parseError ls = error ("Parse error on: " ++ (show ls))

data SyntaxTree  
      = Line Int [Command]
      | Lines SyntaxTree SyntaxTree
      deriving Show

data Command
      = Command IOCommand
      | ControlStructure ControlStruct
      | Goto Int
      | NOOP
      | ArithAssignment NumVar NumExpr
      | StringAssignment StringVar StringExpr
      | Return
      deriving Show

data StringExpr
      = StringOp BasicString
      | StringExpr (BasicString,BasicString) String
      deriving Show

data BasicString
      = StringVar_BString StringVar
      | StringLiteral String
--      | String_Operation StringOperation
      deriving Show

data NumFunction
      = Len String
      | LenVar StringVar
      deriving Show


data ControlStruct
      = If BoolExpr [Command]
      | For NumVar (Operand,Operand,Operand) [(Int,[Command])]
--    | GoSub Int [(Int,[Command])] 
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
      deriving Show

data Output
      = OutString String  
      | OutVar Var
      deriving Show

data InputStuff 
      = InputStuff [String] Var
      deriving Show

data NumExpr
     -- = NumExpr (Operand,Operand) String
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

getParseTree = basicParse . alexScanTokens 


}

