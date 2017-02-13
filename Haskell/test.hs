--test:
square :: Int->Int
square x = x * x

numOddEvenSquares :: Int -> (Int,Int)
numOddEvenSquares n = (length (filter odd candidates), 
                       length (filter even candidates))
    where candidates = [x^2 | x <- [1..(div n 2)], x^2 <= n]
          

numOddEvenSquares' :: Int -> (Int,Int)
numOddEvenSquares' n = (length (filter odd candidates), 
                        sum (map isEven01 candidates)) 
    where candidates = [x^2 | x <- [1..(div n 2)], x^2 <= n]
          isEven01 x = (if even x then 1 else 0)
      
