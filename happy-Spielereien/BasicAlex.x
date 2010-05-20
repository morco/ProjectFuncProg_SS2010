{
module BasicAlex where
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-

  $white+				;
  "--".*				;
  [^]$digit+				;
  \;             			;
  input					{ \s -> TkInput }
  print					{ \s -> TkPrint }
  [\"].*[\"]			        { \s -> MyString (tail $ take ((length s) - 1) s) }
  $alpha [$alpha $digit \$ \%]*	        { \s -> TkVar s }

{

-- 
-- Each action has type :: String -> Token

-- The token type:
data Token =
 	TkInput 		|
--	Print  		
	TkPrint  		|
	MyString String	|
--	MyString String	
	TkVar String	
	deriving (Eq,Show)

                   

--main = do
--  s <- getContents
--  print (alexScanTokens s)
}
