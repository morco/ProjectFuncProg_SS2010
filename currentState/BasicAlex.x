{

module BasicAlex( alexScanTokens, Token(..), Constant(..), Var(..)) where

import Data.List
import Data.Char

}

-- ToDO:
--   -> Make Strings in Strings and more than one String per Line work together
--   -> end delimiter strings directly over context (really useful?)

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters
@varOrResWord = $alpha [$alpha $digit ]* (\$ | \%)?  -- seems not possible to distinguish between reserved 
                                                     --  words and variables with regular expressions alone, 
                                                     --   so further processing is handled by myself 
 @string = \" [. # \"]* \"                            -- " 
--@string = [. # \"]*                             -- " 


tokens :-

---------------------------------------- <Ignores> --------------------------------------------------------
  $white+				                    ;
  [. # \n]^ "REM".*				            ;  -- Commentary (whole line)
  ^ $digit+ $white+ "REM".*				    ;  -- Commentary (line part)
---------------------------------------- </Ignores> -------------------------------------------------------


-------------------------------- <Additional Stuff> -------------------------------------------------------
-- the line number, essential for gotos, "^" is a special pre context and stands for newline, have to stand
--  before the Number expression to make sure, to be not mistaken
  ^ $digit+ 				                    {\s -> TkLineNumber (read s)}
-------------------------------- </Additional Stuff> ------------------------------------------------------


--------------------------<Strings, Number, Vars and Reserved Words> --------------------------------------
  $digit+                                                   {\s -> TkConst (TkIntConst (read s))}
  ~$digit \. $digit+                                        {\s -> TkConst (TkFloatConst (read ("0"++s)))}
--  $digit+\.$digit+                                          {\s -> TkConst (TkFloatConst (read s))}
  [$white \; :]^ @varOrResWord  / ($white+ | \; )           {\s -> buildVarOrResWord s }
  @string                                                   {\s -> buildString s '"'}
--  [\"]^ @string / \"                                                  {\s -> TkString s}
--------------------------</Strings, Number, Vars and Reserved Words> -------------------------------------


---------------------------------------- <Combinators> ----------------------------------------------------
-- the section before "^" and after "/" means context (Streamcontent before and after matching expression)
--   seems necessary here because something like this is possible : "";Var;""
  [.]^ \; /.*                                               {\s -> TkStringConcat }
  \,                                                        {\s -> TkStringConcatWithTab}
  :                                                         {\s -> TkSingleLineCommandCombinator}
---------------------------------------- </Combinators> ---------------------------------------------------


------------------------------------ <Compare Operators> --------------------------------------------------
  \=                                                        {\s -> TkEqual}
  \<\>                                                      {\s -> TkUnEqual}
  \<                                                        {\s -> TkLt}
  \>                                                        {\s -> TkGt}
  \<\=                                                      {\s -> TkGE}
  \>\=                                                      {\s -> TkLE}
------------------------------------ </Compare Operators> -------------------------------------------------

  \+                               {\s -> TkPlus}

----------------------------------------- <Aliases> -------------------------------------------------------
  \?                                                        {\s -> TkPrint }
----------------------------------------- </Aliases> ------------------------------------------------------



{

 
-- Each action has type :: String -> Token

------------------------------------ <Datatypes> ----------------------------------------------------------

-- The token type:
data Token 
     = TkLineNumber Int         

------ <Reserved words> ---------------

     | TkPrint                  
     | TkInput                  
     | TkFor                    
     | TkTo                     
     | TkNext                   
     | TkIf                     
     | TkThen                   
     | TkGoto              
     | TkStep     

------ </Reserved words> ---------------

------ <Combinators> ---------------

     | TkSingleLineCommandCombinator
     | TkStringConcatWithTab    
     | TkStringConcat           

------ </Combinators> ---------------

------ <Compare Operators> ---------------

     | TkEqual                       
     | TkLt                          
     | TkGt                          
     | TkUnEqual                      
     | TkGE                          
     | TkLE                          

------ </Compare Operators> ---------------

     | TkPlus

------ <Variables, Strings, Numbers> ---------------

     | TkString String          
     | TkConst Constant              
     | TkVar Var

------ </Variables, Strings, Numbers> --------------

   deriving (Eq,Show)


data Constant 
     = TkIntConst Int  
     | TkFloatConst Float
   deriving (Eq, Show)


data Var 
     = TkStringVar String 
     | TkIntVar String    
     | TkFloatVar String
   deriving (Eq, Show, Ord)


------------------------------------ </Datatypes> ---------------------------------------------------------

-- The idea for this function is simple, first check against all reserved words, if the input is one of them,
-- if not successful, it should be a variable
-- ToDO:
--    -> Use Maybe or Either instead of list donkey chain (??)
buildVarOrResWord :: String -> Token
buildVarOrResWord str = 
      let
        bresw = buildResWord str
      in
        if bresw == []
            then TkVar $ buildVar str
            else head bresw


buildVar :: String -> Var 
buildVar str 
     | isSuffixOf "$" str = (TkStringVar str)
     | isSuffixOf "%" str = (TkIntVar str) 
     | otherwise          = (TkFloatVar str) 


buildResWord :: String -> [Token] 
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
          | str == "goto"  = [TkGoto]
          | str == "step"  = [TkStep]
          | otherwise      = [] 

                
buildString :: String -> Char -> Token
buildString str del = TkString (takeWhile ((/=) del) $ tail $ dropWhile ((/=) del) str)


}

