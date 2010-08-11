
 
----------------------------- <Error definitions> -------------------------

redim_error :: String -> LineNumber -> a
redim_error comment nr = printError "?REDIM'D ARRAY ERROR" comment nr

illqua_error :: String -> LineNumber -> a
illqua_error comment nr = printError "?ILLEGAL QUANTIFY ERROR" comment nr


undefst_error :: String -> LineNumber -> a
undefst_error comment nr = printError "?UNDEF'D STATEMENT ERROR" comment nr

interprete_error :: String -> LineNumber -> a
interprete_error comment nr = printError "INTERPRETE ERROR" comment nr



printError :: String -> String -> LineNumber -> a
printError err comment nr =
    let msg_tail = if null comment
                     then " !"
                     else ": " ++ comment ++ " !"
    in error $ err ++ " in line " ++ show nr ++ msg_tail

----------------------------- </Error definitions> ------------------------
module Expressions 
(
  makeFloat,
  evalExpression,
  evalStringExpression,
  evalBoolExpression
)
where 







floatToIntConvert = floor







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




binaryFormatSize :: Int
binaryFormatSize = 16 -- c64 standard




combine2Lists :: [a] -> [b] -> (a -> b -> c) -> [c]
combine2Lists []     []     _ = []
combine2Lists (x:xs) (y:ys) f = (f x y) : combine2Lists xs ys f
combine2Lists _      _      _ = error "Combine2lists awaits lists of same length!"



type PState a     = StateT ProgramState IO a
type LineNumber   = Int
type VariableName = String
type Dimension    = [Int]
type Index        = [Int]
type BasicArray a = (Dimension,M.Map Index a)
type Bit          = Int
type Byte         = [Bit]



defaultArrayDim :: Int
defaultArrayDim = 11




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
       stringArrayVars     :: (M.Map VariableName BasicArray String),
       intVars             :: (M.Map VariableName Int),
       intArrayVars        :: (M.Map VariableName BasicArray Int),
       floatVars           :: (M.Map VariableName Float),
       floatArrayVars      :: (M.Map VariableName BasicArray Float),
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
       fromNext            :: Bool
    } deriving Show




