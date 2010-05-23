{
module BasicAlex where
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters
--$var = [a-zA-Z] [[a-zA-Z] [0-9] \$ \%]*   -- Variable

tokens :-

  $white+				;
  "--".*				;
  [^]$digit+				;
  \;             			;
  input					{ \s -> TkInput }
  print					{ \s -> TkPrint }
  [\"].*[\"]			        { \s -> MyString (tail $ take ((length s) - 1) s) } -- "
--  $alpha [$alpha $digit \$ \%]* [$white+ $alpha [$alpha $digit \$ \%]*]*        { \s -> TkVar s }
  $alpha [$alpha $digit \$ \%]* ($white+ $alpha [$alpha $digit \$ \%]*)*        { \s -> TkVars $ words s }
--  $var                                  { \s -> TkVar s }

{

-- Each action has type :: String -> Token

-- The token type:
data Token =
 	TkInput 		|
	TkPrint  		|
	MyString String	|
--	TkVar String	
	TkVars [String]	
	deriving (Eq,Show)
                   

}
