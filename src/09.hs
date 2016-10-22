module Main where

{-
pwr :: Integral a => a -> a -> a
pwr b e = pwr' b b e

pwr' :: Integral a => a -> a -> a -> a
pwr' acc b 1 = acc
pwr' acc b e = pwr' (acc*b) b (e-1)

x % y
   | x < y     = x
   | x == y    = 0
   | otherwise = (x - y) % y
-}

result :: (Enum a, RealFloat a) => a
result = head [ a * b * sqrt (a * a + b * b) | a <- [1..998], b <- [1..998], a < b, a + b + sqrt (a * a + b * b) == 1000]

main :: IO ()
main = print $ floor result