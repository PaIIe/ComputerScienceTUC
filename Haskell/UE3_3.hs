--3.Uebung 3. Aufgabe

sumNorm :: [Float] -> Float
sumNorm [] = 0
sumNorm (x:xs) = abs(x) + sumNorm xs

test :: [Int] -> [Int]
test [] = []

test (x:xs) = if length(xs) > 2 then test xs
                         else test [x]

--b)
mergeTwo :: [Int] -> [Int] -> [Int]
mergeTwo [] ys = ys
mergeTwo xs [] = xs
mergeTwo (x:xs) (y:ys) = if x < y then x:(mergeTwo xs (y:ys))
                                  else y:(mergeTwo (x:xs) ys)

mergeSort :: [Int] -> [Int]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = mergeTwo ( mergeSort (take ((length xs) `div` 2) xs))
                        (mergeSort (drop ((length xs) `div` 2) xs))
                        
--c
nor3 :: Bool -> Bool -> Bool -> Bool
nor3 a b c
    |a == True = False
    |b == True = False
    |c == True = False
    |otherwise = True
    
nor3' :: Bool -> Bool -> Bool -> Bool
nor3' True _ _ = False
nor3' _ True _ = False
nor3' _ _ True = False
nor3' _ _ _ = True
