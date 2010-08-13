module Basic_IO where

--------------------------------- <Imports> --------------------------------

import IO
import qualified Data.Map as M (lookup,insert)
import Control.Monad.State
import Data.Char (toLower)
import Data.List (findIndices)

--import Parser.BasicHapMonad
import Parser.ParserTypes hiding (
                                   Token(..),
                                   TokenWrap(..),
                                   Constant(..),
                                   ParserState(..)
                                 )

import Expressions
import ProgrammState
import Definitions

import BinaryOps

--------------------------------- </Imports> -------------------------------

------------------------------ <Basic Actions> -----------------------------

-- get a char from handle, but also catches EOF error, so we can go on 
--  with it
hGetCharEOF :: Handle -> IO Char
hGetCharEOF handle =  (hGetChar handle) `catch` eofHandler 
  where
    eofHandler e = if isEOFError e 
                     then return '\0' -- safe way ??
                     else error "getCHar error!"


unJustHandle :: Maybe Handle -> Handle
unJustHandle (Just h) = h
unJustHandle _ = error "Handle not found!"

-- A simple wrapper for inserting vars from IO actions. Simple said it
--  generalize the lift operation
insertIOValue :: Var -> PState String -> PState ()
insertIOValue var ioAct = insertValue var ioAct id read read


------------------------------ </Basic Actions> -----------------------------

-- this action makes the dirty work by an open command, it analyses 
--  the given contents and build a correct handle out of it and at this to
--   handle map with the file ID as key
handleDevices :: Int -> Int -> Maybe Int -> Maybe String -> PState () 
handleDevices fileID devID secID path_mode
    | devID == devID_monitor  = 
         if secID == Nothing
           -- standard output
           then insertFileHandle fileID stdout
           else do 
             state <- get
             io_error "Invalid OPEN configuration" $ curPos state
    | devID == devID_filesys  = do
         state <- get
         let ln_nr = curPos state
          {-
            -- sec id needed???
            let secID' = case secID of
                              Nothing             -> defaultSecondID 
                              Just secID_read     -> secID_read
                              Just secID_write    -> secID_write
                              -- eof is written automatically every time
                              Just secID_writeEOF -> secID_write 
                              Just other          -> do
                                    let ermsg = "Unsupported SecondID '" 
                                                ++ show other ++ "'"
                                    io_error ermsg ln_nr
           -}
         -- middle args ftype needed for something??
         let (path,_,mode) = case path_mode of 
                                  Nothing -> 
                                     let ermsg = "You have to give a " 
                                                 ++ "path/mode for "
                                                 ++ "file system IO"
                                      in io_error ermsg ln_nr
                                  Just x  -> splitpath_mode x ln_nr
         handle <- liftIO $ openFile path mode
         insertFileHandle fileID handle
    | devID == devID_keyboard = do
         if secID == Nothing
           -- standard input
           then insertFileHandle fileID stdin
           else do 
             state <- get
             io_error "Invalid OPEN configuration" $ curPos state
    | otherwise               = do
         state <- get
         io_error "Invalid OPEN configuration" $ curPos state


--this action abstracts the input action depending on the given handle
getfileInput :: Handle -> PState String
getfileInput handleIn = do
    inp <- myHGetChar handleIn
    if inp == io_sep || inp == '\n'
      then return [] -- seperator case, stop parsing, ignore separator sign
      else do
        rst <- getfileInput handleIn
        return (inp : rst)


-- this action abstracts the get action depending on the given handle
getCommand :: Handle -> Maybe Handle -> [Var] -> PState ()
getCommand handleIn handleOut vars = do
    let pre_liner = case handleOut of
                         Just h  -> liftIO $ hPutStr h "? "
                         Nothing -> return ()
        get       = myHGetChar handleIn
        get_act   = pre_liner >> get >>= (return . flip (:) [])
    mapM_ (flip insertIOValue get_act) vars


-- this action takes care of EOF in the following way:
--  if an EOF is reached for this handle first time, set the st flag to 1
--   and save, that the eof was reached
--  if it is reached for a second time, stop interpreting in error case
myHGetChar :: Handle -> PState Char
myHGetChar handle =  do
    nc <- liftIO $ hGetCharEOF handle
    if nc == '\0'
      then do -- EOF case
         state1 <- get
         case M.lookup (show handle) $ eof_reached state1 of
              Nothing -> do -- all ok, set the register flag
                  st_ref <- getFloatVarValue $ FloatVar showST_Reg 
                  state <- get 
                  let eofs = eof_reached state
                  let new_eofs = M.insert (show handle) True eofs
                      st_ref_bin = reverse $ toBin $ floatToIntConvert st_ref
                      st_ref_bin' = reverse $ take 5 st_ref_bin ++ [1] ++ drop 6 st_ref_bin
                      new_st_ref  = fromIntegral $ toIntFromBin $ st_ref_bin'
                  updateFloatVar (FloatVar showST_Reg) new_st_ref
                  state' <- get
                  put $ state' { eof_reached = new_eofs } 
                  return '\n'
              Just _  -> -- eof thrown second time, error case
                  error "EOF ERROR!"
      else return nc


-- this action abstracts the print action depending on the given handle
printCommand :: Handle -> [Output] -> Bool -> PState ()
printCommand handleOut output printLn = do
    outStr <- mapM outputToString output
    let printStr = foldl (++) "" $ outStr
    liftIO $ if printLn
               then
                 hPutStrLn handleOut printStr
               else
                 hPutStr handleOut printStr
  where
    outputToString :: Output -> PState String 
    outputToString (OutStringExpr x) = evalStringExpression x 
    outputToString (OutNumExpr    x) = do
        res <- evalExpression x 
        let str = if isIntValue res
                    then show $ truncate res
                    else show res
        return str


-- this function handles the splitting up of the basic path_mode string,
--  which has following format : "path[,file_type[,open_mode]]"
splitpath_mode :: String -> LineNumber -> (String,String,IOMode)
splitpath_mode str ln_nr =
    let seps = findIndices ((==) io_sep) str
    in case length seps of
            0 -> (str,default_type,default_mode)
            1 -> let (path,ftype) = splitAt (head seps) str
                     nm_ftype     = getType $ map toLower ftype
                 in (path,nm_ftype,default_mode)
            2 -> let (path,rst)   = splitAt (head seps) str
                     rst'         = tail rst -- first sign == first comma!
	             newIdx       = findIndices ((==) io_sep) rst'
                     (ftype,mode) = splitAt (head newIdx) rst'
                     nm_ftype     = getType $ map toLower ftype
                     nm_mode      = basicToHaskellMode $ tail mode -- s.a.
                 in (path,nm_ftype,nm_mode)
            x -> let ermsg = "Invalid path/mode format string '" 
                             ++ str ++ "', correct format is: "
                             ++ "\"<path>[,<type>][,<mode>]\""
                 in io_error ermsg ln_nr
                    
 
