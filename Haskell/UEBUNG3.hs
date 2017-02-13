--3.Uebung 1. Aufgabe
orderTuple :: (Int, Int, Int) -> (Int, Int, Int)
orderTuple (a, b,c)
    |a > b = orderTuple(b,a,c)
    |b > c = orderTuple(a,c,b)
    |a > c = orderTuple(c,b,a)
    |otherwise = (a,b,c)
--b)
rotateQuadruple :: (Int, Int, Int, Int) -> Int -> (Int, Int, Int, Int)
rotateQuadruple (a,b,c,d) n
    |n > 0 = rotateQuadruple(d,a,b,c) (n-1)
    |n == 0 = (a,b,c,d)
    |otherwise = rotateQuadruple(a,b,c,d) (-n)
--c)
calcAddSubMulDiv :: Float -> Float -> (Float, Float, Float, Float)
calcAddSubMulDiv a b = (a+b, a-b, a*b, a/b)

--2.Aufgabe
numOfOccur :: [Int] -> Int -> Int
numOfOccur [] = 0
numOfOccur (x:xs) n = (if x == n then 1 else 0 ) + numOfOccur xs n

isPalin :: [Int] -> Bool
isPalin xs = xs==(reverse xs)
--c)
divisors :: Int -> [Int]
divisors n = [d | d <-[1..n], n `mod` d == 0]

prime :: Int -> Bool
prime n = (divisors n == [1,n]

primeTwin :: Int -> [(Int, Int)]
primeTwin n
    |n == 0 = []
    |prime(n-1) && prime n = primeTwin (n-1) ++ [((n-2),n)]
    |otherwise = primeTwin(n-1)

primeTwin' :: Int -> [(Int, Int)]
primeTwin' n = [(i-2,i) | i <- [3..n], prime(i-2) && prime i]

--d)
splitList :: [(Int,Int)] -> ([Int],[Int])
splitList L = ([a|(a,temp) <- L],[b|(temp,b) <-[])


