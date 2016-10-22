module Main where

-- utility functions

onIntegers :: RealFrac a => (a -> a) -> (Integer -> Integer)
onIntegers func = toInteger . floor . func . fromInteger

square :: Integer -> Integer
square = onIntegers (** 2)

sumSquares :: Integer -> Integer
sumSquares n = sum $ map square [1..n]

squareSum :: Integer -> Integer
squareSum n = square $ sum [1..n]

diff :: Integer -> Integer -> Integer
diff a b = abs (a - b)

-- work

result :: Integer
result = diff a b
   where
      a = sumSquares 100
      b = squareSum 100

main :: IO ()
main = print result