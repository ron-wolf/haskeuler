module Main where

divBy :: Integral a => a -> a -> Bool
n `divBy` d = n `mod` d == 0

result :: Integral a => a
result = sum [ x | x <- [1..1000], any (x `divBy`) [3, 5] ]

main :: IO ()
main = print result