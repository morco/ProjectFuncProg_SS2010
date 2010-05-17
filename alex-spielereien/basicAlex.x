{
module Main (main) where
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
  [\"]$alpha*[\"]			{ \s -> MyString s }
--  <0>      ([^\"] | \n)*                ;
--  <0>      \"                           { begin string }
--  <string> [^\"]                        { printLn }
--  <string> \"                           { begin 0 }
  $alpha [$alpha $digit \$ \%]*	        { \s -> Var s }

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

main = do
  s <- getContents
  print (alexScanTokens s)
}
