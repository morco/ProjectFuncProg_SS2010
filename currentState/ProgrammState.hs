module ProgrammState where

------------------------------ <Imports> ------------------------------------
import Parser.ParserTypes( 
                           Var(..), 
                           Command(..), 
                           NumVar(..), 
                           DataContent(..), 
                           Program, 
                           ParseTree(..),
                           NumExpr
                         )
import qualified Data.Map as M
import Control.Monad.State

import Random(randoms, mkStdGen)

------------------------------ </Imports> -----------------------------------


----------------------------- <Data types> ----------------------------------

type PState a = StateT ProgramState IO a


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
       stringVars :: (M.Map Var String),
       intVars    :: (M.Map Var Int),
       floatVars  :: (M.Map Var Float),
       completeProgram :: Program,
       curPos :: Int,
       nextPos :: Int,
       backJumpAdressStack :: [Int],
       progFinished :: Bool,
       randomNumbers :: [Float],
       _data :: [DataContent],
       dataPointer :: Int,
       custom_funcs  :: (M.Map String (Var,NumExpr)),
       for_lines    :: [Int],
       fromNext     :: Bool
    } deriving Show



----------------------------- </Data types> ---------------------------------

-- TODO: make Seed variable

getNewState :: ParseTree -> ProgramState
getNewState parseTree = 
    ProgramState { 
       stringVars = M.empty, 
       intVars    = M.empty, 
       floatVars  = M.empty,
       completeProgram = program parseTree,
       curPos = 0,
       nextPos = 0,
       backJumpAdressStack = [],
       progFinished = False,
       randomNumbers = randoms (mkStdGen 1),
       _data = pdata parseTree,
       dataPointer = 0,
       custom_funcs = M.empty,
       for_lines = [],
       fromNext = False
    }



{-
getNextRandomNumber = do
    state <- get
    dropWhile ((==) 0) randomNumbers state
  where 
    nextNumberNotNull [] = error "random val list empty!"
    nextNumberNotNull (x:xs) = 
        if x /= 0 
          then x
          else nextNumberNotNull xs-}
   
         
-- This action is only used to set the nextPos pointer to the right 
--  start value at the beginning
initState :: PState ()
initState = do
    state <- get
    updateStateNextPos (completeProgram state)


-- Set the nextPos pointer to the next line number to execute by peeking 
--  in the head of the list. This relative seemingly unpractical approach 
--   is needed, cause commands like goto can change execution order
updateStateNextPos :: Program -> PState ()
updateStateNextPos [] = return ()
updateStateNextPos ((lnNrNext,_):_) = do
    state <- get
    put $ state { nextPos = lnNrNext}


getMapVal :: Maybe a -> a
getMapVal (Just x) = x
getMapVal _  = error "Var not found!"



updateFloatVar :: Var -> Float -> PState ()
updateFloatVar var val = do
    state <- get
    put $ state { floatVars = (M.alter (\ _ -> Just val) var $ floatVars state ) }

updateIntVar :: Var -> Int -> PState ()
updateIntVar var val = do
    state <- get
    put $ state { intVars = (M.alter (\ _ -> Just val) var $ intVars state ) }


updateStringVar :: Var -> String -> PState ()
updateStringVar var val = do
    state <- get
    put $ state { stringVars = (M.alter (\ _ -> Just val) var $ stringVars state ) }



getNextDataElement :: PState DataContent
getNextDataElement = do
    state <- get
    let dat = _data state
        ptr = dataPointer state
    if length dat > ptr
      then do
        put $ state { dataPointer = ptr + 1 }
        return (dat !! ptr)
      else error ("OUT OF DATA ERROR in line " ++ (show $ curPos state))



getDataString :: DataContent -> String
getDataString (DataString x) = x
getDataString (DataInt x) = show x
getDataString (DataFloat x) = show x


-- Frage, geht float auch nach int im sinne von abschneiden
--  der nachkommastellen implizit???
getDataInt :: DataContent -> Int
getDataInt (DataInt x) = x
getDataInt other = 
    error $ "TYPE MISMATCH ERROR: Unallowed data value '" 
            ++ (show other) ++ "', expected INT!"


getDataFloat :: DataContent -> Float
getDataFloat (DataFloat x) = x
getDataFloat (DataInt x) = fromIntegral x
getDataFloat other = 
    error $ "TYPE MISMATCH ERROR: Unallowed data value '" 
            ++ (show other) ++ "', expected NUMERICAL!"


insertValue :: Var -> PState a -> (a -> String) -> (a -> Int)
                -> (a -> Float) -> PState ()
insertValue var getValAct toStringFunc toIntFunc toFloatFunc = do
    val <- getValAct
    case var of
      -- if there is an unreadable input (no number), the runtime error
      --  should be thrown immediately, so strict evaluation here
         StringVar_Var _         -> (updateStringVar var) $! (toStringFunc val)
         NumVar_Var (IntVar _)   -> (updateIntVar var) $! (toIntFunc val)
         NumVar_Var (FloatVar _) -> (updateFloatVar var) $! (toFloatFunc val)
      

