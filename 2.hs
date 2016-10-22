module Main where

-- utility functions

stop :: (a -> Bool) -> [a] -> [a]
stop = stop' []

stop' :: [a] -> (a -> Bool) -> [a] -> [a]
stop' acc test [] = acc
stop' acc test (x:xs) =
   if   test x
   then acc
   else stop' (acc ++ [x]) test xs

fibs :: [Word]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

-- work

result :: Word
result = sum $ filter even $ stop (> 4000000) fibs

main :: IO ()
main = print result