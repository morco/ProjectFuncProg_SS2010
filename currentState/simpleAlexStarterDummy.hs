--import BasicAlex
import Parser.Lexer.BasicAlexMonad

main = do
        con <- getContents 
        --print (alexScanTokens con)
        --print (scanner con)
        print (getTokens con)
