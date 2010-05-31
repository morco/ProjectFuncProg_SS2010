module Main where
import Parsec
import qualified ParsecToken as P
import ParsecLanguage (emptyDef)


basic64Def 
    = emptyDef
    { commentStart = "{-" -- TODO make it rigth
    , commentEnd   = "-}"
    , commentLine  = "REM"
    , nestedComments = True
    , identStart     = letter
    , identLetter    = alphaNum <|> oneOf "$%"
    , reservedNames =  ["print", "input"]
    , reservedOpNames= []
    , caseSensitive =  False
    }


-- The parser
-- expr  =   parens expr
--       <|> identifier
--             <|> ...

-- The lexer
lexer        = P.makeTokenParser basic64Def
parens       = P.parens lexer
braces       = P.braces lexer
identifier   = P.identifier lexer
reserved     = P.reserved lexer

main = 
   do
     inp <- getContents
     tokens <- reserved inp  
     print tokens

