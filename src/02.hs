module Main where

fibs :: [Word]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

-- work

result :: Word
result = sum $ filter even $ takeWhile (< 4000000) fibs

main :: IO ()
main = print result
