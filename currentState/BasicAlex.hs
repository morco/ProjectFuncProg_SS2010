{-# OPTIONS -cpp #-}
{-# LINE 1 "BasicAlex.x" #-}

module BasicAlex where

import Data.List
import Data.Char


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

{-# LINE 35 "templates/wrappers.hs" #-}

{-# LINE 51 "templates/wrappers.hs" #-}

-- -----------------------------------------------------------------------------
-- Token positions

-- `Posn' records the location of a token in the input text.  It has three
-- fields: the address (number of chacaters preceding the token), line number
-- and column of a token within the file. `start_pos' gives the position of the
-- start of the file and `eof_pos' a standard encoding for the end of file.
-- `move_pos' calculates the new position after traversing a given character,
-- assuming the usual eight character tab stops.

{-# LINE 74 "templates/wrappers.hs" #-}

-- -----------------------------------------------------------------------------
-- Default monad

{-# LINE 162 "templates/wrappers.hs" #-}


-- -----------------------------------------------------------------------------
-- Monad (with ByteString input)

{-# LINE 251 "templates/wrappers.hs" #-}


-- -----------------------------------------------------------------------------
-- Basic wrapper


type AlexInput = (Char,String)

alexGetChar (_, [])   = Nothing
alexGetChar (_, c:cs) = Just (c, (c,cs))

alexInputPrevChar (c,_) = c

-- alexScanTokens :: String -> [token]
alexScanTokens str = go ('\n',str)
  where go inp@(_,str) =
          case alexScan inp 0 of
                AlexEOF -> []
                AlexError _ -> error "lexical error"
                AlexSkip  inp' len     -> go inp'
                AlexToken inp' len act -> act (take len str) : go inp'



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
alex_base = listArray (0,25) [-8,-3,105,1,2,218,305,392,3,4,6,506,-49,-56,0,12,13,0,516,603,18,20,22,0,0,0]

alex_table :: Array Int Int
alex_table = listArray (0,858) [0,1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,10,10,10,10,10,13,8,-1,-1,1,0,21,0,-1,1,-1,0,-1,0,0,0,24,0,10,0,11,11,11,11,11,11,11,11,11,11,25,14,20,0,20,23,20,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,6,18,18,18,18,18,18,18,18,0,0,0,0,0,12,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,0,0,0,0,0,0,0,0,0,0,5,5,5,5,5,5,5,5,5,5,0,0,0,0,0,0,0,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,0,0,0,0,0,0,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,0,0,0,0,0,0,0,0,0,0,5,5,5,5,5,5,5,5,5,5,0,0,0,0,0,0,0,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,0,0,0,0,0,0,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,17,17,0,0,0,0,0,0,0,0,0,0,19,19,19,19,19,19,19,19,19,19,0,0,0,0,0,0,0,19,19,19,19,7,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,0,0,0,0,0,0,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,17,17,0,0,0,0,0,0,0,0,0,0,19,19,19,19,19,19,19,19,19,19,0,0,0,0,0,0,0,19,19,19,19,19,19,19,19,19,19,19,19,2,19,19,19,19,19,19,19,19,19,19,19,19,19,0,0,0,0,0,0,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,10,10,10,10,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,17,17,11,11,11,11,11,11,11,11,11,11,19,19,19,19,19,19,19,19,19,19,0,0,0,0,0,0,0,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,0,0,0,0,0,0,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,17,17,0,0,0,0,0,0,0,0,0,0,19,19,19,19,19,19,19,19,19,19,0,0,0,0,0,0,0,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,0,0,0,0,0,0,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

alex_check :: Array Int Int
alex_check = listArray (0,858) [-1,9,10,11,12,13,9,10,11,12,13,10,10,10,10,9,10,11,12,13,69,77,10,10,32,-1,34,-1,10,32,10,-1,10,-1,-1,-1,44,-1,32,-1,48,49,50,51,52,53,54,55,56,57,58,59,34,-1,34,63,34,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,-1,-1,-1,-1,-1,82,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,10,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,36,37,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,48,49,50,51,52,53,54,55,56,57,-1,-1,-1,-1,-1,-1,-1,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,-1,-1,-1,-1,-1,-1,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,10,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,36,37,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,48,49,50,51,52,53,54,55,56,57,-1,-1,-1,-1,-1,-1,-1,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,-1,-1,-1,-1,-1,-1,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,36,37,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,48,49,50,51,52,53,54,55,56,57,-1,-1,-1,-1,-1,-1,-1,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,-1,-1,-1,-1,-1,-1,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,36,37,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,48,49,50,51,52,53,54,55,56,57,-1,-1,-1,-1,-1,-1,-1,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,-1,-1,-1,-1,-1,-1,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,9,10,11,12,13,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,32,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,36,37,48,49,50,51,52,53,54,55,56,57,48,49,50,51,52,53,54,55,56,57,-1,-1,-1,-1,-1,-1,-1,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,-1,-1,-1,-1,-1,-1,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,36,37,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,48,49,50,51,52,53,54,55,56,57,-1,-1,-1,-1,-1,-1,-1,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,-1,-1,-1,-1,-1,-1,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]

alex_deflt :: Array Int Int
alex_deflt = listArray (0,25) [-1,-1,3,3,3,3,-1,-1,9,9,-1,-1,-1,-1,-1,16,16,-1,-1,-1,22,22,22,-1,-1,-1]

alex_accept = listArray (0::Int,25) [[],[(AlexAccSkip)],[(AlexAccSkip)],[(AlexAccSkip)],[(AlexAccSkip)],[(AlexAccSkip)],[(AlexAcc (alex_action_5))],[(AlexAcc (alex_action_5))],[(AlexAccSkipPred  (alexPrevCharIs '\n'))],[(AlexAccSkipPred  (alexPrevCharIs '\n'))],[],[(AlexAccPred  (alex_action_3) (alexPrevCharIs '\n'))],[],[],[(AlexAccPred  (alex_action_4) (alexPrevCharIsOneOf (array ('\NUL','\255') [('\NUL',True),('\SOH',True),('\STX',True),('\ETX',True),('\EOT',True),('\ENQ',True),('\ACK',True),('\a',True),('\b',True),('\t',True),('\n',False),('\v',True),('\f',True),('\r',True),('\SO',True),('\SI',True),('\DLE',True),('\DC1',True),('\DC2',True),('\DC3',True),('\DC4',True),('\NAK',True),('\SYN',True),('\ETB',True),('\CAN',True),('\EM',True),('\SUB',True),('\ESC',True),('\FS',True),('\GS',True),('\RS',True),('\US',True),(' ',True),('!',True),('"',True),('#',True),('$',True),('%',True),('&',True),('\'',True),('(',True),(')',True),('*',True),('+',True),(',',True),('-',True),('.',True),('/',True),('0',True),('1',True),('2',True),('3',True),('4',True),('5',True),('6',True),('7',True),('8',True),('9',True),(':',True),(';',True),('<',True),('=',True),('>',True),('?',True),('@',True),('A',True),('B',True),('C',True),('D',True),('E',True),('F',True),('G',True),('H',True),('I',True),('J',True),('K',True),('L',True),('M',True),('N',True),('O',True),('P',True),('Q',True),('R',True),('S',True),('T',True),('U',True),('V',True),('W',True),('X',True),('Y',True),('Z',True),('[',True),('\\',True),(']',True),('^',True),('_',True),('`',True),('a',True),('b',True),('c',True),('d',True),('e',True),('f',True),('g',True),('h',True),('i',True),('j',True),('k',True),('l',True),('m',True),('n',True),('o',True),('p',True),('q',True),('r',True),('s',True),('t',True),('u',True),('v',True),('w',True),('x',True),('y',True),('z',True),('{',True),('|',True),('}',True),('~',True),('\DEL',True),('\128',True),('\129',True),('\130',True),('\131',True),('\132',True),('\133',True),('\134',True),('\135',True),('\136',True),('\137',True),('\138',True),('\139',True),('\140',True),('\141',True),('\142',True),('\143',True),('\144',True),('\145',True),('\146',True),('\147',True),('\148',True),('\149',True),('\150',True),('\151',True),('\152',True),('\153',True),('\154',True),('\155',True),('\156',True),('\157',True),('\158',True),('\159',True),('\160',True),('\161',True),('\162',True),('\163',True),('\164',True),('\165',True),('\166',True),('\167',True),('\168',True),('\169',True),('\170',True),('\171',True),('\172',True),('\173',True),('\174',True),('\175',True),('\176',True),('\177',True),('\178',True),('\179',True),('\180',True),('\181',True),('\182',True),('\183',True),('\184',True),('\185',True),('\186',True),('\187',True),('\188',True),('\189',True),('\190',True),('\191',True),('\192',True),('\193',True),('\194',True),('\195',True),('\196',True),('\197',True),('\198',True),('\199',True),('\200',True),('\201',True),('\202',True),('\203',True),('\204',True),('\205',True),('\206',True),('\207',True),('\208',True),('\209',True),('\210',True),('\211',True),('\212',True),('\213',True),('\214',True),('\215',True),('\216',True),('\217',True),('\218',True),('\219',True),('\220',True),('\221',True),('\222',True),('\223',True),('\224',True),('\225',True),('\226',True),('\227',True),('\228',True),('\229',True),('\230',True),('\231',True),('\232',True),('\233',True),('\234',True),('\235',True),('\236',True),('\237',True),('\238',True),('\239',True),('\240',True),('\241',True),('\242',True),('\243',True),('\244',True),('\245',True),('\246',True),('\247',True),('\248',True),('\249',True),('\250',True),('\251',True),('\252',True),('\253',True),('\254',True),('\255',True)]) `alexAndPred` alexRightContext 15))],[(AlexAccSkip)],[(AlexAccSkip)],[(AlexAcc (alex_action_5))],[(AlexAcc (alex_action_5))],[(AlexAcc (alex_action_5))],[(AlexAcc (alex_action_6))],[],[],[(AlexAcc (alex_action_7))],[(AlexAcc (alex_action_8))],[(AlexAcc (alex_action_9))]]
{-# LINE 36 "BasicAlex.x" #-}


 
-- Each action has type :: String -> Token

-- The token type:
data Token =
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
	TkVar Var
     deriving (Eq,Show)


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



alex_action_3 = \s -> TkLineNumber (read s)
alex_action_4 = \s -> TkStringConcat 
alex_action_5 = \s -> buildVarOrResWord s 
alex_action_6 = \s -> buildString s '"'
alex_action_7 = \s -> TkPrint 
alex_action_8 = \s -> TkStringConcatWithTab
alex_action_9 = \s -> TkSingleLineCommandCombinator
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
