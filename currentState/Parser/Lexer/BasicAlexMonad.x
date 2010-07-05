{

-- module Parser.Lexer.BasicAlexMonad(getTokens) where -- ka warum er das nicht frisst
module Parser.Lexer.BasicAlexMonad(getTokens) where -- ka warum er das nicht frisst
--module BasicAlexMonad(getTokens) where

import Parser.ParserTypes(Token(..),TokenWrap(..),Constant(..))

import Data.List
import Data.Char

import Debug.Trace

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
  ^ $digit+  {\inp len -> wrapMonadic inp len (TkLineNumber . read) "LINENUMBER" }
-------------------------------- </Additional Stuff> ------------------------------------------------------




--------------------------<Strings, Number, Vars and Reserved Words> --------------------------------------
  $digit+                      {\inp len -> wrapMonadic inp len (TkConst . TkIntConst . read) "INT_CSTANT"}
--  ~$digit \. $digit+                                        {\s -> TkConst (TkFloatConst (read ("0"++s)))}
--  $digit+\.$digit+                                          {\s -> TkConst (TkFloatConst (read s))}
  
  @varOrResWord               {\inp len -> wrapMonadic inp len buildVarOrResWord "FLOAT_VAR or RESERVED_WORD" }

  @intVar            {\inp len -> wrapMonadic inp len TkIntVar "INT_VAR"}
  @stringVar         {\inp len -> wrapMonadic inp len TkStringVar "STRING_VAR"}
  @string                     {\inp len -> wrapMonadic inp len (flip buildString '"') "STRING_LITERAL"}
--------------------------</Strings, Number, Vars and Reserved Words> -------------------------------------


---------------------------------------- <Combinators> ----------------------------------------------------
-- the section before "^" and after "/" means context (Streamcontent before and after matching expression)
--   seems necessary here because something like this is possible : "";Var;""
  [.]^ \; /.*                   {\inp len -> wrapMonadic inp len (\s -> TkStringConcat) ""}
  \;                    {\inp len -> wrapMonadic inp len (\s -> TkStringConcat) "STRING_CONCAT ';'"}
  \,                            {\inp len -> wrapMonadic inp len (\s -> TkKomma) "KOMMA"}
  :          {\inp len -> wrapMonadic inp len (\s -> TkSingleLineCommandCombinator) "COMMAND_COMBINATOR ':'"}
---------------------------------------- </Combinators> ---------------------------------------------------


------------------------------------ <Compare Operators> --------------------------------------------------
--  [.]^ \= /.*                                        {\inp len -> wrapMonadic inp len (\s -> TkEqual)}
  \=                                                 {\inp len -> wrapMonadic inp len (\s -> TkEqual) "="}
  \<\>                                               {\inp len -> wrapMonadic inp len (\s -> TkUnEqual) "<>"}
  \<                                                 {\inp len -> wrapMonadic inp len (\s -> TkLt) "<"}
  \>                                                 {\inp len -> wrapMonadic inp len (\s -> TkGt) ">"}
  \<\=                                               {\inp len -> wrapMonadic inp len (\s -> TkGE) "<="}
  \>\=                                               {\inp len -> wrapMonadic inp len (\s -> TkLE) ">="}
------------------------------------ </Compare Operators> -------------------------------------------------

  \+                               {\inp len -> wrapMonadic inp len (\s -> TkPlus) "+"}
  \-      {\inp len -> wrapMonadic inp len (\s -> TkMinus) "-"}
  \*      {\inp len -> wrapMonadic inp len (\s -> TkTimes) "*"}
  \/      {\inp len -> wrapMonadic inp len (\s -> TkDiv) "/"}
  \(                               {\inp len -> wrapMonadic inp len (\s -> TkBracketOpen) "("}
  \)                               {\inp len -> wrapMonadic inp len (\s -> TkBracketClose) ")"}


----------------------------------------- <Aliases> -------------------------------------------------------
  \?                                           {\inp len -> wrapMonadic inp len (\s -> TkPrint) "PRINT"}
----------------------------------------- </Aliases> ------------------------------------------------------



{

{- 

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
     | TkConst  Constant 
     | TkStringVar String 
     | TkIntVar    String 
     | TkFloatVar  String 

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

 --    | TkEOF
--     | TkWildCard -- needed only for error handling !

   deriving (Eq,Show)


data Constant 
     = TkIntConst Int  
     | TkFloatConst Float
   deriving (Eq, Show)


data TokenWrap 
    = TokenWrap { _type :: String, pos :: (Int,Int), _token :: Token }
    | TkEOF
    -- = TokenWrap { pos :: (Int,Int), token :: Token , _type :: String }
    -- = TokenWrap String (Int,Int) Token
    deriving (Show,Eq)


------------------------------------ </Datatypes> ---------------------------------------------------------

-}

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


buildVar :: String -> Token 
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
scanner :: String -> Either String [TokenWrap]
scanner str = runAlex str $ do
  let loop i = do tok <- alexMonadScan;
                  if tok == TkEOF -- || tok == "error."
                      then return i
                      else do let i' = i++[tok] in i' `seq` loop i'
  loop []

--alexEOF = return "stopped."
alexEOF = return TkEOF


--uneither :: Either a b -> a 
uneither :: Either String b -> b 
uneither (Right x) = x
uneither (Left x) = error x


getTokens :: String -> [TokenWrap]
getTokens str = uneither $ scanner str


wrapMonadic :: AlexInput -> Int -> (String -> Token) -> String -> Alex TokenWrap
wrapMonadic (AlexPn _ lnNr col,_,inp) len f tp = return $ TokenWrap { _type  = tp, 
                                                                     pos   = (lnNr,col), 
                                                                     _token = f (take len inp)}


{-
wrapMonadic :: AlexInput -> Int -> Token -> (Token -> String -> Token) -> Alex Token
wrapMonadic (AlexPn _ lnNr col,_,inp) len cons f = return $ f (cons { pos = (lnNr,col) }) inp
-}

{-
alexMonadScan = do
  inp <- alexGetInput
  sc <- alexGetStartCode
  case alexScan inp sc of
    AlexEOF -> alexEOF
    AlexError inp' -> alexError "mylexical error"
    AlexSkip  inp' len -> do
        alexSetInput inp'
        alexMonadScan
    AlexToken inp' len action -> do
        alexSetInput inp'
        action inp len
-}

}

