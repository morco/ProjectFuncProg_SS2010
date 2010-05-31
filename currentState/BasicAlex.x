{
module BasicAlex where

import Data.List
import Data.Char

}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

-- @reservedWords = print | input | for | to | next | if | then  -- wird so wohl nicht gehen, 
                                                                 -- da ich reguläre ausdrücke nicht negieren kann
@varOrResWord = $alpha [$alpha $digit ]* (\$ | \%)? 
@string = \" [. # \"]* \"                                     -- " 

tokens :-

  $white+				                    ;
--  "--".*				                    ;
  [. # \n]^ "REM".*				                    ;  -- Commentar
  ^ $digit+ $white+ "REM".*				            ;
  ^ $digit+ 				                    {\s -> TkLineNumber (read s)}
  [.]^ \; /.*                                                       {\s -> TkStringConcat }

--  [$white \;]^ @varOrResWord / ($white+ | \; | \n)  {\s -> buildVarOrResWord s }
  [$white \; :]^ @varOrResWord  / ($white+ | \; )  {\s -> buildVarOrResWord s }
--  @varOrResWord   {\s -> buildVarOrResWord s }
  @string                                                   {\s -> buildString s '"'}

  \?                                                         {\s -> TkPrint }
  \,                                                         {\s -> TkStringConcatWithTab}
  :                                                         {\s -> TkSingleLineCommandCombinator}
  \=                                                        {\s -> TkEqual}
  \<\>                                                      {\s -> TkUnEqual}
  \<                           {\s -> TkLt}
  \>                           {\s -> TkGt}
  \<\=                         {\s -> TkGE}
  \>\=                         {\s -> TkLE}

  $digit+                      {\s -> TkConst (TkIntConst (read s))}

{

<<<<<<< HEAD
=======
 
>>>>>>> redesign_alexHappy
-- Each action has type :: String -> Token

-- The token type:
data Token =
<<<<<<< HEAD
 	TkInput 		|
	TkPrint  		|
	MyString String	|
--	TkVar String	
	TkVars [String]	
	deriving (Eq,Show)
                   
=======
        TkLineNumber Int         |
        TkPrint                  |
        TkInput                  |
        TkStringConcat           |
        TkStringConcatWithTab    |
        TkFor                    |
        TkTo                     |
        TkNext                   |
        TkIf                     |
        TkThen                   |
        TkString String          |
        TkSingleLineCommandCombinator |
        TkEqual                       |
        TkLt                          |
        TkGt                          |
        TkUnEqual                     |
        TkGE                          |
        TkLE                          |
        TkConst Constant              |
	TkVar Var
     deriving (Eq,Show)


data Constant = 
       TkIntConst Int  |
       TkFloatConst Float
     deriving (Eq, Show)

data Var =
       TkStringVar String |
       TkIntVar String    |
       TkFloatVar String
     deriving (Eq, Show)



buildVarOrResWord str = 
      let
        bresw = buildResWord str
      in
        if bresw == []
            then TkVar $ buildVar str
            else head bresw

buildVar str 
     | isSuffixOf "$" str = (TkStringVar str)
     | isSuffixOf "%" str = (TkIntVar str) 
     | otherwise          = (TkFloatVar str) 


buildResWord str = 
    let
      nmstr = map toLower str
    in
      buildResWord' nmstr
    where
     buildResWord' str
          | str == "print" = [TkPrint]
          | str == "input" = [TkInput]
          | str == "for"   = [TkFor]
          | str == "to"    = [TkTo]
          | str == "next"  = [TkNext]
          | str == "if"    = [TkIf]
          | str == "then"  = [TkThen]
          | otherwise      = [] 


                
buildString str del = TkString (takeWhile ((/=) del) $ tail $ dropWhile ((/=) del) str)
--buildString str del = TkString (tail $ dropWhile ((/=) del) str)

>>>>>>> redesign_alexHappy

}

