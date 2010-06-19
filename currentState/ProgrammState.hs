------------------------------------------------- <Imports> ------------------------------------------------------
module ProgrammState where

--import BasicHap( Var(..), Command(..), NumVar(..))
import BasicHapMonad( Var(..), Command(..), NumVar(..))
import qualified Data.Map as M
import Control.Monad.State

import Random(randoms, mkStdGen)

------------------------------------------------- </Imports> -----------------------------------------------------



------------------------------------------------ <Data types> ----------------------------------------------------

type Program = [(Int, [Command])]
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
       nextPos :: Int,
       backJumpAdressStack :: [Int],
       progFinished :: Bool,
       randomNumbers :: [Float]
    } deriving Show



------------------------------------------------ </Data types> ---------------------------------------------------

-- TODO: make Seed variable

---------------------------------------------------- <Main> ------------------------------------------------------

getNewState :: Program -> ProgramState
getNewState parseTree = 
    ProgramState { 
       stringVars = M.empty, 
       intVars    = M.empty, 
       floatVars  = M.empty,
       completeProgram = parseTree,
       nextPos = 0,
       backJumpAdressStack = [],
       progFinished = False,
       randomNumbers = randoms (mkStdGen 1)
    }


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

{-
updateVar var val state =  
    let
       --val' = show val
       val' = val 
         {-case var of -- hier wuerd ich eigentlich gerne sowas sagen, wie wenn Val vom Typ String
           TkStringVar _ -> val
           _      -> show val-}
    in                  
      case var of
        StringVar_Var _ -> state {
                            stringVars = M.alter (\ _ -> Just val') var (stringVars state)
                          }
        NumVar_Var (IntVar _)    -> state {
                            intVars = M.alter (\ _ -> Just $ truncate (read val' :: Float)) var (intVars state)
                          }
        NumVar_Var (FloatVar _)  -> state {
                            floatVars = M.alter (\ _ -> Just $ read val') var (floatVars state)
                          }
-}

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



