--import BasicAlex
import BasicAlexMonad

main = do
        con <- getContents 
        --print (alexScanTokens con)
        print (scanner con)
