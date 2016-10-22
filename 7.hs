module Main where

{-
stop :: (a -> Bool) -> [a] -> [a]
stop = stop' []

stop' :: [a] -> (a -> Bool) -> [a] -> [a]
stop' acc test [] = acc
stop' acc test (x:xs) =
   if   test x
   then acc
   else stop' (acc ++ [x]) test xs

prime :: Integral a => a -> Bool
prime n = not $ any (n `divBy`) $ stop (> n) primes
-}

divBy :: Integral a => a -> a -> Bool
n `divBy` d = n `mod` d == 0

candidates :: Integral a => a -> [a]
candidates n = [2..(maxCand n)]
   where maxCand = floor . sqrt . fromIntegral

prime :: Integral a => a -> Bool
prime n = not $ any (n `divBy`) $ candidates n

primes :: Integral a => [a]
primes = filter prime [2..]

result :: Integral a => a
result = primes !! (10001 - 1)

main :: IO ()
main = print result