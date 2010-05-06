--Mein grausamer erster Versuch, musst du dir nicht unbedingt anschauen, wobei mir eine Sache noch im Magen liegt,
--die ich heute habe vergessen zu fragen, wenn du dir vllt doch die nicht auskommentierte Variante von 
-- ignoreComments anschauhst, da benutze ich diese Funktion startsWith mit filter, was mir bei der Definition 
-- irgendwie zum ersten Mal richtig aufgefallen ist, dass man genau aufpassen muss, wie herum man die Argumente setzt
-- Weil wenn sie vertausche, dann wuerde das Anfangsvergleichmuster an die Liste gebunden, weil ich sie ja beim
-- filteraufruf nicht vertauschen koennte. Ist das normal so, oder kenne ich nur den Trick nicht, wie man das machen
-- koennte?

--main = interact testlines
--main = interact (tokenizeShow . ignoreComments) >> putStrLn ""
main = getContents >>= (chooseAction . tokenize . ignoreComments) >> putStrLn ""

testlines inp = unlines (map ((++) " !!war hier!!") (lines inp))

--ignoreComments inp = unlines (filter startsWithPred (lines inp))
ignoreComments inp = unlines (filter (not . startsWith "--") (lines inp))
--ignoreComments inp = unlines [x | x <- (lines inp), not (startsWithPred x)]

startsWithPred ('-':'-':_) = True
--startsWithPred ("--"++_) = True
startsWithPred _ = False

startsWith begin xs = (take (length begin) xs) == begin

tokenize string = words string

--tokenizeShow string = flatten' (putStringsTogether (words string) False)
tokenizeShow string = flatten' (words string)
	      where
		flatten' [] = ""
		flatten' (x:xs) = x++" : "++flatten' xs


{-mywords string = [[]]:myw' string ' ' 
	      where 
		myw' (x:xs) sep
		   | x == '"' && sep != '"' = [[]]:myw' xs '"'
		   | x == '"' && sep == '"' = [[]]:myw' xs ' '
		   | x == ' ' && sep == ' ' = [[]]:myw' xs ' ' 
		   | otherwise = [[]]:myw' xs ' ' -}


{-putStringsTogether [] isElofString = []
putStringsTogether (w:words) isElofString
			-- starts a new output string here
			| startsWith w "\"" && not isElofString = w++putStringsTogether words True
			-- ends a  output string here
			| startsWith w "\"" && isElofString = w:putStringsTogether words False
			-- word is no output string element
			| otherwise = w:putStringsTogether words False-}

--makeSingleString listStrings

--makeMyWords 

{--findAllOcc string pattern = 
		     let 
			f = findOcc string pattern

findOcc [] pattern number pos = -1
findOcc (x:xs) pattern number pos
		| startsWith pattern x && number == 1 = pos
		| startsWith pattern x && number > 1 = findOcc xs pattern (number-1) (pos+1)
		| otherwise = findOcc xs pattern number (pos+1)-}


--chooseAction (fstoken:tokens)
chooseAction ("print":text:_) = putStrLn text


