------------------------------------------------- <Imports> ------------------------------------------------------
module ProgrammState where

--import BasicHap( Var(..), Command(..), NumVar(..))
import Parser.ParserTypes( Var(..), Command(..), NumVar(..), DataContent(..), Program, ParseTree(..))
import qualified Data.Map as M
import Control.Monad.State

import Random(randoms, mkStdGen)

------------------------------------------------- </Imports> -----------------------------------------------------



------------------------------------------------ <Data types> ----------------------------------------------------

--type Program = [(Int, [Command])]
type PState a = StateT ProgramState IO a

-- XXX Starting
-- What are these awkward </ ... things? Makes things difficult to read and
-- I see no reason for them. Standard terminal/editor width is 78 chars.

-- This type is for recording the state of the programm, which means currently the values of the variables
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
       dataPointer :: Int
    } deriving Show



------------------------------------------------ </Data types> ---------------------------------------------------

-- TODO: make Seed variable

---------------------------------------------------- <Main> ------------------------------------------------------

--getNewState :: Program -> ProgramState
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
       dataPointer = 0
    }

-- running through the whole prog at start to find all datas, very inefficient, alternatives:
--  -> Parser builds this by parsing (complicates parser)
--  -> (search first for datas, when really needed)
{-buildDataList :: Program -> [DataContent]
buildDataList prog =
    let onlycoms = concat $ map snd prog
        onlyData = filter isData onlycoms
    in concat $ map getDataCont onlyData
        

isData :: Command -> Bool
isData (Data _) = True
isData _ = False

getDataCont :: Command -> [DataContent]
getDataCont (Data x) = x
getDataCont _ = error "Non Data Element!"-}

--------------------------------------------------- </Main> ------------------------------------------------------

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
   
         
-- This action is only used to set the nextPos pointer to the right start value at the beginning
initState :: PState ()
initState = do
    state <- get
    updateStateNextPos (completeProgram state)


-- Set the nextPos pointer to the next line number to execute by peeking in the head of the list.
--  This relative seemingly unpractical approach is needed, cause commands like goto can change execution order
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



