module BasicTime where


import System.Time

import Control.Monad.State

import Definitions

import {-# SOURCE #-} ProgrammState


import Data.Char (isDigit)

import qualified Data.Map as M (lookup)

import Parser.ParserTypes(StringVar(StringVar))

--import Debug.Trace

hoursToSec :: Int -> Int
hoursToSec h = minToSecs (60 * h)

minToSecs :: Int -> Int
minToSecs min = 60 * min


isValidTimeString :: String -> Bool
isValidTimeString str =
    -- filter all numbers out, so should be empty
    let nonum = filter (not . isDigit) str 
    in if length str == 6 && null nonum
         then
           let (h,m,s) = parseTimeStringToInt str
               check_h = h >= 0 && h < 24
               check_m = m >= 0 && m < 60
               check_s = s >= 0 && s < 60
           in if check_h && check_m && check_s
                then True
                else False
         else False


getTimeCountValue :: PState Float
getTimeCountValue = do
    -- made time register up to date
    updateTimeValue
    -- get new time register value
    state <- get 
    let timestr = getMapVal $ M.lookup "TI$" $ stringVars state
        ln_nr   = curPos state
    -- get current 1/100 secs 
    now     <- liftIO $ getClockTime
    now_cal <- liftIO $ toCalendarTime now
    -- we only want the first 2 signs of the pico seconds
    let _100_secs = div (ctPicosec now_cal) (10^10) 
    -- convert into 1/60 seconds number (till 00.00.00h, not till 
    --  start of PC!)
    return $ fromIntegral $ getTimeCountValue' timestr _100_secs ln_nr
  where
        getTimeCountValue' :: String -> Integer -> LineNumber -> Integer 
        getTimeCountValue' basTimeString _100_secs ln_nr = 
            --let nonum = filter isDigit basTimeString
            --in if length basTimeString == 6 && null nonum
              --   then
                --       check_h = h >= 0 && h < 24
                  --     check_m = m >= 0 && m < 60
                   --    check_s = s >= 0 && s < 60
                 --  in if check_h && check_m && check_s
                 if isValidTimeString basTimeString
                   then
                     let (h,m,s)  = parseTimeStringToInt basTimeString
                         day_secs = hoursToSec h + minToSecs m + s
                         _60_secs = (fromIntegral _100_secs) * (60/100)
                     in truncate (60 * (fromIntegral day_secs) + _60_secs)
                  --      else
                        -- should not happen because write in is checked, so ipret error here
                   else
                   -- should not happen because write in is checked, so ipret error here
                     error "bla"


updateTimeValue :: PState ()
updateTimeValue = do
    -- get the real now time
    now     <- liftIO $ getClockTime
    now_cal <- liftIO $ toCalendarTime now
    -- get last update time from state and the old string time value
    state   <- get 
    let last_cal    = last_update_time state
        time_var    = StringVar "TI$"
        old_timestr = getMapVal $ M.lookup "TI$" $ stringVars state
    updateStringVar time_var $ getNewTimeString old_timestr last_cal now_cal


getNewTimeString :: String -> CalendarTime -> CalendarTime -> String
getNewTimeString old_timestr old_realtime now_realtime =
    let hour_dif            = (ctHour now_realtime) - (ctHour old_realtime)
        mins_dif            = (ctMin  now_realtime) - (ctMin  old_realtime)
        secs_dif            = (ctSec  now_realtime) - (ctSec  old_realtime)
        (str_h,str_m,str_s) = parseTimeStringToInt old_timestr
        new_h               = makeNumberToString $ mod (str_h + hour_dif) 24 
        new_m               = makeNumberToString $ mod (str_m + mins_dif) 60 
        new_s               = makeNumberToString $ mod (str_s + secs_dif) 60 
    in new_h ++ new_m ++ new_s

parseTimeStringToInt :: String -> (Int,Int,Int)
parseTimeStringToInt timestr =
    let hours = read $ take 2 timestr
        mins  = read $ take 2 $ drop 2 $ timestr
        secs  = read $ take 2 $ drop 4 $ timestr
    in (hours,mins,secs)


calendarTimeToTimeString :: CalendarTime -> String 
calendarTimeToTimeString cal = 
    let str_h = makeNumberToString $ ctHour cal 
        str_m = makeNumberToString $ ctMin  cal 
        str_s = makeNumberToString $ ctSec  cal
    in str_h ++ str_m ++ str_s


makeNumberToString :: Int -> String 
makeNumberToString nr = 
    if nr >= 10
      then show nr
      else "0" ++ show nr

