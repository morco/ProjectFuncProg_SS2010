{-# OPTIONS -cpp #-}
{-# LINE 1 "BasicAlexMonad.x" #-}


module Parser.Lexer.BasicAlexMonad(getTokens) where 

import Parser.ParserTypes(Token(..),TokenWrap(..),Constant(..))

import Data.List(isSuffixOf,isPrefixOf)
import Data.Char(toLower,isAlpha,isAlphaNum)

import Debug.Trace


#if __GLASGOW_HASKELL__ >= 603
#include "ghcconfig.h"
#elif defined(__GLASGOW_HASKELL__)
#include "config.h"
#endif
#if __GLASGOW_HASKELL__ >= 503
import Data.Array
import Data.Char (ord)
import Data.Array.Base (unsafeAt)
#else
import Array
import Char (ord)
#endif
{-# LINE 1 "templates/wrappers.hs" #-}
{-# LINE 1 "templates/wrappers.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 1 "templates/wrappers.hs" #-}
-- -----------------------------------------------------------------------------
-- Alex wrapper code.
--
-- This code is in the PUBLIC DOMAIN; you may copy it freely and use
-- it for any purpose whatsoever.

{-# LINE 18 "templates/wrappers.hs" #-}

-- -----------------------------------------------------------------------------
-- The input type


type AlexInput = (AlexPosn,     -- current position,
                  Char,         -- previous char
                  String)       -- current input string

alexInputPrevChar :: AlexInput -> Char
alexInputPrevChar (p,c,s) = c

alexGetChar :: AlexInput -> Maybe (Char,AlexInput)
alexGetChar (p,c,[]) = Nothing
alexGetChar (p,_,(c:s))  = let p' = alexMove p c in p' `seq`
                                Just (c, (p', c, s))


{-# LINE 51 "templates/wrappers.hs" #-}

-- -----------------------------------------------------------------------------
-- Token positions

-- `Posn' records the location of a token in the input text.  It has three
-- fields: the address (number of chacaters preceding the token), line number
-- and column of a token within the file. `start_pos' gives the position of the
-- start of the file and `eof_pos' a standard encoding for the end of file.
-- `move_pos' calculates the new position after traversing a given character,
-- assuming the usual eight character tab stops.


data AlexPosn = AlexPn !Int !Int !Int
        deriving (Eq,Show)

alexStartPos :: AlexPosn
alexStartPos = AlexPn 0 1 1

alexMove :: AlexPosn -> Char -> AlexPosn
alexMove (AlexPn a l c) '\t' = AlexPn (a+1)  l     (((c+7) `div` 8)*8+1)
alexMove (AlexPn a l c) '\n' = AlexPn (a+1) (l+1)   1
alexMove (AlexPn a l c) _    = AlexPn (a+1)  l     (c+1)


-- -----------------------------------------------------------------------------
-- Default monad


data AlexState = AlexState {
        alex_pos :: !AlexPosn,  -- position at current input location
        alex_inp :: String,     -- the current input
        alex_chr :: !Char,      -- the character before the input
        alex_scd :: !Int        -- the current startcode



    }

-- Compile with -funbox-strict-fields for best results!

runAlex :: String -> Alex a -> Either String a
runAlex input (Alex f) 
   = case f (AlexState {alex_pos = alexStartPos,
                        alex_inp = input,       
                        alex_chr = '\n',



                        alex_scd = 0}) of Left msg -> Left msg
                                          Right ( _, a ) -> Right a

newtype Alex a = Alex { unAlex :: AlexState -> Either String (AlexState, a) }

instance Monad Alex where
  m >>= k  = Alex $ \s -> case unAlex m s of 
                                Left msg -> Left msg
                                Right (s',a) -> unAlex (k a) s'
  return a = Alex $ \s -> Right (s,a)

alexGetInput :: Alex AlexInput
alexGetInput
 = Alex $ \s@AlexState{alex_pos=pos,alex_chr=c,alex_inp=inp} -> 
        Right (s, (pos,c,inp))

alexSetInput :: AlexInput -> Alex ()
alexSetInput (pos,c,inp)
 = Alex $ \s -> case s{alex_pos=pos,alex_chr=c,alex_inp=inp} of
                  s@(AlexState{}) -> Right (s, ())

alexError :: String -> Alex a
alexError message = Alex $ \s -> Left message

alexGetStartCode :: Alex Int
alexGetStartCode = Alex $ \s@AlexState{alex_scd=sc} -> Right (s, sc)

alexSetStartCode :: Int -> Alex ()
alexSetStartCode sc = Alex $ \s -> Right (s{alex_scd=sc}, ())

alexMonadScan = do
  inp <- alexGetInput
  sc <- alexGetStartCode
  case alexScan inp sc of
    AlexEOF -> alexEOF
    AlexError inp' -> alexError "lexical error"
    AlexSkip  inp' len -> do
        alexSetInput inp'
        alexMonadScan
    AlexToken inp' len action -> do
        alexSetInput inp'
        action inp len

-- -----------------------------------------------------------------------------
-- Useful token actions

type AlexAction result = AlexInput -> Int -> result

-- just ignore this token and scan another one
-- skip :: AlexAction result
skip input len = alexMonadScan

-- ignore this token, but set the start code to a new value
-- begin :: Int -> AlexAction result
begin code input len = do alexSetStartCode code; alexMonadScan

-- perform an action for this token, and set the start code to a new value
-- andBegin :: AlexAction result -> Int -> AlexAction result
(action `andBegin` code) input len = do alexSetStartCode code; action input len

-- token :: (String -> Int -> token) -> AlexAction token
token t input len = return (t input len)



-- -----------------------------------------------------------------------------
-- Monad (with ByteString input)

{-# LINE 251 "templates/wrappers.hs" #-}


-- -----------------------------------------------------------------------------
-- Basic wrapper

{-# LINE 273 "templates/wrappers.hs" #-}


-- -----------------------------------------------------------------------------
-- Basic wrapper, ByteString version

{-# LINE 297 "templates/wrappers.hs" #-}

{-# LINE 322 "templates/wrappers.hs" #-}


-- -----------------------------------------------------------------------------
-- Posn wrapper

-- Adds text positions to the basic model.

{-# LINE 339 "templates/wrappers.hs" #-}


-- -----------------------------------------------------------------------------
-- Posn wrapper, ByteString version

{-# LINE 354 "templates/wrappers.hs" #-}


-- -----------------------------------------------------------------------------
-- GScan wrapper

-- For compatibility with previous versions of Alex, and because we can.

alex_base :: Array Int Int
alex_base = listArray (0,52) [-8,-4,18,22,1,6,-3,-2,132,137,-56,-47,155,-1,268,10,13,355,442,15,16,-34,24,25,-9,0,105,122,145,529,616,0,0,0,156,0,0,0,0,0,0,0,0,48,-22,0,0,0,0,0,0,0,0]

alex_table :: Array Int Int
alex_table = listArray (0,871) [0,5,5,5,5,5,-1,-1,-1,-1,4,19,4,4,4,5,5,5,5,5,-1,6,10,-1,5,-1,-1,4,25,4,4,4,-1,4,-1,-1,22,21,5,46,8,8,8,8,8,8,8,8,8,8,4,0,33,6,10,0,37,0,50,51,48,47,39,24,28,49,26,26,26,26,26,26,26,26,26,26,40,38,43,41,44,52,0,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,18,29,29,29,29,29,29,29,29,45,42,0,0,0,35,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,18,29,29,29,29,29,29,29,29,9,9,9,9,9,9,9,9,9,9,28,0,26,26,26,26,26,26,26,26,26,26,0,9,-1,-1,0,0,9,27,27,27,27,27,27,27,27,27,27,8,8,8,8,8,8,8,8,8,8,-1,16,15,27,27,27,27,27,27,27,27,27,27,14,14,14,14,14,14,14,14,14,14,0,11,0,0,0,0,11,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,11,0,-1,0,0,11,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,15,0,0,0,0,0,0,0,0,0,0,14,14,14,14,14,14,14,14,14,14,0,0,0,0,0,0,0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,0,0,0,0,0,0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,32,31,0,0,0,0,0,0,0,0,0,0,30,30,30,30,30,30,30,30,30,30,0,0,0,0,0,0,0,30,30,30,30,30,30,30,30,30,30,30,30,12,30,30,30,30,30,30,30,30,30,30,30,30,30,0,0,0,0,0,0,30,30,30,30,30,30,30,30,30,30,30,30,12,30,30,30,30,30,30,30,30,30,30,30,30,30,32,31,0,0,0,0,0,0,0,0,0,0,30,30,30,30,30,30,30,30,30,30,0,0,0,0,0,0,0,30,30,30,30,17,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,0,0,0,0,0,0,30,30,30,30,17,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,32,31,0,0,0,0,0,0,0,0,0,0,30,30,30,30,30,30,30,30,30,30,0,0,0,0,0,0,0,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,0,0,0,0,0,0,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,32,31,0,0,0,0,0,0,0,0,0,0,30,30,30,30,30,30,30,30,30,30,0,0,0,0,0,0,0,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,0,0,0,0,0,0,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

alex_check :: Array Int Int
alex_check = listArray (0,871) [-1,9,10,11,12,13,10,10,10,10,9,45,11,12,13,9,10,11,12,13,10,77,69,10,32,10,10,9,10,11,12,13,10,32,10,10,45,45,32,61,48,49,50,51,52,53,54,55,56,57,32,-1,34,109,101,-1,34,-1,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,-1,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,61,62,-1,-1,-1,92,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,9,10,11,12,13,9,10,11,12,13,46,-1,48,49,50,51,52,53,54,55,56,57,-1,32,10,10,-1,-1,32,48,49,50,51,52,53,54,55,56,57,48,49,50,51,52,53,54,55,56,57,34,36,37,48,49,50,51,52,53,54,55,56,57,48,49,50,51,52,53,54,55,56,57,-1,82,-1,-1,-1,-1,82,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,114,-1,92,-1,-1,114,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,10,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,36,37,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,48,49,50,51,52,53,54,55,56,57,-1,-1,-1,-1,-1,-1,-1,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,-1,-1,-1,-1,-1,-1,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,36,37,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,48,49,50,51,52,53,54,55,56,57,-1,-1,-1,-1,-1,-1,-1,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,-1,-1,-1,-1,-1,-1,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,36,37,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,48,49,50,51,52,53,54,55,56,57,-1,-1,-1,-1,-1,-1,-1,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,-1,-1,-1,-1,-1,-1,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,36,37,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,48,49,50,51,52,53,54,55,56,57,-1,-1,-1,-1,-1,-1,-1,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,-1,-1,-1,-1,-1,-1,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,36,37,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,48,49,50,51,52,53,54,55,56,57,-1,-1,-1,-1,-1,-1,-1,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,-1,-1,-1,-1,-1,-1,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]

alex_deflt :: Array Int Int
alex_deflt = listArray (0,52) [-1,36,-1,34,-1,-1,7,7,-1,-1,-1,-1,13,13,13,13,13,-1,-1,20,20,-1,23,23,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,34,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]

alex_accept = listArray (0::Int,52) [[],[],[],[(AlexAcc (alex_action_14))],[(AlexAccSkip)],[(AlexAccSkip)],[(AlexAccSkip)],[(AlexAccSkip)],[(AlexAcc (alex_action_7))],[],[],[],[(AlexAcc (alex_action_3))],[(AlexAcc (alex_action_3))],[(AlexAcc (alex_action_3))],[(AlexAcc (alex_action_3))],[(AlexAcc (alex_action_3))],[(AlexAcc (alex_action_10))],[(AlexAcc (alex_action_10))],[(AlexAccSkip)],[(AlexAccSkip)],[],[(AlexAccSkip)],[(AlexAccSkip)],[(AlexAcc (alex_action_28))],[(AlexAcc (alex_action_6))],[(AlexAcc (alex_action_8))],[(AlexAcc (alex_action_9))],[],[(AlexAcc (alex_action_10))],[(AlexAcc (alex_action_10))],[(AlexAcc (alex_action_11))],[(AlexAcc (alex_action_12))],[(AlexAcc (alex_action_13))],[(AlexAcc (alex_action_14))],[(AlexAcc (alex_action_15))],[(AlexAcc (alex_action_16))],[(AlexAcc (alex_action_17))],[(AlexAcc (alex_action_18))],[(AlexAcc (alex_action_19))],[(AlexAcc (alex_action_20))],[(AlexAcc (alex_action_21))],[(AlexAcc (alex_action_22))],[(AlexAcc (alex_action_23))],[(AlexAcc (alex_action_24))],[(AlexAcc (alex_action_25))],[(AlexAcc (alex_action_26))],[(AlexAcc (alex_action_27))],[(AlexAcc (alex_action_29))],[(AlexAcc (alex_action_30))],[(AlexAcc (alex_action_31))],[(AlexAcc (alex_action_32))],[(AlexAcc (alex_action_33))]]
{-# LINE 115 "BasicAlexMonad.x" #-}



-- The idea for this function is simple, first check against all reserved 
--  words, if the input is one of them, if not successful, it should be a 
--   variable
-- ToDO:
--    -> Use Maybe or Either instead of list donkey chain (??)
buildVarOrResWord :: String -> Token
buildVarOrResWord str = 
      let bresw = buildResWord str
      in if bresw == []
           then buildVar str
           else head bresw


buildVar :: String -> Token 
buildVar str 
     | isSuffixOf "$" str = (TkStringVar str)
     | isSuffixOf "%" str = (TkIntVar str) 
     | otherwise          = (TkFloatVar_Or_DataString str) 


buildResWord :: String -> [Token] 
buildResWord str = 
    let nmstr = map toLower str
    in buildResWord' nmstr
  where
        buildResWord' str
            | str == "print"    = [TkPrint]
            | str == "input"    = [TkInput]
            | str == "for"      = [TkFor]
            | str == "to"       = [TkTo]
            | str == "next"     = [TkNext]
            | str == "on"       = [TkOn]
            | str == "if"       = [TkIf]
            | str == "then"     = [TkThen]
            | str == "goto"     = [TkGoto]
            | str == "step"     = [TkStep]
            | str == "len"      = [TkLen]
            | str == "or"       = [TkLogOr]
            | str == "and"      = [TkLogAnd]
            | str == "not"      = [TkLogNeg]
            | str == "return"   = [TkReturn]
            | str == "gosub"    = [TkGoSub]
            | str == "end"      = [TkEnd]
            | str == "get"      = [TkGet]
            | str == "rnd"      = [TkRandom]
            | str == "int"      = [TkIntFunc]
            | str == "read"     = [TkRead]
            | str == "data"     = [TkData]
            | str == "restore"  = [TkRestore]
            | str == "abs"      = [TkAbsFunc]
            | str == "asc"      = [TkAscFunc]
            | str == "atn"      = [TkAtnFunc]
            | str == "chr$"     = [TkChrFunc] 
            | str == "cos"      = [TkCosFunc] 
            | str == "exp"      = [TkExpFunc] 
            | str == "log"      = [TkLogFunc] 
            | str == "val"      = [TkValFunc] 
            | str == "sgn"      = [TkSgnFunc] 
            | str == "sin"      = [TkSinFunc] 
            | str == "sqr"      = [TkSqrFunc] 
            | str == "tan"      = [TkTanFunc] 
            | str == "left$"    = [TkLeftFunc] 
            | str == "mid$"     = [TkMidFunc] 
            | str == "right$"   = [TkRightFunc] 
            | str == "str$"     = [TkStrFunc] 
            | str == "dim"      = [TkDim] 
            | str == "def"      = [TkDef]
            | isPrefixOf "fn" str = 
                  let len = length str
                  in if len == 3 || len == 4
                       then
                         if isAlpha (str !! 2)
                           then
                             if len == 3
                               then
                                 [TkFnxx str]
                               else
                                 let lc = str !! 3
                                 in if isAlphaNum lc
                                   then
                                     [TkFnxx str] 
                                   else
                                     error $ "No valid custom function name '" 
                                             ++ str ++ "' !"
                           else
                             error $ "No valid custom function name '" 
                                     ++ str ++ "' !"
                       else
                         error $ "No valid custom function name '" 
                                 ++ str ++ "' !"

            | otherwise         = [] 


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
                  TkString x -> do
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



escaped,normal,string :: Int
escaped = 1
normal = 2
string = 3
alex_action_3 = \inp len -> wrapMonadic inp len (\s -> TkComment) "COMMENT"
alex_action_6 = begin 0
alex_action_7 = andBegin (\inp len -> wrapMonadic inp len (TkLineNumber . read) "LINENUMBER") normal 
alex_action_8 = \inp len -> wrapMonadic inp len (TkConst . TkIntConst . read) "INT_CSTANT"
alex_action_9 = \inp len -> wrapMonadic inp len (TkConst . TkFloatConst . read . (++) "0") "Float_CSTANT"
alex_action_10 = \inp len -> wrapMonadic inp len buildVarOrResWord "FLOAT_VAR or RESERVED_WORD" 
alex_action_11 = \inp len -> wrapMonadic inp len TkIntVar "INT_VAR"
alex_action_12 = \inp len -> wrapMonadic inp len buildVarOrResWord "STRING_VAR or chr"
alex_action_13 = andBegin (\inp len -> wrapMonadic inp len (\_ -> TkStringStart)  "bli") string
alex_action_14 = \inp len -> wrapMonadic inp len TkString "bli" 
alex_action_15 = andBegin (\inp len -> wrapMonadic inp len TkString "bli") escaped
alex_action_16 = andBegin (\inp len -> wrapMonadic inp len TkString "bli")  string
alex_action_17 = andBegin (\inp len -> wrapMonadic inp len (\s -> TkStringEnd ) "bli") normal
alex_action_18 = \inp len -> wrapMonadic inp len (\s -> TkStringConcat) "STRING_CONCAT ';'"
alex_action_19 = \inp len -> wrapMonadic inp len (\s -> TkKomma) "KOMMA"
alex_action_20 = \inp len -> wrapMonadic inp len (\s -> TkSingleLineCommandCombinator) "COMMAND_COMBINATOR ':'"
alex_action_21 = \inp len -> wrapMonadic inp len (\s -> TkEqual) "="
alex_action_22 = \inp len -> wrapMonadic inp len (\s -> TkUnEqual) "<>"
alex_action_23 = \inp len -> wrapMonadic inp len (\s -> TkLt) "<"
alex_action_24 = \inp len -> wrapMonadic inp len (\s -> TkGt) ">"
alex_action_25 = \inp len -> wrapMonadic inp len (\s -> TkGE) "<="
alex_action_26 = \inp len -> wrapMonadic inp len (\s -> TkLE) ">="
alex_action_27 = \inp len -> wrapMonadic inp len (\s -> TkPlus) "+"
alex_action_28 = \inp len -> wrapMonadic inp len (\s -> TkMinus) "-"
alex_action_29 = \inp len -> wrapMonadic inp len (\s -> TkTimes) "*"
alex_action_30 = \inp len -> wrapMonadic inp len (\s -> TkDiv) "/"
alex_action_31 = \inp len -> wrapMonadic inp len (\s -> TkBracketOpen) "("
alex_action_32 = \inp len -> wrapMonadic inp len (\s -> TkBracketClose) ")"
alex_action_33 = \inp len -> wrapMonadic inp len (\s -> TkPrint) "PRINT"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- -----------------------------------------------------------------------------
-- ALEX TEMPLATE
--
-- This code is in the PUBLIC DOMAIN; you may copy it freely and use
-- it for any purpose whatsoever.

-- -----------------------------------------------------------------------------
-- INTERNALS and main scanner engine

{-# LINE 37 "templates/GenericTemplate.hs" #-}

{-# LINE 47 "templates/GenericTemplate.hs" #-}

{-# LINE 68 "templates/GenericTemplate.hs" #-}
alexIndexInt16OffAddr arr off = arr ! off


{-# LINE 89 "templates/GenericTemplate.hs" #-}
alexIndexInt32OffAddr arr off = arr ! off


{-# LINE 100 "templates/GenericTemplate.hs" #-}
quickIndex arr i = arr ! i


-- -----------------------------------------------------------------------------
-- Main lexing routines

data AlexReturn a
  = AlexEOF
  | AlexError  !AlexInput
  | AlexSkip   !AlexInput !Int
  | AlexToken  !AlexInput !Int a

-- alexScan :: AlexInput -> StartCode -> AlexReturn a
alexScan input (sc)
  = alexScanUser undefined input (sc)

alexScanUser user input (sc)
  = case alex_scan_tkn user input (0) input sc AlexNone of
	(AlexNone, input') ->
		case alexGetChar input of
			Nothing -> 



				   AlexEOF
			Just _ ->



				   AlexError input'

	(AlexLastSkip input'' len, _) ->



		AlexSkip input'' len

	(AlexLastAcc k input''' len, _) ->



		AlexToken input''' len k


-- Push the input through the DFA, remembering the most recent accepting
-- state it encountered.

alex_scan_tkn user orig_input len input s last_acc =
  input `seq` -- strict in the input
  let 
	new_acc = check_accs (alex_accept `quickIndex` (s))
  in
  new_acc `seq`
  case alexGetChar input of
     Nothing -> (new_acc, input)
     Just (c, new_input) -> 



	let
		(base) = alexIndexInt32OffAddr alex_base s
		((ord_c)) = ord c
		(offset) = (base + ord_c)
		(check)  = alexIndexInt16OffAddr alex_check offset
		
		(new_s) = if (offset >= (0)) && (check == ord_c)
			  then alexIndexInt16OffAddr alex_table offset
			  else alexIndexInt16OffAddr alex_deflt s
	in
	case new_s of 
	    (-1) -> (new_acc, input)
		-- on an error, we want to keep the input *before* the
		-- character that failed, not after.
    	    _ -> alex_scan_tkn user orig_input (len + (1)) 
			new_input new_s new_acc

  where
	check_accs [] = last_acc
	check_accs (AlexAcc a : _) = AlexLastAcc a input (len)
	check_accs (AlexAccSkip : _)  = AlexLastSkip  input (len)
	check_accs (AlexAccPred a predx : rest)
	   | predx user orig_input (len) input
	   = AlexLastAcc a input (len)
	check_accs (AlexAccSkipPred predx : rest)
	   | predx user orig_input (len) input
	   = AlexLastSkip input (len)
	check_accs (_ : rest) = check_accs rest

data AlexLastAcc a
  = AlexNone
  | AlexLastAcc a !AlexInput !Int
  | AlexLastSkip  !AlexInput !Int

data AlexAcc a user
  = AlexAcc a
  | AlexAccSkip
  | AlexAccPred a (AlexAccPred user)
  | AlexAccSkipPred (AlexAccPred user)

type AlexAccPred user = user -> AlexInput -> Int -> AlexInput -> Bool

-- -----------------------------------------------------------------------------
-- Predicates on a rule

alexAndPred p1 p2 user in1 len in2
  = p1 user in1 len in2 && p2 user in1 len in2

--alexPrevCharIsPred :: Char -> AlexAccPred _ 
alexPrevCharIs c _ input _ _ = c == alexInputPrevChar input

--alexPrevCharIsOneOfPred :: Array Char Bool -> AlexAccPred _ 
alexPrevCharIsOneOf arr _ input _ _ = arr ! alexInputPrevChar input

--alexRightContext :: Int -> AlexAccPred _
alexRightContext (sc) user _ _ input = 
     case alex_scan_tkn user input (0) input sc AlexNone of
	  (AlexNone, _) -> False
	  _ -> True
	-- TODO: there's no need to find the longest
	-- match when checking the right context, just
	-- the first match will do.

-- used by wrappers
iUnbox (i) = i
