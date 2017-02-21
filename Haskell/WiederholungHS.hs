calcFeb :: Int -> Int
calcFeb n 
    |n >= 1 = calcFeb(n-1) + calcFeb(n-2)
    |otherwise = 1

middleOfThree :: Int->Int->Int->Int
middleOfThree a b c
    |a > b && c < b = b
    |b > a && c < a = a
    |b > a && c > a = c
    |otherwise = b

splitList :: [(Int,Int)] -> ([Int,Int])
splitList xys= ([x | (x,y) <- xys],[y | (x,y) <- xys]) 

calcOps :: [(Float -> Float -> Float)] -> Float -> Float -> [Float]
calcOps [] _ _ = []
calcOps (op:ops) x y = (op x y) : (calcOps(ops x y))

doublePs :: [Int] -> [Int]
doublePs xs = [2*x | x <- xs, x > 0 ]

spaces :: Int -> [Char]
spaces n = [' ' | i <- [1..n]]
