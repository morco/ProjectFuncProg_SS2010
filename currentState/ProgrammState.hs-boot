module ProgrammState where


--import Control.Monad.State

import Parser.ParserTypes( 
                           Var(..), 
                           DataContent(..), 
                           Program, 
                           ParseTree(..),
                           NumExpr,
                           FloatVar(..),
                           IntVar(..),
                           StringVar(..)
                         )

import Definitions




createNewRandomSequence :: Int -> PState () 

getMapVal :: Maybe a -> a

updateFloatVar :: FloatVar -> Float -> PState ()

updateStringVar :: StringVar -> String -> PState ()

allSmaller :: (Num a,Ord a) => [a] -> [a] -> Bool

