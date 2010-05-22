{
module BasicAlex where

import Data.List
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters
@var = $alpha [$alpha $digit ]* (\$ | \%)? 
@string = \" .* \"                                     -- " 

tokens :-

  $white+				                    ;
  "--".*				                    ;
  ^ $digit+				                    ;

  input $white+ @string $white* \; $white* @var ($white+ @var)*      { \s -> buildToken s }
  print $white+ @string $white* \; ($white* @var)? ($white+ @var)*   { \s -> buildToken s } 

  @var    {\s -> TkVar (TkStringVar s)}

{

 
-- Each action has type :: String -> Token

-- The token type:
data Token =
 	TkInput TkString [Var]   |
	TkPrint TkString [Var]   |
	TkVar Var
     deriving (Eq,Show)

--type TkString = String
data TkString = 
         TkString String
     deriving (Eq, Show)


data Var =
       TkStringVar String |
       TkIntVar String    |
       TkFloatVar String
     deriving (Eq, Show)



buildToken str 
        | isPrefixOf "input" str = TkInput (buildString str '\"') (buildVarList $ tail $ dropWhile ((/=) ';') str)
        | isPrefixOf "print" str = TkPrint (buildString str '\"') (buildVarList $ tail $ dropWhile ((/=) ';') str)
        | otherwise              = error "unknown line starter"
                
buildString str del = TkString (takeWhile ((/=) del) $ tail $ dropWhile ((/=) del) str)

buildVarList str = buildVarList' $ words str
     where
       buildVarList' [] = []
       buildVarList' (x:xs)
                | isSuffixOf "$" x = (TkStringVar x) : buildVarList' xs
                | isSuffixOf "%" x = (TkIntVar x) : buildVarList' xs
                | otherwise        = (TkFloatVar x) : buildVarList' xs


}

