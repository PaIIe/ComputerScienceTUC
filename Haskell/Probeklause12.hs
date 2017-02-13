--1a)
dec2Int :: [Int] -> Int 
dec2Int [] = 0
dec2Int [x] = x
dec2Int (x:xs) =10 * length xs * x + dec2Int xs
--1b)
exMult :: [Int] -> Bool
exMult [] = False
exMult [x] = False
exMult (x:xs) = elem x xs || exMult xs

--1c)
merge :: (Int->Int->Bool) -> [Int] -> [Int] -> [Int]
merge f [] xs = xs
merge f xs [] = xs
merge f (x:xs) (y:ys)
    |f x y = x : merge f xs (y:ys)
    |otherwise = y : merge f (x:xs) y

--2a) Definiere eine Funktion addTriples, welche eine Liste von integer Tripel zu einer Zahl zusammenaddiert.
addTriples :: [(Int, Int, Int)] -> Int 
addTriples [] = 0
addTriples ((a,b,c):[]) = a+b+c 
addTriples ((a,b,c):xs )= a+b+c+addTriples xs

--2b)
filterTriples :: [(Int, Int, Int)] -> Int -> [(Int, Int, Int)]
filterTriples xs n = [(a,b,c)|(a,b,c) <- xs, a + b + c == n]

--2c)Definiere eine Funktion sortTriples, die integer Tripel ihrer Größ e nach sortiert.
sortTriple :: [(Int, Int, Int)] -> [(Int, Int, Int)]
sortTriple [] = []
sortTriple ((a,b,c) : []) = (a,b,c)
sortTriple ((a,b,c) : xs )= sortTriple [(x,y,z) | (x,y,z) <- xs, vergl (x,y,z) (a,b,c)] ++ [(a,b,c)] ++ sortTriple [(x,y,z) | (x,y,z) <- xs, not(vergl (x,y,z) (a,b,c)]

vergl :: (Int, Int, Int) -> (Int, Int, Int) -> Bool
vergl (x,y,z) (a,b,c)
    |x < a = True
    |x == a && y < b == True
    |x == a && y == b && z < c == True
    |otherwise = False
    
    
    
--3. a)
data Tree a = Blatt a
            |Kind1 (Tree a)
            |Kind2 (Tree a) (Tree a) (Tree a)
--b)


    
    
    
    
    
    
    
    
