module Excer3
	where

-- Excercise 3.7 p.31
fib :: Integer -> Integer
fib 1 = 1
fib 2 = 1
fib n = fib (n-2) + fib (n-1)

-- Excercise 3.8 p.31
mult :: Integer -> Integer -> Integer
mult a 1 = a
mult a b = a + mult a (b-1)

-- Excercise 3.9 p.31
my_map :: (a -> b) -> [a] -> [b]
my_map _ [] = []
my_map f (x:xs) = f x : my_map f xs

