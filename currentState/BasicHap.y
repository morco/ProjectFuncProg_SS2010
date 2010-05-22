{
--module BasicHap(getParseTree,SyntaxTree, Command, IOCommand, Vars) where
module BasicHap where

import BasicAlex
import Data.Char
import IO

}

%name basicParse
%tokentype { Token }
%error { parseError }

%token 
      print           { TkPrint }
      input           { TkInput }
      string          { MyString $$ }
      var             { TkVar $$ }
%%


SyntaxTree        : Command                     {Start $1}
                  | Command SyntaxTree          {StartRek $1 $2}


Command : IOCommand           {Command $1}


IOCommand  : print string Vars   {Print $2 $3}
           | input string Vars   {Input $2 $3}


Vars     : var                  {Var $1} -- an dieser Stelle bzw an Pos (*2) muesste ich ja sowas sagen, wie lege an/
                                         -- bzw hole mir in meiner Map den Eintrag a$ 
                                         -- Das Problem ist, wenn ich das einfach in data packe als Konstruktor bzw.
                                         -- Wert, dann haette der erste input-Befehl ja ne andere Map als der nach
                                         -- nachfolgende print-Befehl, aber die muessen ja auf der selben Map
                                         -- operieren
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
      = Var String                      --- Pos (*2)
      | Vars [String]
      deriving Show


--main = getContents >>= print . calc . lexer
--main = getContents >>= print . calc . alexScanTokens 
--getParseTree = getContents >>= return . basicParse . alexScanTokens 
getParseTree = 
      do
       handle <- openFile "miniBasiProg.bs" ReadMode
       contents <- hGetContents handle
       putStr contents
       --print (alexScanTokens contents)
       let parse =  (basicParse . alexScanTokens) contents
       hClose handle
       return parse

}

