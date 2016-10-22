module Main where

leastDivBy :: (Word,Word) -> Word
leastDivBy (a,b) = foldl1 lcm $ [a..b]

result :: Word
result = leastDivBy (1,20)

main :: IO ()
main = print result

{-
instances :: Int -> [Int] -> Int
instances element list = length $ element `elemIndices` list

removeAll :: Int -> [Int] -> [Int]
removeAll element list = if element `elem` list then removeAll element newList else list
   where newList = delete element list

unionDups :: [Int] -> [Int] -> [Int] -- like union, but keeps maximum number
unionDups = unionDups' []

unionDups' :: [Int] -> [Int] -> [Int] -> [Int]
unionDups' acc [] [] = acc
unionDups' acc [] list = unionDups' acc list []
unionDups' acc list1@(x:xs) list2 = unionDups' (acc ++ additions) newList1 newList2
   where
      additions = take (instances x list1) (repeat x)
      newList1 = removeAll x list1
      newList2 = removeAll x list2

leastDivBy :: Int -> Int -> Int
leastDivBy a b = foldl1 (*) $ foldl1 unionDups $ map factorize [a..b]

divByAll :: Int -> Int -> Int -> Bool
divByAll a b number = all (number `divisibleBy`) [a..b]

takeFst :: (Int -> Bool) -> [Int] -> Int
takeFst condition (x:xs) = if condition x then x else takeFst condition xs

result :: Int
result = takeFst (divByAll 1 19) $ map (* 20) [1..]
-}