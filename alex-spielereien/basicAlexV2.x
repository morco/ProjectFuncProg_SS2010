{
module Main (main) where

import StringTokenizer
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-

  $white+				;
  "--".*				;
  [^]$digit+				;
  \;             			;
  input					{ \s -> Input }
  print					{ \s -> Print }
  [\"]$alpha*[\"]			{ \s -> PlaceHolder }
  $alpha [$alpha $digit \$ \%]*	        { \s -> Var s }

{
-- Each action has type :: String -> Token

-- The token type:
data Token =
 	Input 		|
--	Print  		
	Print  		|
	MyString String	|
	PlaceHolder	|
--	MyString String	
	Var String	
	deriving (Eq,Show)


putTogether [] _ = []
putTogether (tk:tks) (str:strs) = if (tk == PlaceHolder)
                                      then (MyString str) : putTogether tks strs
                                      else tk : putTogether tks (str:strs)

main = do
  s <- getContents
  let tks = (alexScanTokens s)
  strs <- readAllStrings s
  print $ putTogether tks strs
}
