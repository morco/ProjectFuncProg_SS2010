{

--module BasicAlex( alexScanTokens, Token(..), Constant(..)) where
module BasicAlexMonad where

import Data.List
import Data.Char

}

-- ToDO:
--   -> Make Strings in Strings and more than one String per Line work together
--   -> end delimiter strings directly over context (really useful?)

%wrapper "monad"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

$varOrRW_PreContext = [$white \; : \( \)]

@varOrResWord = $alpha [$alpha $digit ]*   -- seems not possible to distinguish between reserved 
                                                     --  words and variables with regular expressions alone, 
                                                     --   so further processing is handled by myself 
 @string = \" [. # \"]* \"                            -- " 
--@string = [. # \"]*                             -- " 
@varOrRW_PostContext = ($white+ | \; | \) | \( | \= ) -- bin mir nicht mehr ganz sicher, warum ich dachte, dass 
                                                      -- ich den brauche, aber aktuell scheint es nicht noetig 
                                                      -- und er ist eher hinderlich als nuetzlich 
@intVar = @varOrResWord \%
@stringVar = @varOrResWord \$

tokens :-

---------------------------------------- <Ignores> --------------------------------------------------------
  $white+				                    ;
  [. # \n]^ "REM".*				            ;  -- Commentary (whole line)
  ^ $digit+ $white+ "REM".*				    ;  -- Commentary (line part)
  "--".*                                                    ;  -- Unoff comments (for debugging)
---------------------------------------- </Ignores> -------------------------------------------------------


-------------------------------- <Additional Stuff> -------------------------------------------------------
-- the line number, essential for gotos, "^" is a special pre context and stands for newline, have to stand
--  before the Number expression to make sure, to be not mistaken
--  ^ $white* $digit+ 				                    {\s -> TkLineNumber (read s)}
--  ^ $digit+ 				                    {\s -> TkLineNumber (read s)}
  ^ $digit+ 				         {\inp len -> wrapMonadic inp len (TkLineNumber . read)}
-------------------------------- </Additional Stuff> ------------------------------------------------------




--------------------------<Strings, Number, Vars and Reserved Words> --------------------------------------
--  $digit+                                                   {\s -> TkConst (TkIntConst (read s))}
--  ~$digit \. $digit+                                        {\s -> TkConst (TkFloatConst (read ("0"++s)))}
--  $digit+\.$digit+                                          {\s -> TkConst (TkFloatConst (read s))}
  
  @varOrResWord               {\inp len -> wrapMonadic inp len buildVarOrResWord }

  @intVar            {\inp len -> wrapMonadic inp len TkIntVar }
  @stringVar         {\inp len -> wrapMonadic inp len TkStringVar }
  @string                                        {\inp len -> wrapMonadic inp len (flip buildString '"') }
--------------------------</Strings, Number, Vars and Reserved Words> -------------------------------------


---------------------------------------- <Combinators> ----------------------------------------------------
-- the section before "^" and after "/" means context (Streamcontent before and after matching expression)
--   seems necessary here because something like this is possible : "";Var;""
  [.]^ \; /.*                   {\inp len -> wrapMonadic inp len (\s -> TkStringConcat) }
  \,                            {\inp len -> wrapMonadic inp len (\s -> TkKomma)}
--  :                                                         {\s -> TkSingleLineCommandCombinator}
---------------------------------------- </Combinators> ---------------------------------------------------


------------------------------------ <Compare Operators> --------------------------------------------------
--  [.]^ \= /.*                                               {\s -> TkEqual}
--  \=                                                        {\s -> TkEqual}
--  \<\>                                                      {\s -> TkUnEqual}
--  \<                                                        {\s -> TkLt}
--  \>                                                        {\s -> TkGt}
--  \<\=                                                      {\s -> TkGE}
--  \>\=                                                      {\s -> TkLE}
------------------------------------ </Compare Operators> -------------------------------------------------

--  \+                               {\s -> TkPlus}
--  \-      {\s -> TkMinus }
--  \*      {\s -> TkTimes }
--  \/      {\s -> TkDiv }
--  \(                               {\s -> TkBracketOpen }
--  \)                               {\s -> TkBracketClose }


----------------------------------------- <Aliases> -------------------------------------------------------
--  \?                                                        {\s -> TkPrint }
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
     | TkLen

------ </Reserved words> ---------------

------ <Combinators> ---------------

     | TkSingleLineCommandCombinator
     -- | TkStringConcatWithTab    
     | TkKomma  
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
     | TkMinus
     | TkTimes
     | TkDiv

------ <Variables, Strings, Numbers> ---------------

     | TkString String          
     | TkConst Constant              
     | TkStringVar String
     | TkIntVar String
     | TkFloatVar String

------ </Variables, Strings, Numbers> --------------
     | TkBracketOpen
     | TkBracketClose

     | TkLogOr
     | TkLogAnd
     | TkLogNeg

     | TkReturn
     | TkGoSub
     
     | TkEnd
     
     | TkGet
     | TkRandom
     | TkIntFunc

     | TkError

   deriving (Eq,Show)


data Constant 
     = TkIntConst Int  
     | TkFloatConst Float
   deriving (Eq, Show)


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
            -- then TkVar $ buildVar str
            then buildVar str
            else head bresw


-- buildVar :: String -> Var 
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
          | str == "len"  = [TkLen]
          | str == "or"  = [TkLogOr]
          | str == "and"  = [TkLogAnd]
          | str == "return"  = [TkReturn]
          | str == "gosub"  = [TkGoSub]
          | str == "end"  = [TkEnd]
          | str == "get"  = [TkGet]
          | str == "rnd"  = [TkRandom]
          | str == "int"  = [TkIntFunc]
          | otherwise      = [] 

                
buildString :: String -> Char -> Token
buildString str del = TkString (takeWhile ((/=) del) $ tail $ dropWhile ((/=) del) str)


-- In this version scanner returns a list of all read tokens
scanner :: String -> Either String [Token]
scanner str = runAlex str $ do
  let loop i = do tok <- alexMonadScan;
                  if tok == TkError -- || tok == "error."
                      then return i
                      else do let i' = i++[tok] in i' `seq` loop i'
  loop []

--alexEOF = return "stopped."
alexEOF = return TkError


--uneither :: Either a b -> a 
uneither :: Either String b -> b 
uneither (Right x) = x
uneither (Left _) = error "lex error"


getTokens :: String -> [Token]
getTokens str = uneither $ scanner str

wrapMonadic :: AlexInput -> Int -> (String -> Token) -> Alex Token
wrapMonadic (_,_,inp) len f = return $ f (take len inp)


}

