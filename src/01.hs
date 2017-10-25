module Main where

divides :: Integral a => a -> a -> Bool
d `divides` n = n `mod` d == 0

result :: Int
result = sum [ x | x <- [1..1000], any (`divides` x) [3, 5] ]

main :: IO ()
main = print result
