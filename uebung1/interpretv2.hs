--Der Versuch des Interpreters 2ter Teil

--die main fliegt mir so aktuell noch um die Ohren, weil er als erstes argument, ne funktion vom typ 
-- string -> irgendwas erwartet, und inferred IO a, versteh ich nicht so wirklich, execute hat doch string als
-- argument

--main = interact (mapM execute lines)
main = getContents >>= mapM execute lines

-- hmm, hier beschwert er sich, weil ich IO a angegeben habe, also Variable, und er inferred IO (), versteh ich
-- nicht muesste doch passen
execute :: String -> IO a
execute line = execute' (normalize line)

-- ja, denke das hier ist ziemlich klar, das ich sonst putStrLn "Leer!" zurueck gebe, und noch nicht
-- IO () oder sowas, ist weil er IO nicht findet, denke dass ich das auch noch importieren muss
execute' string
           | startsWith "print" string = putStrLn (makeOutPutString  string '"')
	   | otherwise = putStrLn "leer!"

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

--Das Entfernen der Leerzeichen habe ich erstmal rausgenommen, weil ich mir erst nochmal anschauen muss, wie man
--Module importiert
normalize string = string 
  	{-let 
	   str = "3" --dropWhile Char.isSpace string
        in
	  if str == "\n" 
	    then
	      []
	    else
	      str-}
