--import BasicAlex
import Parser.Lexer.BasicAlexMonad
import Parser.ParserTypes

main = do
        con <- getContents 
        --print (alexScanTokens con)
        --print (scanner con)
        print (map (\tkwrap -> _token tkwrap) $ getTokens con)
