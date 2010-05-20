{
module Main where

import BasicAlex
import Data.Char
}

%name calc
%tokentype { Token }
%error { parseError }

%token 
      print           { TkPrint }
      input           { TkInput }
      string          { MyString $$ }
      var             { TkVar $$ }
%%


S        : Command             {Start $1}
         | Command S           {StartRek $1 $2}


Command : IOCommand           {Command $1}

IOCommand  : PRINT              {}
           | INPUT              {}

PRINT    : print string Vars   {Print $2 $3}

INPUT    : input string Vars   {Input $2 $3}

Vars     : var                  {Var $1}
         | Vars                 {Vars $1}

{

parseError :: [Token] -> a
parseError _ = error "Parse error"


data S  
      = Start Command
      = StartRek Command S
      deriving Show

data Command
      = Command IOCommand
      deriving Show

data IOCommand 
      = Print String Vars
      | Input String Vars
      deriving Show

data Vars 
      = Var String
      | Vars [String]
      deriving Show


--main = getContents >>= print . calc . lexer
main = getContents >>= print . calc . alexScanTokens 
}

