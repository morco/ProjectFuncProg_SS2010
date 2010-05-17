-- Performance test; run with input /usr/dict/words, for example
{
module Main (main) where
}

%wrapper "monad"

words :-

--$white+			{ skip }
--\"                      { skip }
--[A-Za-z0-9\'\-]+	{ word }
<0>      ([^\"] | \n)+  ;
--<0>      \"             { begin string }
<0>      \"             { andBegin word string }
<string> [^\"]          { word }
--<string> \"             { begin 0 }
<string> \"             { andBegin word 0 }
-- hmm, wenn ich das unten stehende benutze, terminiert er immerhin, aber liefert mir die Zeichen nur einzeln
--<string> \"             { skip }

{
--word (_,_,input) len = return (take len input)
word (_,_,input) len = return (take len input)

-- In this version scanner returns a list of all read tokens
scanner str = runAlex str $ do
  let loop i = do tok <- alexMonadScan; 
		  if tok == "stopped." || tok == "error." 
			then return i
			else do let i' = i++[tok] in i' `seq` loop i'
  loop []

alexEOF = return "stopped."


{-completeString ((y:ys):xs) isFirst newList
                          | y == "\"" && isFirst = completeString ((ys):xs) False newList++[]
                          | y == "\"" && not isFirst = completeString ((ys):xs) True-}

getAllPosOfPattern [] _ _ = []
getAllPosOfPattern (x:xs) pat curPos  = if x == pat 
                                         then curPos : getAllPosOfPattern xs pat (curPos + 1)
                                         else getAllPosOfPattern xs pat (curPos + 1)

getOnlyEvenIndex [] _  = []
getOnlyEvenIndex (x:xs) curPos  = if (mod curPos 2) == 0
                                         then x : getOnlyEvenIndex xs (curPos + 1)
                                         else getOnlyEvenIndex xs (curPos + 1)

completeString [] _ = []
completeString (x:rest) strList = (flatten ((takeWhile ((/=) "\\") (drop (x+1) strList)))) : completeString rest strList

flatten [] = []
flatten (x:xs) = x ++ flatten xs

--unEither (Right (String a)) = a
--unEither (Left (String a)) = a

unEither (Right a) = a
unEither (Left a) = a

makeStringToList str = mstl' (tail (dropWhile ((/=) '[') str))
		where
                  mstl' (']':_) = []
                  mstl' (x:xs) = [x]: mstl' xs

main = do
 s <- getContents
 --print (scanner s)
 --scan <- (scanner s)
 --let scan = unEither (scanner s)
 let scan = makeStringToList $ show (scanner s)
 --print $ filter ((/=) "\"") $ filter ((/=) ",") scan
 let scan2 = filter ((/=) "\"") $ filter ((/=) ",") scan
 let posOfSep = getOnlyEvenIndex (getAllPosOfPattern scan2 "\\" 0) 0
 --print (posOfSep)
 let nstr = completeString posOfSep scan2
 print nstr
}

