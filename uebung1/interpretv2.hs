--Der Versuch des Interpreters 2ter Teil
import Data.Char
import Data.List

-- mit do-notation geht es jetzt, yipphie! nr noch rausfinden, warum er am Ende die leere Liste noch ausgibt 
-- aha, weil ich nicht returned habe, hmm, aber so ganz, ist quasi standardmaessig print eingestellt?? oder wie?

main = do
     con <-getContents 
     mapM execute (lines con)
     return ()


execute :: String -> IO ()
execute line = execute' (normalize line)


-- ach, das ging natuerlich mit return, ich depp ;D
execute' :: String -> IO ()
execute' string
           | isPrefixOf "print" string = putStrLn (makeOutPutString  string '"')
	   | otherwise = return ()


--diese Funktion benutze ich um mir den ausgabestring zu basteln, indem ich von dem uebergebenen String
-- alles bis zum ersten auftauchen des uebergebenen Grenzzeichen wegschmeisse, dann mr alles behalte bis zum
-- 2ten aftauchen des grenzzeichen (das tail brauche ich, damit er nicht beim ersten delimiter gleich haengt)
makeOutPutString :: String -> Char -> String 
makeOutPutString string strDelimiter = 
		takeWhile ((/=) strDelimiter) (tail (dropWhile ((/=) strDelimiter) string))



--Diese Funktion entfernt fuehrende Leerzeichen, so wie Leerzeilen
normalize :: String -> String  
normalize string =  
  	let 
	   str = dropWhile isSpace string
        in
	  if str == "\n" 
	    then
	      []
	    else
	      str
