import BasicAlex

main = do
        con <- getContents 
        print (alexScanTokens con)
