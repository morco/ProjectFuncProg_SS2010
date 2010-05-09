module Main
	where

--main = askForNumbers >>= doComputations
main = do
        ioList <- askForNumbers 
        doComputations ioList
        return ()

askForNumbers :: IO [Integer]
askForNumbers = do 
                   putStrLn "Give me a number (or 0 to end)" 
                   num <- getLine
                   let rnum = read num
                   --return rnum
                   if (rnum == 0)
			then do 
                          return []	
			else do
			  rest <- askForNumbers
			  return (rnum : rest) 

--doComputations :: IO [Integer] -> IO ()
doComputations list = do
                           --list <- ioList
                           putStrLn ("The sum is: " ++ (show . sum) list)
                           putStrLn ("The product is: " ++ show (foldl (*) 1 list))
                           --map (putStrLn ("The factorial")
                           doAllFactorials list


doAllFactorials [] = return ()
doAllFactorials (x:xs) = do
                           putStrLn ("The factorial for " ++ (show x) ++ " is: " ++ (show . fact) x)
                           doAllFactorials xs
			


fact 1 = 1
fact n = n * fact (n-1)
