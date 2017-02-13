-- 2. Aufgabe Funktionen höherer Ordnung


calcOps :: [(Float -> Float -> Float)] -> Float -> Float -> [Float]
calcOps [] _ _ = []
calcOps (op:ops) x y = (op x y) : (calcOps(ops x y)) 

--b)

linearSearch :: (a -> Bool) -> [a] -> Int
linearSearch p [] = -1
linearSearch p (x:xs)
    |p x = 0
    |otherwise =    if r < 0 then -1 else 1 + r
                    where r = linearSearch p xs

--c
quickSortGen :: (a -> a -> Bool) -> [a] -> [a]
quickSortGen _ [] = []
quickSortGen cmp (x:xs) = quickSortGen cmp [ y | y <-xs, cmp y x ] ++ [x] ++ quickSortGen cmp [ z | z <-xs, not (cmp z x) ]

cmpString :: String -> String -> Bool
cmpString [] ys = True
cmpString xs [] = False
cmpString (x:xs) (y:ys)
    |toLower(x) < toLower(y) = True
    |toLower(x) > toLower(y) = False
    |otherwise = cmpString xs ys
    
--Aufgabe 3 a)

numOddEvenSquares :: Int -> (Int,Int)
numOddEvenSquares n = (length (filter odd candidates), 
                        sum (map isEven01 candidates)) 
    where candidates = [x^2 | x <- [1..(div n 2)], x^2 <= n]
          isEven01 x = (if even x then 1 else 0)

length' :: [a] -> Int
length' xs = sum (map const1 xs) where const1 x = 1
length'' :: [a] -> Int
length'' xs = foldl red 0 xs where red x y = x+1


--c)
reverse' :: [a] -> [a]
reverse' xs = foldl rev [] xs where rev x y = [y] ++ x
reverse'' :: [a] -> [a]
reverse'' xs = foldr rev [] xs where rev x y = y ++ [x]
      

