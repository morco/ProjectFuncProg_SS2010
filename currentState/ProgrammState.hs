----------------------------------------------------- <Imports> ------------------------------------------------------
module ProgrammState where

import BasicHap( Var(..), Command(..), NumVar(..))
import qualified Data.Map as M


----------------------------------------------------- </Imports> -----------------------------------------------------



---------------------------------------------------- <Data types> ----------------------------------------------------

-- This type is for recording the state of the programm, which means currently the values of the variables
data State =
      State {
         stringVars :: (M.Map Var String),
         intVars    :: (M.Map Var Int),
         floatVars  :: (M.Map Var Float),
         completeProgramm :: [(Int, [Command])],
         nextPos :: Int
      }


---------------------------------------------------- </Data types> ---------------------------------------------------


-------------------------------------------------------- <Main> ------------------------------------------------------


getNewState parseTree = State { 
                                stringVars = M.empty, 
                                intVars    = M.empty, 
                                floatVars  = M.empty,
                                completeProgramm = parseTree,
                                nextPos = 0
                              }


------------------------------------------------------- </Main> ------------------------------------------------------

updateStateNextPos [] state = state
updateStateNextPos ((lnNrNext,_):_) state = state { nextPos = lnNrNext}


getMapVal (Just x) = x
getMapVal _  = error "Var not found!"


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


