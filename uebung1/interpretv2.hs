--Der Versuch des Interpreters 2ter Teil
import Data.Char

-- mit do-notation geht es jetzt, yipphie! nr noch rausfinden, warum er am Ende die leere Liste noch ausgibt 
-- aha, weil ich nicht returned habe, hmm, aber so ganz, ist quasi standardmaessig print eingestellt?? oder wie?

--main = interact (mapM execute lines)
--main = getContents >>= mapM execute lines
main = do
     con <-getContents 
     mapM execute (lines con)
     return ()

--execute :: String -> IO a
execute line = execute' (normalize line)

-- ach, das ging natuerlich mit return, ich depp ;D
execute' string
           | startsWith "print" string = putStrLn (makeOutPutString  string '"')
	   | otherwise = return ()

--diese Funktion benutze ich um mir den ausgabestring zu basteln, indem ich von dem uebergebenen String
-- alles bis zum ersten auftauchen des uebergebenen Grenzzeichen wegschmeisse, dann mr alles behalte bis zum
-- 2ten aftauchen des grenzzeichen (das tail brauche ich, damit er nicht beim ersten delimiter gleich haengt)
makeOutPutString string strDelimiter = 
		takeWhile (isNotEqual strDelimiter) (tail (dropWhile (isNotEqual strDelimiter) string))

--Name sagt eigentlich schon alles, geht sicher schoener, weis aktuell nur leider nicht wie
isNotEqual c1 c2 = not (c1 == c2)

-- Diese Funktion vergleicht, ob ein String mit einem gegeben pattern anfaengt, schaetze mal, dass es dafuer
-- auch Bibliotheksfubktionen gibt, aber hab sie noch nicht gefunden
startsWith begin xs = (take (length begin) xs) == begin

--Diese Funktion entfernt fuehrende Leerzeichen, so wie Leerzeilen
normalize string =  
  	let 
	   str = dropWhile isSpace string
        in
	  if str == "\n" 
	    then
	      []
	    else
	      str
