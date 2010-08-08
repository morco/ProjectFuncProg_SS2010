module BinaryOps(evalLogicExpression) where

------------------------------------------------- <Imports> ------------------------------------------------------


------------------------------------------------- </Imports> -----------------------------------------------------


binaryFormatSize :: Int
binaryFormatSize = 16 -- c64 standard


evalLogicExpression :: String -> Float -> Float -> Int 
evalLogicExpression "||" op1 op2 = 
    let bin1   = toBin $ truncate op1
        bin2   = toBin $ truncate op2
        maxlen = max (length bin1) (length bin2)
        bin1'  = fillBinToSize bin1 maxlen
        bin2'  = fillBinToSize bin2 maxlen
    in  toIntFromBin $ combine2Lists bin1' bin2' binaryOr
evalLogicExpression "&&" op1 op2 = 
    let bin1   = toBin $ truncate op1
        bin2   = toBin $ truncate op2
        maxlen = max (length bin1) (length bin2)
        bin1'  = fillBinToSize bin1 maxlen
        bin2'  = fillBinToSize bin2 maxlen
    in  toIntFromBin $ combine2Lists bin1' bin2' binaryAnd
evalLogicExpression "not" op1 _ = 
    let bin1   = toBin $ truncate op1
    in  toIntFromBin $ map binaryNot bin1
evalLogicExpression _ _ _ = error "unallowed logic op"


fillBinToSize :: [Int] -> Int -> [Int]
fillBinToSize bin size
    | length bin < size = (take (size - (length bin)) $ repeat 0) ++ bin
    | length bin == size = bin
    | otherwise = error "binary numbers not same size!"


-- TODO: fold alarm !!!
toIntFromBin :: [Int] -> Int
toIntFromBin bin 
   | head bin == 0  = toIntFromBin' bin ((length bin) - 1)
   | otherwise  = let c2bin = binaryAdd (map binaryNot bin) (toBin 1)
                  in -(toIntFromBin' c2bin ((length c2bin) - 1))
  where
        toIntFromBin' []     (-1) = 0
        toIntFromBin' (x:xs) idx  = x * 2 ^ idx + toIntFromBin' xs (idx - 1)
        toIntFromBin' _      _    = error "Error by concerting from bin to int!"


toBin :: Int -> [Int]
toBin x 
   | x >= 0 = fillBinToSize (reverse $ toBin' x) binaryFormatSize
   | otherwise = binaryAdd (map binaryNot $ fillBinToSize (reverse $ toBin' (-x)) binaryFormatSize) (toBin 1)
  where
        toBin' :: Int -> [Int]
        toBin' 0 = []
        toBin' y = (mod y 2) : (toBin' $ div y 2)


binaryAdd :: [Int] -> [Int] -> [Int]
binaryAdd bin1 bin2 = reverse $ binaryAdd' (reverse bin1) (reverse bin2) 0
  where
       binaryAdd' :: [Int] -> [Int] -> Int -> [Int]
       binaryAdd' []     []     _   = []
       binaryAdd' (x:xs) (y:ys) car =
          let (s1,c1) = binarySum x y
              (s2,c2) = binarySum s1 car
          in s2 : binaryAdd' xs ys (c1 + c2)
       binaryAdd' _ _ _ = error "difference in bin size!"

binarySum :: Int -> Int -> (Int,Int)
binarySum 0 0 = (0,0)
binarySum 0 1 = (1,0)
binarySum 1 0 = (1,0)
binarySum 1 1 = (0,1)
binarySum _ _ = error "non binary value"



binaryOr :: Int -> Int -> Int
binaryOr 0 0 = 0
binaryOr 0 1 = 1
binaryOr 1 0 = 1
binaryOr 1 1 = 1
binaryOr _ _ = error "non binary value"


binaryAnd :: Int -> Int -> Int
binaryAnd 0 0 = 0
binaryAnd 0 1 = 0
binaryAnd 1 0 = 0
binaryAnd 1 1 = 1
binaryAnd _ _ = error "non binary value"

binaryNot :: Int -> Int
binaryNot 0 = 1
binaryNot 1 = 0
binaryNot _ = error "non binary value"


combine2Lists :: [a] -> [b] -> (a -> b -> c) -> [c]
combine2Lists []     []     _ = []
combine2Lists (x:xs) (y:ys) f = (f x y) : combine2Lists xs ys f
combine2Lists _      _      _ = error "Combine2lists awaits lists of same length!"


