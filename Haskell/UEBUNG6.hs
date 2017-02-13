class Visible a where
    toString :: a->String
    size :: a->Int
    
instance Visible Char where
    toString c = [c]
    size _ = 1

instance Visible Bool where
    toString True = "True"
    toString False = "False"
    size _ = 1

instance Visible a => Visible [a] where
    toString = concat . (map toString)
    size = (foldr (+) 0) . (map size)
    
--a)
instance (Visible a, Visible b) => Visible (a,b) where
    toString (x,y) = "(" ++ toString x ++ "," ++ toString y ++ ")"
    size (x,y) = size x + size y
    
--b)
data Tree a = Leaf a | Branch (Tree a) (Tree a)

instance Visible a => Visible (Tree a) where
    toString (Leaf x) = toString x
    toString (Branch l r) = "[" ++ toString l ++ "-+-" ++ toString r ++"]"
    size (Leaf x) = size x
    size (Branch l r) = size l + size r

--Aufgabe 3
--a)
--Idee: Erstes Element Ausgeben und auf Prefixsum der Restliste addieren
preFixSum :: [Int] -> [Int]
preFixSum [] = []
preFixSum (x:xs) = x:(map (x+) (preFixSum xs))

