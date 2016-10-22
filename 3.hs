module Main where

-- utility functions

divBy :: Word -> Word -> Bool
n `divBy` d = n `mod` d == 0

candidates :: Word -> [Word]
candidates n = [2..(maxCand n)]
   where maxCand = floor . sqrt . fromIntegral

prime :: Word -> Bool
prime n = not $ any (n `divBy`) $ candidates n

factors :: Word -> [Word]
factors n = filter (n `divBy`) $ candidates n

primeFactors :: Word -> [Word]
primeFactors n = filter prime $ factors n

factorize :: Word -> [Word]
factorize = factorize' []

factorize' :: [Word] -> Word -> [Word]
factorize' acc 1 = acc
factorize' acc n
   | prime n     = n:acc
   | otherwise   = factorize' (next:acc) $ n `div` next
                   where next = head $ primeFactors n

-- work

result :: Word
result = maximum $ factorize 600851475143

main :: IO ()
main = print result