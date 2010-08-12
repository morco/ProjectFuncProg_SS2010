module Definitions where 

import qualified Data.Map as M
import Control.Monad.State
-- TODO: COpy Program here, and so also complete COmmand Tree???
import Parser.ParserTypes(Program,FloatVar,NumExpr,DataContent)

import System.Time(CalendarTime)
import IO(IOMode(..),Handle)
import Data.Char (toLower) 
--------------------------------- <Types> ---------------------------------

type PState a     = StateT ProgramState IO a
type LineNumber   = Int
type VariableName = String
type Dimension    = [Int]
type Index        = [Int]
type BasicArray a = (Dimension,M.Map Index a)
type Bit          = Int
type Byte         = [Bit]
type Operator     = String

--------------------------------- </Types> --------------------------------


------------------------------- <Constansts> ------------------------------

binaryFormatSize :: Int
binaryFormatSize = 16 -- c64 standard

defaultArrayDim :: Int
defaultArrayDim = 11 -- c64 standard


max_exp :: Float
max_exp = 88.0296919 -- c64 standard

file_id_range :: (Int,Int)
file_id_range = (0,127) -- c64 standard

defaultDeviceID :: Int
defaultDeviceID = devID_filesys -- c64 standard

devID_filesys :: Int
devID_filesys = 1

devID_monitor :: Int
devID_monitor = 3

devID_keyboard :: Int
devID_keyboard = 0


defaultSecondID = secID_read

secID_read :: Int
secID_read      = 0

secID_write :: Int
secID_write     = 1

secID_writeEOF :: Int
secID_writeEOF  = 2


getDevID :: Maybe Int -> LineNumber -> Int
getDevID Nothing   _      = defaultDeviceID
getDevID (Just id) ln_nr
    | id == devID_filesys  = devID_filesys
    | id == devID_monitor  = devID_monitor
    | id == devID_keyboard = devID_keyboard
    | otherwise            =
          let ermsg = "Unsupported DeviceID '" ++ show id ++ "'"
          in io_error ermsg ln_nr
    

io_sep = ','

default_type = head $ type_seq

type_seq     = ["s","seq"]
type_prg     = ["p","prq"]

getType type_str
    | elem type_str type_seq = head $ type_seq
    | elem type_str type_prg = head $ type_prg
    | otherwise              = error $ "Unsupported type: " ++ type_str


default_mode = basicToHaskellMode $ mode_read

mode_read   = "r"
mode_write  = "w"
mode_append = "a"

basicToHaskellMode str_mode
    | (map toLower str_mode) == mode_read   = ReadMode
    | (map toLower str_mode) == mode_write  = WriteMode
    | (map toLower str_mode) == mode_append = AppendMode
    | otherwise                             = error $ "Unsupported mode: " ++ str_mode


-- For this there are different possibilities (floor,ceiling,truncate).
--  To have not to think which to use every time again, it is defined here
--   generally
floatToIntConvert :: Float -> Int
floatToIntConvert = floor -- c64 standard

------------------------------- </Constansts> -----------------------------


----------------------------- <Error definitions> -------------------------

redim_error :: String -> LineNumber -> a
redim_error comment nr = printError "?REDIM'D ARRAY ERROR" comment nr

illqua_error :: String -> LineNumber -> a
illqua_error comment nr = printError "?ILLEGAL QUANTIFY ERROR" comment nr

overflw_error :: String -> LineNumber -> a
overflw_error comment nr = printError "?OVERFLOW ERROR" comment nr

undefst_error :: String -> LineNumber -> a
undefst_error comment nr = printError "?UNDEF'D STATEMENT ERROR" comment nr

undeffn_error :: String -> LineNumber -> a
undeffn_error comment nr = printError "?UNDEF`D FUNCTION ERROR" comment nr

badscrpt_error :: String -> LineNumber -> a
badscrpt_error comment nr = printError "?BAD SUPSCRIPT ERROR" comment nr

outdata_error :: String -> LineNumber -> a
outdata_error comment nr = printError "?OUT OF DATA ERROR" comment nr

type_error :: String -> LineNumber -> a
type_error comment nr = printError "?TYPE MISMATCH ERROR" comment nr

interprete_error :: String -> LineNumber -> a
interprete_error comment nr = printError "INTERPRETE ERROR" comment nr

eval_error :: String -> LineNumber -> a
eval_error comment nr = printError "EVALUATION ERROR" comment nr

io_error :: String -> LineNumber -> a
io_error comment nr = printError "IO ERROR" comment nr


printArrayIndex_error :: Index -> VariableName -> Dimension
                            -> LineNumber -> a
printArrayIndex_error idx var_name dim ln_nr =
    let ermsg1 = "Invalid array index '" ++ show idx ++ "' for array "
                 ++ "variable '" ++ var_name ++ "'" 
        neg    = filter ((>) 0) idx
    in if null neg
         then let ermsg2 = " with dimension '" ++ show dim ++ "'"
              in badscrpt_error (ermsg1 ++ ermsg2) ln_nr
         else let ermsg2 = " has negative elements"
              in illqua_error (ermsg1 ++ ermsg2) ln_nr


printError :: String -> String -> LineNumber -> a
printError err comment nr =
    let msg_tail = if null comment
                     then " !"
                     else ": " ++ "\n\t\t\t" ++ comment ++ " !"
    in error $ err ++ " in line " ++ show nr ++ msg_tail

----------------------------- </Error definitions> ------------------------


-- This type is for recording the state of the programm, which means 
--  currently the values of the variables, the whole program as list 
--   (needed for gotos), the current line position (needed for error 
--    messages), the expected next line position (needed for gotos),
--     a list of return adresses (for gosubs, adress = line number),
--      a flag to set the program finished (for asafe and clean finish 
--      caused by exit like commands), a list of random numbers for random
--       number functions, the data array and the pointer for this
data ProgramState =
    ProgramState {
       stringVars          :: (M.Map VariableName String),
       stringArrayVars     :: (M.Map VariableName (BasicArray String)),
       intVars             :: (M.Map VariableName Int),
       intArrayVars        :: (M.Map VariableName (BasicArray Int)),
       floatVars           :: (M.Map VariableName Float),
       floatArrayVars      :: (M.Map VariableName (BasicArray Float)),
       curPos              :: Int,
       nextPos             :: Int,
       progFinished        :: Bool,
       completeProgram     :: Program,
       backJumpAdressStack :: [LineNumber],
       randomNumbers       :: [Float],
       _data               :: [DataContent],
       dataPointer         :: Int,
       custom_funcs        :: (M.Map String (FloatVar,NumExpr)),
       for_lines           :: [LineNumber],
       fromNext            :: Bool,
       last_update_time    :: CalendarTime,
       file_handles        :: (M.Map Int Handle),
       basic_stdout        :: Handle,
       eof_reached         :: (M.Map String Bool)       
      -- basic_stdin         :: Handle
    } deriving Show


--data HandleWrapper
 --    = HandleWrapper Handle
  --   deriving (Eq,Ord)




{-

allSmaller :: (Ord a) => [a] -> [a] -> Bool
allSmaller []     []   = True
allSmaller (_:_) []   = error "lists have different size!"
allSmaller [] (_:_)   = error "lists have different size!"
allSmaller (x:xs) (y:ys)
    | x < y = allSmaller xs ys
    | otherwise = False

insertAtPos :: Int -> a -> [a] -> [a]
insertAtPos pos el  []   
    | pos == 0  = el : []
    | otherwise = error "position is bigger than list"
insertAtPos pos el (x:xs) 
    | pos == 0  = el : xs
    | pos > 0   = x : insertAtPos (pos - 1) el xs
    | otherwise = error "Insert pos lower than 0!"
-}



