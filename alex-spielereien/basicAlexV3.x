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
  [\"].*[\"]			        { \s -> MyString (tail $ take ((length s) - 1) s) }
  $alpha [$alpha $digit \$ \%]*	        { \s -> Var s }

{

-- 
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
