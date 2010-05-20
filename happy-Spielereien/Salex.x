{
module Salex where
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-

  $white+				;
  "--".*				;
  let					{ \s -> TkLet }
  in					{ \s -> In }
  $digit+				{ \s -> TkInt (read s) }
--  [\=\+\-\*\/\(\)]			{ \s -> Sym (head s) }
  \=			                { \s -> TkEq }
  \+             			{ \s -> TkPlus }
  \-             			{ \s -> TkMinus }
  \*             			{ \s -> TkTimes }
  \/             			{ \s -> TkDiv }
  \(             			{ \s -> TkOB }
  \)             			{ \s -> TkCB }
  $alpha [$alpha $digit \_ \']*		{ \s -> TkVar s }

{
-- Each action has type :: String -> Token

-- The token type:
data Token =
 	TkLet 		|
	In  		|
--	Sym Char	|
        TkPlus          |
        TkMinus         |
        TkEq            |
        TkTimes         |
        TkDiv           |
        TkOB            |
        TkCB            |
	TkVar String	|
	TkInt Int
	deriving (Eq,Show)

--tokenize str = do
--  s <- getContents
--  print (alexScanTokens s)

}
