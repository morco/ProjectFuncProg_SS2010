----------------------------------------------------- <Imports> ------------------------------------------------------
module ProgrammState where

import BasicHap( Var(..), Command(..), NumVar(..))
import qualified Data.Map as M
import Control.Monad.State


----------------------------------------------------- </Imports> -----------------------------------------------------



---------------------------------------------------- <Data types> ----------------------------------------------------

-- XXX Starting
-- What are these awkward </ ... things? Makes things difficult to read and
-- I see no reason for them. Standard terminal/editor width is 78 chars.

-- This type is for recording the state of the programm, which means currently the values of the variables
data ProgramState =
      ProgramState {
         stringVars :: (M.Map Var String),
         intVars    :: (M.Map Var Int),
         floatVars  :: (M.Map Var Float),
         completeProgram :: [(Int, [Command])],
         nextPos :: Int
      } deriving Show



-- Test state for experiments...
p0 = ProgramState M.empty M.empty M.empty [] 0


-- Example code 1:
-- return only the result, ignore the state
e1 = evalState ptest p0

-- Example code 2
-- return only the state, ignore the result
e2 = execState ptest p0

-- Example code 3
-- return both
e3 = runState ptest p0



ptest :: State ProgramState Int
ptest = do
    -- This is awfully, awfully, awfully documented! I have no idea where
    -- (and how) to find an example of how to use a Var. I'm just guessing
    -- around here.
    -- 
    -- Giving up with this after fiveteen minutes.
    -- updateFloatVar (FloatVar "foo") 2.22
   
    -- Update the program counter
    incrementPos

    -- Just returning a number so you can see the difference between the
    -- state and a function return value.
    return 1


-- Short example function, equivalent to updateFloatVar
incrementPos :: State ProgramState ()
incrementPos = do
    state <- get
    put state {nextPos = nextPos state + 1}

-- XXX Ending




---------------------------------------------------- </Data types> ---------------------------------------------------


-------------------------------------------------------- <Main> ------------------------------------------------------


getNewState :: [(Int, [Command])] -> State ProgramState ()
getNewState parseTree = put ProgramState { 
                                stringVars = M.empty, 
                                intVars    = M.empty, 
                                floatVars  = M.empty,
                                completeProgram = parseTree,
                                nextPos = 0
                              }


------------------------------------------------------- </Main> ------------------------------------------------------

updateStateNextPos [] state = state
updateStateNextPos ((lnNrNext,_):_) state = state { nextPos = lnNrNext}


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

updateFloatVar var val = do
    state <- get
    put state { floatVars = (M.alter (\ _ -> Just val) var $ floatVars state ) }

