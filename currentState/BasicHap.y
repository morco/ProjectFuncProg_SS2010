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
      string          { TkString $$ }
      var             { TkVar $$ }
      lineNr          { TkLineNumber $$ }
      ";"             { TkStringConcat }
      ":"             { TkSingleLineCommandCombinator }
--      ","             { TkStringConcatWithTab } -- <--- TODO!!!

%%


SyntaxTree  : lineNr Commands                {Line $1 $2}
            | lineNr Commands SyntaxTree     {Lines (Line $1 $2) $3}

Commands    : Command                        {[$1]}
            | Command ":" Commands           {$1:$3}

Command     : IOCommand                      {Command $1}


IOCommand   : print Output                   {Print $2}
            | print                          {Print ([], True)}
            | input Input                    {Input $2}


Output      : string                         {([OutString $1], True)}
            | string ";"                     {([OutString $1], False)}
            | Var                            {([OutVar $1], True)}
            | Var ";"                        {([OutVar $1], False)}
            | string ";" Output              {((OutString $1):(fst $3), snd ($3))}
            | Var ";" Output                 {((OutVar $1):(fst $3), snd ($3))}

Input       : string ";" Var                 {(InputStuff [$1] $3, False)}
            | string Var                     {(InputStuff [$1] $2, True)}
            | Var                            {(InputStuff [] $1, False)}


Var         : var                            {$1} 


{

parseError :: [Token] -> a
parseError ls = error ("Parse error on: " ++ (show ls))

data SyntaxTree  
      = Line Int [Command]
      | Lines SyntaxTree SyntaxTree
      deriving Show

data Command
      = Command IOCommand
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


--main = getContents >>= print . calc . lexer
--main = getContents >>= print . calc . alexScanTokens 
getParseTree = basicParse . alexScanTokens 
{-getParseTree = 
      do
       handle <- openFile "miniBasiProg3.bs" ReadMode
       contents <- hGetContents handle
       putStr contents
       --print (alexScanTokens contents)
       let parse =  (basicParse . alexScanTokens) contents
       hClose handle
       return parse-}

}

