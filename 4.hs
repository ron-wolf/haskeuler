module Main where

import Data.Char

-- utility functions

digits :: Int -> [Int]
digits = map digitToInt . show

numDigits :: Int -> Int
numDigits = length . digits

slice :: (Int,Int) -> [Int] -> [Int]
slice (a,b) list = map (list !!) [a..b]

fstPart :: Int -> [Int]
fstPart n = slice (0, middle) (digits n)
   where middle = floor $ (fromIntegral $ numDigits n) / 2 - 1

sndPart :: Int -> [Int]
sndPart n = slice (middle, end) (digits n)
   where
      middle = ceiling $ (fromIntegral $ numDigits n) / 2
      end = numDigits n - 1

palindromic :: Int -> Bool
palindromic n = fstPart n == reverse (sndPart n)

-- work

mults :: [Int]
mults = [ a * b | a <- [100..999], b <- [100..999], a < b ]

result :: Int
result = maximum $ filter palindromic mults

main :: IO ()
main = print result