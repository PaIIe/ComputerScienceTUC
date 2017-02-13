--4. Aufgabe a)
f x :: b -> c

--b)
g (f x):: a
--c)
g.f :: a -> a

(g.f) x :: a
f.g :: (b-> c) -> b -> c
(f.g) (f x) y :: c 
