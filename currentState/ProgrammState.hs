module ProgrammState where

------------------------------ <Imports> -----------------------------------

import Random(randoms, mkStdGen)
import qualified Data.Map as M (lookup,alter,empty)
import Control.Monad.State
import System.Time(
                   getClockTime,
                   toCalendarTime,
                   CalendarTime(..),
                   Month(May),
                   Day(Sunday)
                  )
import IO(Handle,stdout)

import Parser.ParserTypes( 
                           Var(..), 
                           DataContent(..), 
                           Program, 
                           ParseTree(..),
                           NumExpr,
                           FloatVar(..),
                           IntVar(..),
                           StringVar(..),
                           NumVar(..),
                           Operand(..)
                         )

import Definitions
import Expressions(evalExpression,makeFloat)
import BasicTime

------------------------------ </Imports> ----------------------------------


-------------------------------- <Little Helpers> --------------------------

allSmaller :: (Num a,Ord a) => [a] -> [a] -> Bool
allSmaller []     []  = True
allSmaller (_:_) []   = error "lists have different size!"
allSmaller [] (_:_)   = error "lists have different size!"
allSmaller (x:xs) (y:ys)
    | x < y && x >= 0 = allSmaller xs ys
    | otherwise = False

insertAtPos :: Int -> a -> [a] -> [a]
insertAtPos pos el  []   
    | pos == 0  = el : []
    | otherwise = error "position is bigger than list"
insertAtPos pos el (x:xs) 
    | pos == 0  = el : xs
    | pos > 0   = x : insertAtPos (pos - 1) el xs
    | otherwise = error "Insert pos lower than 0!"

-------------------------------- </Little Helpers> -------------------------


---------------------------- <Init functions> ------------------------------

getNewState :: ParseTree -> ProgramState
getNewState parseTree = 
    ProgramState { 
       stringVars          = M.empty, 
       stringArrayVars     = M.empty,
       intVars             = M.empty, 
       intArrayVars        = M.empty,
       floatVars           = M.empty,
       floatArrayVars      = M.empty,
       curPos              = 0,
       nextPos             = 0,
       progFinished        = False,
       completeProgram     = program parseTree,
       backJumpAdressStack = [],
       randomNumbers       = [],
       _data               = pdata parseTree,
       dataPointer         = 0,
       custom_funcs        = M.empty,
       for_lines           = [],
       fromNext            = False,
       last_update_time    = dummyTime,
       file_handles        = M.empty,
       basic_stdout        = stdout,
       eof_reached         = M.empty
    }
  where
        dummyTime = CalendarTime {
                       ctYear    = 0,      -- not used
                       ctMonth   = May,    -- not used
                       ctDay     = 0,      -- not used
                       ctHour    = 0,
                       ctMin     = 0,
                       ctSec     = 0,
                       ctPicosec = 0,      -- not used
                       ctWDay    = Sunday, -- not used
                       ctYDay    = 0,      -- not used
                       ctTZName  = "not used",
                       ctTZ      = 0,      -- not used
                       ctIsDST   = False   -- not used
                    }

   
         
-- This action is used to set the nextPos pointer to the right 
--  start value at the beginning, set a default random number sequence
--   and setting the time register to the current local time
initState :: PState ()
initState = do
    state <- get
    updateStateNextPos $ completeProgram state
    -- set the time
    now     <- liftIO $ getClockTime
    now_cal <- liftIO $ toCalendarTime now
    updateStringVar TimeStr_Reg $ calendarTimeToTimeString now_cal
    -- create the random numbers depending on current time
    curtime <- makeFloat $ TI_Reg
    createNewRandomSequence $ floatToIntConvert $ curtime 
    -- init ST (should not be necessary with auto init)
    updateFloatVar (FloatVar showST_Reg) 0

---------------------------- </Init functions> -----------------------------

-- Set the nextPos pointer to the next line number to execute by peeking 
--  in the head of the list. This relative seemingly unpractical approach 
--   is needed, cause commands like goto can change execution order
updateStateNextPos :: Program -> PState ()
updateStateNextPos [] = return ()
updateStateNextPos ((lnNrNext,_):_) = do
    state <- get
    put $ state { nextPos = lnNrNext}

createNewRandomSequence :: Int -> PState ()
createNewRandomSequence seed = do
    state <- get
    put $ state { randomNumbers = randoms $ mkStdGen seed }


insertFileHandle :: Int -> Handle -> PState ()
insertFileHandle key handle = do
    state <- get
    let ins_func     = \ _ -> Just handle
        new_fhandles = M.alter ins_func key $ file_handles state
    put $ state { file_handles = new_fhandles }

--------------------- <Update and Insertion of variables> ------------------

-- The following action computes the given index expression to 
--  concrete values, so we can use it
getIndex :: [NumExpr] -> PState Index
getIndex idx_exp = do
    res <- mapM evalExpression idx_exp
    return $ map floatToIntConvert res 


-- Handles the dimensioning of arrays, see also comment on updateVar below
dimArray :: (Var,[Operand]) -> PState ()
dimArray (var,dim'') = do
    state <- get
    dim'  <- mapM makeFloat dim''
    -- +1 because in c64 basic dimension gives the highest index, but 
    --     start indexing by zero either!
    let dim      = map (((+) 1) . floatToIntConvert) dim'
        ins_func = \ _ -> Just (dim,M.empty)
        ln_nr    = curPos state
        test_dim = filter ((<=) 1) dim
    if dim == test_dim
      then
        case var of 
             StringVar_Var (StringVar name )            -> 
                  -- Check if array was dimensioned already
                  case M.lookup name $ stringArrayVars state of
                       Just _  -> redim_error [] ln_nr
                       Nothing -> do
                          let map    = stringArrayVars state
                              newars = M.alter ins_func name map
                          put $ state { stringArrayVars = newars }
             NumVar_Var (NumVar_Int (IntVar name ))     -> 
                  -- Check if array was dimensioned already
                  case M.lookup name $ intArrayVars state of
                       Just _  -> redim_error [] ln_nr
                       Nothing -> do
                          let map    = intArrayVars state
                              newars = M.alter ins_func name map
                          put $ state { intArrayVars = newars }
             NumVar_Var (NumVar_Float (FloatVar name )) -> 
                  -- Check if array was dimensioned already
                  case M.lookup name $ floatArrayVars state of
                       Just _  -> redim_error [] ln_nr
                       Nothing -> do
                          let map    = floatArrayVars state
                              newars = M.alter ins_func name map
                          put $ state { floatArrayVars = newars }
             other -> do
                 let ermsg = "Dimensioning of non array"
                             ++ " variable '" ++ show other 
                             ++ "' tried" 
                 interprete_error ermsg ln_nr
      else do
        let ermsg = "Tried Dimensioning '" ++ show dim 
                    ++ "' contains 0 or negative value" 
        illqua_error ermsg ln_nr    


-- The 3 following actions handle the update of a variable, which means in
--  general setting the right map entry to the given value. Even the 
--   pattern is for all types of variables nearly the same, we have to use
--    3 actions here because of the different types of values.
--  A bit more complicated is it for array variables. These are 
--   implemented as a map of a map. First the name of the variable is 
--    mapped on a pair, which contains the dimension of the array and the
--     array itself, realised as a map from an index to the value. There
--      are maybe ways more ellegant, but one big problem solved this way 
--       is you can have arrays of different dimensions in one map 
--        collected.
updateFloatVar :: FloatVar -> Float -> PState ()
updateFloatVar (FloatVar name) val = do
    state <- get
    let key      = name
        upd_func = \ _ -> Just val
    put $ state { floatVars = M.alter upd_func key $ floatVars state }
updateFloatVar (FloatVar_Array name idx_exp) val = do
    state <- get
    index <- getIndex idx_exp 
    let key      = name 
        flvars   = floatArrayVars state
        (dim,ar) = case M.lookup key flvars of
                        Just (dim',ar') -> (dim',ar')
                        Nothing         -> 
                            -- array is new, init with default dimension
                            let nrdim = length index 
                                dim'  = take nrdim $ repeat defaultArrayDim
                            in (dim',M.empty)
    -- Check if the given index is a valid one 
    --  (correct number of dimensions and all indizes 
    --   smaller than dimensions size)
    if length index == length dim && allSmaller index dim
      then do
        let newar     = M.alter (\ _ -> Just val) index ar
            newflvars = M.alter (\ _ -> Just (dim,newar)) key flvars
        put $ state { floatArrayVars = newflvars }
      else 
        let ln_nr = curPos state
        in printArrayIndex_error index name dim ln_nr 

updateIntVar :: IntVar -> Int -> PState ()
updateIntVar (IntVar name) val = do
    state <- get
    let key      = name
        upd_func = \ _ -> Just val
    put $ state { intVars = M.alter upd_func key $ intVars state }
updateIntVar (IntVar_Array name idx_exp) val = do
    state <- get
    index <- getIndex idx_exp 
    let key      = name 
        ivars    = intArrayVars state
        (dim,ar) = case M.lookup key ivars of
                        Just (dim',ar') -> (dim',ar')
                        Nothing         -> 
                            -- array is new, init with default dimension
                            let nrdim = length index 
                                dim'  = take nrdim $ repeat defaultArrayDim
                            in (dim',M.empty)
    if length index == length dim && allSmaller index dim
      then do
        let newar    = M.alter (\ _ -> Just val) index ar
            newivars = M.alter (\ _ -> Just (dim,newar)) key ivars
        put $ state { intArrayVars = newivars }
      else 
        let ln_nr = curPos state
        in printArrayIndex_error index name dim ln_nr 

updateStringVar :: StringVar -> String -> PState ()
updateStringVar TimeStr_Reg val = do
    state <- get
    if isValidTimeString val 
      then do
        -- get the current real time
        now     <- liftIO $ getClockTime
        now_cal <- liftIO $ toCalendarTime now
        -- standard insert
        let key      = showTimeStrReg
            upd_func = \ _ -> Just val
        put $ state { 
                stringVars = M.alter upd_func key $ stringVars state,
                last_update_time = now_cal 
              }
      else do
        let ermsg = "Invalid time string format '" ++ val 
                    ++ "', correct format is [hhmmss]"
        illqua_error ermsg $ curPos state

updateStringVar (StringVar name) val = do
    state <- get
    let key      = name
        upd_func = \ _ -> Just val
    put $ state { stringVars = M.alter upd_func key $ stringVars state }
updateStringVar (StringVar_Array name idx_exp) val = do
    state <- get
    index <- getIndex idx_exp 
    let key      = name 
        strvars  = stringArrayVars state
        (dim,ar) = case M.lookup key strvars of
                        Just (dim',ar') -> (dim',ar')
                        Nothing         -> 
                            -- array is new, init with default dimension
                            let nrdim = length index 
                                dim'  = take nrdim $ repeat defaultArrayDim
                            in (dim',M.empty)
    if length index == length dim && allSmaller index dim
      then do
        let newar     = M.alter (\ _ -> Just val) index ar
            newstrvars = M.alter (\ _ -> Just (dim,newar)) key strvars
        put $ state { stringArrayVars = newstrvars }
      else 
        let ln_nr = curPos state
        in printArrayIndex_error index name dim ln_nr 


-- This action generalize the insertion of a variable pattern 
--  (there is made no difference between first time and update)
--   Because variables have different types (Strings, Ints, Floats) we need
--    some arguments here ;D. Of course the variable than a monadic action 
--     which determines how to get the value, and at least 3 functions who
--      say, how to convert the value get by the monadic action into an 
--       String, Int and Float value.
--        If you want some conversions to be impossible you have to make an
--         error function as conversions function
insertValue :: Var -> PState a -> (a -> String) -> (a -> Int)
                -> (a -> Float) -> PState ()
insertValue var getValAct toStringFunc toIntFunc toFloatFunc = do
      val <- getValAct
      case var of
      -- if there is an unreadable input (no number), the runtime error
      --  should be thrown immediately, so strict evaluation here
         StringVar_Var strVar             -> do
                   (updateStringVar strVar) $! (toStringFunc val)
         NumVar_Var (NumVar_Int intVar)   -> do
                   (updateIntVar intVar)    $! (toIntFunc val)
         NumVar_Var (NumVar_Float fltVar) -> do
                   (updateFloatVar fltVar)  $! (toFloatFunc val)

--------------------- </Update and Insertion of variables> -----------------


--------------------------- <Lookup of variables> --------------------------

getFloatVarValue :: FloatVar -> PState Float
getFloatVarValue (FloatVar name) 
    | name == showST_Reg = do
         state <- get
         let st_reg = case M.lookup showST_Reg $ floatVars state of
                           Just x  -> x
                           Nothing -> 0 -- ???
         -- reset state register by every lookup, good idea??
         updateFloatVar (FloatVar showST_Reg) 0 
         return st_reg
    | otherwise          = do
         state <- get
         case M.lookup name $ floatVars state of
              Just x  -> return x
              Nothing -> return 0

getFloatVarValue (FloatVar_Array name idx_expr) = do
    state <- get
    ind   <- getIndex idx_expr
    let key       = name
    (dim,ar) <- case M.lookup key $ floatArrayVars state of
                     Just x  -> return x
                     Nothing -> do -- array is new, auto init
                        -- updating this floatvar will create a new array
                        updateFloatVar (FloatVar_Array name idx_expr) 0
                        state' <- get
                        let flvars = floatArrayVars state'
                        let arr' = case M.lookup key flvars  of
                                        Just x -> x
                                        Nothing -> error "Can not happen!"
                        return arr'
    if length ind == length dim && allSmaller ind dim
      then do
        let val   = case M.lookup ind ar of
                         Just x  -> x
                         Nothing -> 0 
        return val
      else
        let ln_nr = curPos state
        in printArrayIndex_error ind name dim ln_nr

getStringVarValue :: StringVar -> PState String
getStringVarValue TimeStr_Reg = do
    updateTimeValue
    state <- get
    case M.lookup showTimeStrReg $ stringVars state of
         Just x  -> return x
         Nothing -> return "" -- ??

getStringVarValue (StringVar name) = do
    state <- get
    case M.lookup name $ stringVars state of
         Just x  -> return x
         Nothing -> return ""

getStringVarValue (StringVar_Array name idx_expr) = do
    state <- get
    ind   <- getIndex idx_expr
    let key       = name
    (dim,ar) <- case M.lookup key $ stringArrayVars state of
                     Just x  -> return x
                     Nothing -> do -- array is new, auto init
                        -- updating this var will create a new array
                        updateStringVar (StringVar_Array name idx_expr) ""
                        state' <- get
                        let strvars = stringArrayVars state'
                        let arr' = case M.lookup key strvars of
                                        Just x -> x
                                        Nothing -> error "Can not happen!"
                        return arr'
    if length ind == length dim && allSmaller ind dim
      then do
        let val   = case M.lookup ind ar of
                         Just x  -> x
                         Nothing -> ""
        return val
      else
        let ln_nr = curPos state
        in printArrayIndex_error ind name dim ln_nr

 
getIntVarValue :: IntVar -> PState Int
getIntVarValue (IntVar name) = do
    state <- get
    case M.lookup name $ intVars state of
         Just x  -> return x
         Nothing -> return 0

getIntVarValue (IntVar_Array name idx_expr) = do
    state <- get
    ind   <- getIndex idx_expr
    let key       = name
    (dim,ar) <- case M.lookup key $ intArrayVars state of
                     Just x  -> return x
                     Nothing -> do -- array is new, auto init
                        -- updating this var will create a new array
                        updateIntVar (IntVar_Array name idx_expr) 0
                        state' <- get
                        let intvars = intArrayVars state'
                        let arr' = case M.lookup key intvars of
                                        Just x -> x
                                        Nothing -> error "Can not happen!"
                        return arr'
    if length ind == length dim && allSmaller ind dim
      then do
        let val   = case M.lookup ind ar of
                         Just x  -> x
                         Nothing -> 0
        return val
      else
        let ln_nr = curPos state
        in printArrayIndex_error ind name dim ln_nr

 
--------------------------- </Lookup of variables> -------------------------



-------------------------------- <DATA functions> --------------------------

getNextDataElement :: PState DataContent
getNextDataElement = do
    state <- get
    let dat = _data state
        ptr = dataPointer state
    if length dat > ptr
      then do
        put $ state { dataPointer = ptr + 1 }
        return (dat !! ptr)
      else outdata_error [] $ curPos state


getDataString :: DataContent -> String
getDataString (DataString x) = x
getDataString (DataInt    x) = show x
getDataString (DataFloat  x) = show x


getDataInt :: DataContent -> LineNumber -> Int
getDataInt (DataInt   x) _     = x
getDataInt (DataFloat x) _     = floatToIntConvert x
getDataInt other         ln_nr = 
    let ermsg = "Unallowed DATA value '" ++ (show other) 
                ++ "', expected NUMERICAL!"
    in type_error ermsg ln_nr


getDataFloat :: DataContent -> LineNumber -> Float
getDataFloat (DataFloat x) _     = x
getDataFloat (DataInt   x) _     = fromIntegral x
getDataFloat other         ln_nr = 
    let ermsg = "Unallowed DATA value '" ++ (show other) 
                ++ "', expected NUMERICAL!"
    in type_error ermsg ln_nr

-------------------------------- </DATA functions> -------------------------


