{
module Main (main) where
}

%wrapper "monad"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-

     <0>      ([^\"] | \n)*  ;
     <0>      \"             { begin string }
--    <string> [^\"]          { stringchar }
     <string> [^\"]          { skip }
     <string> \"             { begin 0 }

{
-- Each action has type :: String -> Token

-- The token type:
data Token =
 	Input 		|
--	Print  		
	Print  		|
	MyString String	|
--	MyString String	
	Var String	
	deriving (Eq,Show)

scanner str = runAlex str $ do
  let loop i = do tok <- alexMonadScan;
                  if tok == "sop!!" || tok == "error."
                        then return i
                        else do let i' = i+1 in i' `seq` loop i'
  loop 0


alexEOF = return "sop!!"

main = do
  s <- getContents
  print (scanner s)
}
