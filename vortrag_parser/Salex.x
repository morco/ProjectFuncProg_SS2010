{

module Salex where

}

%wrapper "basic"

$digit = 0-9			        -- digits
$alpha = [a-zA-Z]		        -- alphabetic characters
@var = $alpha [$alpha $digit \_ \']*    -- variable

tokens :-

-------------------- <ignores> ---------------------------------

  $white+				;
  "--".*				;

-------------------- </ignores> --------------------------------


  let					{ \s -> TkLet }
  in					{ \s -> In }
  $digit+				{ \s -> TkInt (read s) }
  @var		                        { \s -> TkVar s }

-------------------- <operators> -------------------------------

  \=			                { \s -> TkEq }
  \+             			{ \s -> TkPlus }
  \-             			{ \s -> TkMinus }
  \*             			{ \s -> TkTimes }
  \/             			{ \s -> TkDiv }
  \(             			{ \s -> TkOB }
  \)             			{ \s -> TkCB }

-------------------- </operators> ------------------------------

{

-- Each action has type :: String -> Token

-- The token type:
data Token =
 	TkLet 		|
	In  		|
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


tokenize str = alexScanTokens str

}
