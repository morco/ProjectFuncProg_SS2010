module ProgrammState where

------------------------------ <Imports> ------------------------------------
import Parser.ParserTypes( 
                           Var(..), 
                           Command(..), 
                           NumVar(..), 
                           DataContent(..), 
                           Program, 
                           ParseTree(..),
                           NumExpr,
                           FloatVar(..),
                           IntVar(..),
                           StringVar(..)
                         )
import qualified Data.Map as M
import Control.Monad.State

import Random(randoms, mkStdGen)

-- import Expressions(evalExpression) cylces aaaaaaaaahhhhhhhh!!!

import Debug.Trace

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
     --  custom_funcs  :: (M.Map String (Var,NumExpr)),
       custom_funcs  :: (M.Map String (FloatVar,NumExpr)),
       for_lines    :: [Int],
       fromNext     :: Bool,
       stringArrayVars :: (M.Map String ([Int],M.Map [Int] String)),
       intArrayVars    :: (M.Map String ([Int],M.Map [Int] Int)),
       floatArrayVars  :: (M.Map String ([Int],M.Map [Int] Float))
    } deriving Show



defaultArrayDim = 11

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
       fromNext = False,
       stringArrayVars = M.empty,
       intArrayVars    = M.empty,
       floatArrayVars  = M.empty
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



updateFloatArrayVar :: FloatVar -> [Int] -> Float -> PState ()
updateFloatArrayVar (FloatVar_Array name ix) index val = do
    state <- get
    let key    = name 
        flvars = floatArrayVars state
    case M.lookup key flvars of
         Just (dim,ar) -> -- Array exist, so change simply value
                          -- 1. Check for dimensions
                          if length index == length dim && allSmaller index dim
                            then do
                              let newar     = M.alter (\ _ -> Just val) index ar
                                  newflvars = M.alter (\ _ -> Just (dim,newar)) key flvars
                              put $ state { 
                                      floatArrayVars = newflvars 
                                    }
                            else
                              error "invalid array index!"
         Nothing     -> do -- array is new, init with default dimension
                        let nrdim = length index 
                            dim   = take nrdim $ repeat defaultArrayDim
                        if allSmaller index dim
                          then do
                              let newar     = M.alter (\ _ -> Just val) index M.empty
                                  newflvars = M.alter (\ _ -> Just (dim,newar)) key flvars
                              put $ state { 
                                      floatArrayVars = newflvars 
                                    }
                          else
                            error "invalid array index, you have to dimension your array first!"
updateFloatArrayVar _ _ _ = error "Not an array variable!"


updateIntArrayVar :: IntVar -> [Int] -> Int -> PState ()
updateIntArrayVar (IntVar_Array name ix) index val = do
    state <- get
    let key   = name
        ivars = intArrayVars state
    case M.lookup key ivars of
         Just (dim,ar) -> -- Array exist, so change simply value
                          -- 1. Check for dimensions
                          if length index == length dim && allSmaller index dim
                            then do
                              let newar    = M.alter (\ _ -> Just val) index ar
                                  newivars = M.alter (\ _ -> Just (dim,newar)) key ivars
                              put $ state { 
                                      intArrayVars = newivars 
                                    }
                            else
                              error "invalid array index!"
         Nothing     -> do -- array is new, init with default dimension
                        let nrdim = length index 
                            dim   = take nrdim $ repeat defaultArrayDim
                        if allSmaller index dim
                          then do
                              let newar    = M.alter (\ _ -> Just val) index M.empty
                                  newivars = M.alter (\ _ -> Just (dim,newar)) key ivars
                              put $ state { 
                                      intArrayVars = newivars 
                                    }
                          else
                            error "invalid array index, you have to dimension your array first!"
updateIntArrayVar _ _ _ = error "Not an array variable!"


updateStringArrayVar :: StringVar -> [Int] -> String -> PState ()
updateStringArrayVar (StringVar_Array name ix) index val = do
    state <- get
    let key     = name 
        strvars = stringArrayVars state
--    trace "updStringArrays!" $ case M.lookup key strvars of
    case M.lookup key strvars of
         Just (dim,ar) -> -- Array exist, so change simply value
                          -- 1. Check for dimensions
                          if length index == length dim && allSmaller index dim
                            then do
                              let newar      = M.alter (\ _ -> Just val) index ar
                                  newstrvars = M.alter (\ _ -> Just (dim,newar)) key strvars
                              put $ state { 
                                      --stringArrayVars = trace ("new string vars: " ++ show newstrvars) newstrvars
                                      stringArrayVars = newstrvars
                                    }
                            else
                              error "invalid array index!"
         Nothing     -> do -- array is new, init with default dimension
                        let nrdim = length index 
                            dim   = take nrdim $ repeat defaultArrayDim
                        if allSmaller index dim
                          then do
                              let newar     = M.alter (\ _ -> Just val) index M.empty
                                  newstrvars = M.alter (\ _ -> Just (dim,newar)) key strvars
                              put $ state { 
                                    --stringArrayVars = trace ("new string vars: " ++ show newstrvars) newstrvars 
                                      stringArrayVars = newstrvars 
                                    }
                          else
                            error "invalid array index, you have to dimension your array first!"
updateStringArrayVar _ _ _ = error "Not an array variable!"



allSmaller :: (Ord a) => [a] -> [a] -> Bool
allSmaller []     []   = True
allSmaller (x:xs) []   = error "lists have different size!"
allSmaller [] (y:ys)   = error "lists have different size!"
allSmaller (x:xs) (y:ys)
    | x < y = allSmaller xs ys
    | otherwise = False

insertAtPos :: Int -> a -> [a] -> [a]
insertAtPos pos elem  []   
    | pos == 0  = elem : []
    | otherwise = error "position is bigger than list"
insertAtPos pos elem (x:xs) 
    | pos == 0  = elem : xs
    | pos > 0   = x : insertAtPos (pos - 1) elem xs
    | otherwise = error "Insert pos lower than 0!"


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

{-
insertValue :: Var -> PState a -> (a -> String) -> (a -> Int)
                -> (a -> Float) -> PState ()
insertValue var getValAct toStringFunc toIntFunc toFloatFunc = do
    val <- getValAct
    case var of
      -- if there is an unreadable input (no number), the runtime error
      --  should be thrown immediately, so strict evaluation here
     --    StringVar_Var _             -> (updateStringVar var) $! (toStringFunc val)
     --    NumVar_Var (NumVar_Int _)   -> (updateIntVar var) $! (toIntFunc val)
     --    NumVar_Var (NumVar_Float _) -> (updateFloatVar var) $! (toFloatFunc val)
         StringVar_Var (StringVar _) -> (updateStringVar var) $! (toStringFunc val)
         NumVar_Var (NumVar_Int (IntVar _))   -> (updateIntVar var) $! (toIntFunc val)
         NumVar_Var (NumVar_Float (FloatVar _)) -> (updateFloatVar var) $! (toFloatFunc val)
      -- array case
         StringVar_Var (StringVar_Array _ ix)           -> do
                          res <- evalExpression ix
                          error $ "StringArray " ++ show res
                                            --(updateStringVar var) $! (toStringFunc val)
         NumVar_Var (NumVar_Int (IntVar_Array _ ix))   -> do 
                          res <- evalExpression ix
                          error $ "IntArray " ++ show res
                          -- (updateIntVar var) $! (toIntFunc val) 
         NumVar_Var (NumVar_Float (FloatVar_Array _ ix)) -> do 
                          res <- evalExpression ix
                          error $ "FloatArray " ++ show res
                          -- (updateFloatVar var) $! (toFloatFunc val) 
  -}


