--febonacci 
calcFibonacci::Int->Int

calcFibonacci i
    |i == 0 = 0
    |i == 1 = 1
    |i > 1 = calcFibonacci(i-1) + calcFibonacci(i-2)


--Kreiszahl Pi

calcPi2 :: Int->Float
calcPi2 n
    |n == 0 = 1
    |otherwise = (-1)^n / fromIntegral((2*n + 1)) + calcPi2(n-1)
    

calcPi :: Float
calcPi = 4*(calcPi2 100000)

--größter Gemeinsamer Teiler
ggT:: Int->Int->Int
ggT a b
    |a>b = ggT(a-b) b
    |a<b = ggT(b-a) a
    |otherwise = a
--Aufgabe 2
threeEquel :: Int->Int->Int->Bool
threeEquel a b c
    |a == b && b == c = Bool
    |otherwise = false
fourEquel :: Int->Int->Int->Int->Bool
fourEquel a b c d
    |c == d && threeEquel(a b c)
    |otherwise false
--Aufgabe 3
middleOfThree Float->Float->Float->Float
middleOfThree a b c
    |c <= a && a <= b || b <= a && a <= c = a
    |a <= b && b <= c || c <= b && b <= a = b
    |otherwise c









































































