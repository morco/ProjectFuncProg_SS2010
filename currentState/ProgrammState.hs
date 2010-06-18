----------------------------------------------------- <Imports> ------------------------------------------------------
module ProgrammState where

import BasicHap( Var(..), Command(..), NumVar(..))
import qualified Data.Map as M
import Control.Monad.State


----------------------------------------------------- </Imports> -----------------------------------------------------



---------------------------------------------------- <Data types> ----------------------------------------------------

-- This type is for recording the state of the programm, which means currently the values of the variables
data ProgramState =
      ProgramState {
         stringVars :: (M.Map Var String),
         intVars    :: (M.Map Var Int),
         floatVars  :: (M.Map Var Float),
         --completeProgram :: [(Int, [Command])],
         completeProgram :: Program,
         --currentLine :: Int,
         nextPos :: Int,
         backJumpAdressStack :: [Int]
      }


---------------------------------------------------- </Data types> ---------------------------------------------------

type Program = [(Int, [Command])]

-------------------------------------------------------- <Main> ------------------------------------------------------


getNewState :: Program -> ProgramState
getNewState parseTree = ProgramState { 
                                stringVars = M.empty, 
                                intVars    = M.empty, 
                                floatVars  = M.empty,
                                completeProgram = parseTree,
                                --currentLine = 0,
                                nextPos = 0,
                                backJumpAdressStack = []
                              }


------------------------------------------------------- </Main> ------------------------------------------------------

--updateStateNextPos [] state = state
--updateStateNextPos ((lnNrNext,_):_) state = state { nextPos = lnNrNext}


initState :: PState ()
initState = do
    state <- get
    updateStateNextPos (completeProgram state)

updateStateNextPos :: Program -> PState ()
updateStateNextPos [] = return ()
updateStateNextPos ((lnNrNext,_):_) = do
    state <- get
    put $ state { nextPos = lnNrNext}


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
--    return ()


updateIntVar :: Var -> Int -> PState ()
updateIntVar var val = do
    state <- get
    put $ state { intVars = (M.alter (\ _ -> Just val) var $ intVars state ) }
--    return ()


updateStringVar :: Var -> String -> PState ()
updateStringVar var val = do
    state <- get
    put $ state { stringVars = (M.alter (\ _ -> Just val) var $ stringVars state ) }
--    return ()


type PState a = StateT ProgramState IO a

{-
--testmain :: State ProgramState ()
testmain :: StateT ProgramState IO ()
testmain = do
         --nst <- getNewState [(20,[NOOP])]
         --getNewState [(20,[NOOP])]
        updateFloatVar (NumVar_Var (FloatVar "Bla")) 3.4 
	int <- f
        liftIO $ putStrLn "bla"
	-- ... 
	return ()

--f :: State ProgramState Int
f = do
	s <- get
	return (nextPos s)	-}


