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
      string          { MyString $$ }
      vars             { TkVars $$ }
%%


SyntaxTree        : Command                     {Start $1}
                  | Command SyntaxTree          {StartRek $1 $2}


Command : IOCommand           {Command $1}


IOCommand  : print string Vars   {Print $2 $3}
           | input string Vars   {Input $2 $3}


Vars     : vars                  {Vars $1} 
--         | Vars                 {Vars $1}

{

parseError :: [Token] -> a
parseError _ = error "Parse error"


data SyntaxTree  
      = Start Command
      | StartRek Command SyntaxTree
      deriving Show

data Command
      = Command IOCommand
      deriving Show

data IOCommand 
      = Print String Vars
      | Input String Vars
      deriving Show

data Vars 
      = Vars [String]                
--      | Vars [String]
      deriving Show


getParseTree str = basicParse $ alexScanTokens str

}

