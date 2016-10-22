-- sum of all the primes less than two million

module Main where

import Data.List

-- utility functions

slice :: (Int,Int) -> [b] -> [b]
slice (a,b) list = map (list !!) [a..b]

fstTrue :: (a -> Bool) -> [a] -> a
fstTrue test list = head $ filter test list

safeElemIndex :: Eq a => a -> [a] -> Int
safeElemIndex item list = head $ elemIndices item list -- head is still prone to errors... just avoiding monads for now

ixFstTrue :: Eq a => (a -> Bool) -> [a] -> Int
ixFstTrue test list = safeElemIndex (fstTrue test list) list

stop :: Eq a => (a -> Bool) -> [a] -> [a]
stop test list = slice (0, ixFstTrue test list - 1) list




-- the list of primes is the list of numbers that are divisible by no prime less than them
-- the first prime is two
-- the next prime is the first number greater than two that is not divisible by two
-- the next prime is the first number greater than that number that is divisible by neither two nor that number
-- and so on

primes 0 = 2
primes 1 = fstTrue prime $ slice (0,0) primes
primes 2 = fstTrue prime $ slice (0,1) primes



divBy :: Integral a => a -> a -> Bool
n `divBy` d = gcd n d == n

candidates :: Integral a => a -> [a]
candidates n = [2..(maxCand n)]

maxCand :: Integral a => a -> a
maxCand = floor . sqrt . fromIntegral

prime' :: Integral a => a -> Bool
prime' n = not $ any (n `divBy`) $ candidates n

primes' :: Integral a => [a]
primes' = filter prime' [2..]

prime :: Integral a => a -> Bool
prime n = not $ any (n `divBy`) $ stop (> maxCand n) primes'

primes :: Integral a => [a]
primes = filter prime [2..]

-- work

list :: Integral a => [a]
list = stop (> 2000000) primes

result :: Integral a => a
result = sum list

main :: IO ()
main = print result