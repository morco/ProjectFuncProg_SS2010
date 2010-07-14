{

module Parser.Lexer.BasicAlexMonad(getTokens) where 

import Parser.ParserTypes(Token(..),TokenWrap(..),Constant(..))

import Data.List(isSuffixOf)
import Data.Char(toLower)

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
-- @string = \" [. # \"]* \"                            -- " 
-- @string = \" .* [. # \\]\"                            -- " 
--@string = [. # \"]*                             -- " 
@varOrRW_PostContext = ($white+ | \; | \) | \( | \= ) -- bin mir nicht mehr ganz sicher, warum ich dachte, dass 
                                                      -- ich den brauche, aber aktuell scheint es nicht noetig 
                                                      -- und er ist eher hinderlich als nuetzlich 
@intVar = @varOrResWord \%
@stringVar = @varOrResWord \$

tokens :-

---------------------------------- <Ignores> --------------------------------
--  <0> \x0A          {begin linenr}
--  <0> \n          {begin linenr}
  <normal> [$white # \n]+			     ;
  <0> [$white]+			     ;
  <0>  $digit+ $white* "REM".*		     ;  -- Commentary (whole line)
--  <> ^ $digit+ $white+ "REM".*	     ;  -- Commentary (line part)
  <normal> "REM".*	     ;  -- Commentary (line part)
  <0> "--".*                             ;  -- Unoff comments (for debugging)
  <normal> "--".*                             ;  -- Unoff comments (for debugging)
---------------------------------- </Ignores> -------------------------------


------------------------------ <Additional Stuff> ---------------------------
-- the line number, essential for gotos, "^" is a special pre context and 
-- stands for newline, have to stand before the Number expression to make 
-- sure, to be not mistaken
--  ^ $white* $digit+ 		            {\s -> TkLineNumber (read s)}
--  ^ $digit+ 			            {\s -> TkLineNumber (read s)}
--  <0> ^ $digit+  {\inp len -> wrapMonadic inp len (TkLineNumber . read) "LINENUMBER" }
  <normal> \n          {begin 0}
--  <> $white+			     ;
  <0> $digit+  {andBegin (\inp len -> wrapMonadic inp len (TkLineNumber . read) "LINENUMBER") normal }
------------------------------ </Additional Stuff> --------------------------




---------------- <Strings, Number, Vars and Reserved Words> -----------------
  <normal> $digit+                      {\inp len -> wrapMonadic inp len (TkConst . TkIntConst . read) "INT_CSTANT"}
--  ~$digit \. $digit+                                        {\s -> TkConst (TkFloatConst (read ("0"++s)))}
--  $digit+\.$digit+                                          {\s -> TkConst (TkFloatConst (read s))}
  
  <normal> @varOrResWord               {\inp len -> wrapMonadic inp len buildVarOrResWord "FLOAT_VAR or RESERVED_WORD" }

  <normal> @intVar            {\inp len -> wrapMonadic inp len TkIntVar "INT_VAR"}
  <normal> @stringVar         {\inp len -> wrapMonadic inp len TkStringVar "STRING_VAR"}
-- <0> @string                     {\inp len -> wrapMonadic inp len (flip buildString '"') "STRING_LITERAL"}
  --      \"             {\inp len -> wrapMonadic inp len (\_ -> andBegin TkStringStart string) "bli" }
    <normal>    \"             {andBegin (\inp len -> wrapMonadic inp len (\_ -> TkStringStart)  "bli") string}
--  <0>      \"             {\inp len -> wrapMonadic inp len (\_ -> andBegin TkStringStart string) "bli" }
--  <string> [^\"]          {\inp len -> wrapMonadic inp len TkStringChar "bli" } 
  <string> [^\\\"]          {\inp len -> wrapMonadic inp len TkStringChar "bli" } 
--  <string>  \\            {\inp len -> wrapMonadic inp len (\s -> andBegin (TkStringChar s) escaped) "bli" } 
  <string>  \\            {andBegin (\inp len -> wrapMonadic inp len TkStringChar "bli") escaped} 
--  <escaped>  .            {andBegin (\inp len -> wrapMonadic inp len TkStringChar "bli")  string}
  <escaped>  .            {andBegin (\inp len -> wrapMonadic inp len TkStringChar "bli")  string}
  <string> \"             {andBegin (\inp len -> wrapMonadic inp len (\s -> TkStringEnd ) "bli") normal}  
---------------- </Strings, Number, Vars and Reserved Words> ----------------


---------------------------------- <Combinators> ----------------------------
-- the section before "^" and after "/" means context (Streamcontent before and after matching expression)
--   seems necessary here because something like this is possible : "";Var;""
--  <normal> [.]^ \; /.*                   {\inp len -> wrapMonadic inp len (\s -> TkStringConcat) ""}
  <normal> \;                    {\inp len -> wrapMonadic inp len (\s -> TkStringConcat) "STRING_CONCAT ';'"}
  <normal> \,                            {\inp len -> wrapMonadic inp len (\s -> TkKomma) "KOMMA"}
  <normal> :          {\inp len -> wrapMonadic inp len (\s -> TkSingleLineCommandCombinator) "COMMAND_COMBINATOR ':'"}
---------------------------------- </Combinators> ---------------------------


------------------------------- <Compare Operators> -------------------------
--  [.]^ \= /.*                                        {\inp len -> wrapMonadic inp len (\s -> TkEqual)}
  <normal> \=               {\inp len -> wrapMonadic inp len (\s -> TkEqual) "="}
  <normal> \<\>             {\inp len -> wrapMonadic inp len (\s -> TkUnEqual) "<>"}
  <normal> \<               {\inp len -> wrapMonadic inp len (\s -> TkLt) "<"}
  <normal> \>               {\inp len -> wrapMonadic inp len (\s -> TkGt) ">"}
  <normal> \<\=             {\inp len -> wrapMonadic inp len (\s -> TkGE) "<="}
  <normal> \>\=             {\inp len -> wrapMonadic inp len (\s -> TkLE) ">="}
------------------------------- </Compare Operators> ------------------------

  <normal> \+            {\inp len -> wrapMonadic inp len (\s -> TkPlus) "+"}
  <normal> \-      {\inp len -> wrapMonadic inp len (\s -> TkMinus) "-"}
  <normal> \*      {\inp len -> wrapMonadic inp len (\s -> TkTimes) "*"}
  <normal> \/      {\inp len -> wrapMonadic inp len (\s -> TkDiv) "/"}
  <normal> \(        {\inp len -> wrapMonadic inp len (\s -> TkBracketOpen) "("}
  <normal> \)        {\inp len -> wrapMonadic inp len (\s -> TkBracketClose) ")"}


----------------------------------- <Aliases> -------------------------------
  <normal> \?          {\inp len -> wrapMonadic inp len (\s -> TkPrint) "PRINT"}
----------------------------------- </Aliases> ------------------------------



{


-- The idea for this function is simple, first check against all reserved 
--  words, if the input is one of them, if not successful, it should be a 
--   variable
-- ToDO:
--    -> Use Maybe or Either instead of list donkey chain (??)
buildVarOrResWord :: String -> Token
buildVarOrResWord str = 
      let
        bresw = buildResWord str
      in
        if bresw == []
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
buildString str del = 
    TkString (takeWhile ((/=) del) $ tail $ dropWhile ((/=) del) str)


-- In this version scanner returns a list of all read tokens
scanner :: String -> Either String [TokenWrap]
scanner str = runAlex str $ do
  let loop i = do tok' <- alexMonadScan;
                  tok <- filterToks tok'
                  --let tok = tok'
                  if tok == TkEOF -- || tok == "error."
                    then return i 
                    else do let i' = i ++ [tok] in i' `seq` loop i'
  loop []



alexEOF = return TkEOF


filterToks :: TokenWrap -> Alex TokenWrap
filterToks (TokenWrap typ pos TkStringStart) = do
     str <- buildStateString 
     return $ TokenWrap { _type = "STRING_LITERAL", pos = pos, _token = TkString $ str}
filterToks tok = return tok


buildStateString :: Alex String
buildStateString = do
    tok <- alexMonadScan;
    case _token tok of
                  TkStringChar x -> do
                        rest <- buildStateString
                        return (x ++ rest )
                  TkStringEnd    -> return []
                  _ -> error ("wrong token: " ++ (show $ _token tok))


uneither :: Either String b -> b 
uneither (Right x) = x
uneither (Left x) = error x




wrapMonadic :: AlexInput -> Int -> (String -> Token) -> String -> Alex TokenWrap
wrapMonadic (AlexPn _ lnNr col,_,inp) len f tp = 
    return $ TokenWrap { 
                _type  = tp, 
                pos   = (lnNr,col), 
                _token = f (take len inp)
             }



getTokens :: String -> [TokenWrap]
getTokens str = uneither $ scanner str

}

