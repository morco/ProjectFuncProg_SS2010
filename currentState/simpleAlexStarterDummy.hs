--import BasicAlex
import Parser.Lexer.BasicAlexMonad
import Parser.ParserTypes

main = do
        con <- getContents 
        --print (alexScanTokens con)
        --print (scanner con)
        let tks = map (\tkwrap -> _token tkwrap) $ getTokens con
        --print $ head $ head $ map getCon $ filter isStr tks
        print tks


isStr (TkString _) = True
isStr _ = False

getCon (TkString str) = str
getCon _ = error "blu"
