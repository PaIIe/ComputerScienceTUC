import Data.List


isSet :: (Ord a) => [a] -> Bool
isSet = comparePairwise.sort

comparePairwise :: (Eq a) => [a] -> Bool
comparePairwise [] = True
comparePairwise [_] = True
comparePairwise (x : y : xs)
    |x == y = False
    |otherwise = comparePairwise (y : xs)

    
threeEqual :: (Eq a) => a -> a -> a -> a
threeEqual m n o 
    |m == n && n == o = m
    |otherwise = 0
    
--2. Mittels ListComprehension
filterTriple :: [(Int, Int, Int)] -> Int -> [(Int, Int, Int)]
filterTriple xs n = [(a,b,c) | (a,b,c) <- xs, a + b + c == n]
