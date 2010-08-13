--------------------------------- <Imports> --------------------------------

import IO
import System ( getArgs )
import qualified Data.Map as M (lookup,insert,delete)
import Control.Monad.State
import Data.Char (toLower)
import Data.List (findIndices)

import Parser.BasicHapMonad
import Parser.ParserTypes hiding (
                                   Token(..),
                                   TokenWrap(..),
                                   Constant(..),
                                   ParserState(..)
                                 )

import Expressions
import ProgrammState
import Definitions
import Basic_IO

import BinaryOps

import Debug.Trace(trace)

--------------------------------- </Imports> -------------------------------


--------------------------------- <Main> -----------------------------------


-- main principle:
--            -> get basic programm file path from arguments
--            -> open file
--            -> parse 
--            -> interprete

main :: IO ()
main = do
    -- needed to have output and getLine in the same line   
    hSetBuffering stdout NoBuffering      
    -- needed for getChar to read at once   
    hSetBuffering stdin NoBuffering  

    args <- getArgs
    handle <- openFile (head args) ReadMode
    contents <- hGetContents handle
    let pTree = getParseTree contents
        state = getNewState $! pTree
    runStateT (initState >> interpret (completeProgram state) ) state
    hClose handle

--------------------------------- </Main> ----------------------------------


----------------------------- <Helping functions> -------------------------
-- This functions helps or sometimes do the main work by evaluating 
--  special commands, the main reason, why they are not in where clauses 
--   is that they are needed by more than one command


-- This action does the stuff for the "on" command. This command has the
--  following structure: an numerical expression and a list of line numbers
--   It evaluates the expressions and makes a jump to the line in the list,
--    given by the expressions result, e.g. if the expressions evaluates to
--     "1" it makes and goto (or gosub) to the first line number in the 
--      list (Basic starts here counting by 1!!). If the expression 
--       evaluates to "0" it is jumped over (see also "if" command).
--  This is implemented by evaluating the expression and then contructing
--   a regular Goto or Gosub command with the correct line number and 
--    then executing this command
doOn :: NumExpr -> (LineNumber -> ControlStruct) -> [LineNumber] 
         -> PState ()
doOn numExpr constr linenums = do   
    res <- evalExpression numExpr
    let res' = floatToIntConvert res
    if res' > 0 && res' <= length linenums
      then evalCommand $ ControlStructure $ constr $ linenums !! (res' - 1)
      else 
        if res' < 0
          then do 
            state <- get
            let ermsg = "Negative argument '" ++ show res'
                        ++ "' for ON command not allowed!"
            illqua_error ermsg $ curPos state
          else return ()


-- With this function a program jump is executed by taking the whole
--  program (== List) and dropping all lines at the beginning up to the
--   the line to which we want to jump
jump_prog :: Program -> LineNumber -> Program
jump_prog oldprog nxPos = dropWhile (\(a,_) -> a /= nxPos) oldprog
    
----------------------------- </Helping functions> ------------------------


-- The main interpret function, works on a Program, which means a list 
-- which pairs up line numbers with a list of commands.
--  Because commands like "goto" and "end" can change the program flow 
--  and finish so the program before the this list is empty,
--   there have to be some checkings done here, which works like this:
--     1. Update the nextPos of state, which is in the normal case the 
--         following line in the program list 
--          (Caution, this means not, it has to have the line number + 1 !)
--     2. Evaluate all commands of the current line
--     3. Check if a command set the program finished flag true, if so, 
--         terminate at once
interpret :: Program -> PState ()
interpret []                   = 
    get >>= \st -> put $ st { progFinished = True } 
interpret ((lnNr,commands):xs) = do
    state <- get
    -- update the current line pointer
    put $ state { curPos = lnNr }
    -- update the next line pointer
    updateStateNextPos xs 
    -- execute all commands of this line
    newState1 <- get
    mapM_ evalCommand commands
    newState2 <- get
    -- check if an command set the program finished flag
    if progFinished newState2
      then
        return ()
      else
        interpret xs


-- This Function handles the hole work, it evaluates all commands in 
--  their right manner
evalCommand :: Command -> PState ()
evalCommand (IO_Com (Input ((InputStuff lsComment vars), printLn))) = do
    state <- get
    let out_handle = basic_stdout state 
        pre_liner  = liftIO $ hPutStr out_handle "? "
    liftIO $ case lsComment of
               []  -> return ()
               [x] -> if printLn
                         then
                           hPutStrLn out_handle x
                         else
                           hPutStr out_handle x
               _   -> let ermsg = "Comment of INPUT command" 
                                  ++ " can only be a single STRING"
                      in interprete_error ermsg $ curPos state
    mapM_ (flip insertIOValue (pre_liner >> getfileInput stdin)) vars

-- The easiest way to get input chars and strings together is to make
--  the chars to strings by combining with the empty list, so this is done
evalCommand (IO_Com (Get vars)) = do
    state <- get
    let out_h = Just $ basic_stdout state
    getCommand stdin out_h vars

evalCommand (IO_Com (Print (list, printLn))) = do 
    state <- get
    let out_h = basic_stdout state
    printCommand out_h list printLn 

evalCommand NOOP = return ()            

-- end is not right this way, cause in c64 a program can be resumed
evalCommand (ControlStructure End) = do
    state <- get
    put $ state { progFinished = True }           

evalCommand (ControlStructure (Goto nr)) = do
    state <- get
    let changedprog = jump_prog (completeProgram state) nr
    if null changedprog 
      then do
        let ermsg = "GOTO to nirwana(line: " ++ show nr ++ ")"
        undefst_error ermsg $ curPos state
      else 
        interpret changedprog 

evalCommand (ControlStructure (If expr commands)) = do
    bVal <- evalBoolExpression expr
    if bVal
      then
        mapM_ evalCommand commands
      else
        return ()

evalCommand (ArithAssignment var numExpr) = do
    state <- get
    let ln_nr      = curPos state
        var'       = NumVar_Var var
        get_act    = evalExpression numExpr
        str_err    = "STRING value in numerical expression"
        toStr_func = \_ -> interprete_error str_err ln_nr
        toInt_func = floatToIntConvert
        toFlt_func = id
    insertValue var' get_act toStr_func toInt_func toFlt_func

evalCommand (StringAssignment var stringExpr) = do 
    state <- get
    let ln_nr      = curPos state
        var'       = StringVar_Var var 
        get_act    = evalStringExpression stringExpr
        toStr_func = id
        num_err    = " value in STRING expression"
        toInt_func = \_ -> interprete_error ("INT" ++ num_err) ln_nr 
        toFlt_func = \_ -> interprete_error ("FLOAT" ++ num_err) ln_nr
    insertValue var' get_act toStr_func toInt_func toFlt_func

-- this implementation works only with correct folded fors and nexts
evalCommand (ControlStructure (For var (start,_,_))) = do
    state  <- get
    -- only reading, should not change state
    start' <- makeFloat start 
    if fromNext state 
      then 
        put $ state { 
                fromNext  = False 
              }
      else do -- first iteration
        -- set body var to init value (can only be float var!)
        updateFloatVar var start'  
        -- put this for line at the top of the for stack and set the
        --  come from next flag to false
        state' <- get
        put $ state' { 
                for_lines = (curPos state') : (for_lines state'),
                fromNext  = False 
              }

evalCommand (Next (For (FloatVar name) (start,step,end))) = do
    state <- get
    step' <- makeFloat step   
    end'  <- makeFloat end  
    let var    = FloatVar name
    i     <- getFloatVarValue var
    let i'     = i + step'
        fors   = for_lines state
    if i' > end'
      then -- for is completed
        put $ state { for_lines = tail fors } -- delete head == my for
      else do -- start next iteration
        updateFloatVar var i' -- increment var
        state' <- get
        -- say the for, this is not first iteration
        put $ state' { fromNext = True } 
        -- finally make some kind of goto to the for header, this is not
        --  a normal goto, because can happen, that you jump not only 
        --   between lines, but also between commands in a single line
        let nlist    = jump_prog (completeProgram state) $ head fors
            myfor    = ControlStructure (For var (start,step,end))
            -- the following is for jumping in the for line to the right 
            --  command or other said, dropping all commands which stand 
            --   befor our jumping for
            fstline  = head nlist
            com'     = dropWhile ((/=) myfor) $ snd $ fstline
            fstline' = (fst $ fstline, com')
        interpret (fstline' : tail nlist)   

evalCommand (ControlStructure (GoSub lnNr)) = do
    state <- get
    let newState = 
         state { 
          backJumpAdressStack = (nextPos state):(backJumpAdressStack state) 
         }
    put $ newState    
    evalCommand (ControlStructure $ Goto $ lnNr)

evalCommand (ControlStructure Return) = do
    state <- get
    let backJumpPoint = head $ backJumpAdressStack state
    put $ state { backJumpAdressStack = tail $ backJumpAdressStack state }
    evalCommand (ControlStructure $ Goto backJumpPoint)

evalCommand (Read vars) = mapM_ readVar vars
  where
        readVar :: Var -> PState ()
        readVar var = do
            state <- get
            let get_act    = getNextDataElement
                ln_nr      = curPos state
                toStr_func = getDataString
                toInt_func = flip getDataInt ln_nr
                toFlt_func = flip getDataFloat ln_nr
            insertValue var get_act toStr_func toInt_func toFlt_func    

evalCommand Restore = do
    state <- get
    put $ state { dataPointer = 0 }
    
evalCommand (Def name var numExpr) = do
    state <- get
    let md_cf = M.insert name (var,numExpr) $ custom_funcs state
    put $ state { custom_funcs = md_cf }

evalCommand (ControlStructure (On_Goto numExpr linenums)) = 
    doOn numExpr Goto linenums

evalCommand (ControlStructure (On_Gosub numExpr linenums)) = 
    doOn numExpr GoSub linenums

evalCommand (Dim myvars) = mapM_ dimArray myvars  

evalCommand (IO_Com (Open fileID devID secID path_mode)) = do
    state <- get
    let (fid_min,fid_max) = file_id_range
        ln_nr             = curPos state
    if fileID >= fid_min && fileID <= fid_max
      then do
        let devID' = getDevID devID ln_nr 
        handleDevices fileID devID' secID path_mode     
      else do
        let ermsg = "FileID '" ++ show fileID ++ "' is not in valid range " 
                    ++ show file_id_range
        io_error ermsg ln_nr

evalCommand (IO_Com (Close fileID)) = do
    state <- get
    let handle       = unJustHandle $ M.lookup fileID $ file_handles state
        new_fhandles = M.delete fileID $ file_handles state
        new_eofs     = M.delete (show handle) $ eof_reached state
    liftIO $ hClose handle
    put $ state { 
            file_handles = new_fhandles, 
            eof_reached  = new_eofs
          }
    
evalCommand (IO_Com (GetF fileID vars)) = do
    state <- get
    let my_handle = unJustHandle $ M.lookup fileID $ file_handles state
    getCommand my_handle Nothing vars

evalCommand (IO_Com (PrintF fileID (output,printLn))) = do
    state <- get
    let my_handle = unJustHandle $ M.lookup fileID $ file_handles state
        bs_stdout = basic_stdout state
    if my_handle == bs_stdout
      then if null output
             then put $ state { basic_stdout = stdout }
             else return ()
      else return ()
    printCommand my_handle output printLn 

evalCommand (IO_Com (InputF fileID vars)) = do
    state <- get
    let my_handle = unJustHandle $ M.lookup fileID $ file_handles state
    mapM_ (flip insertIOValue (getfileInput my_handle)) vars

evalCommand (IO_Com (Cmd fileID m_string)) = do
    state <- get
    let my_handle = unJustHandle $ M.lookup fileID $ file_handles state
    put $ state { basic_stdout = my_handle }
    case m_string of
         Nothing -> return ()
         Just x  -> evalCommand $ IO_Com $ Print ([OutStringExpr $ StringOp $ StringLiteral $ x],True)

evalCommand com = do
    state <- get
    let ln_nr = curPos state
    interprete_error ("Unknown command '" ++ show com ++ "'") ln_nr 

