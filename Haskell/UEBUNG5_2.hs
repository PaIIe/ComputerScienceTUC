data GenTree a = Leaf a 
               | Branch [GenTree a]

--b)
treeCount :: GenTree a -> (a->Bool) -> Int
treeCount (Leaf x) p = if p x then 1 else 0
treeCount (Branch []) p = 0
treeCount (Branch (x:xs)) p = treeCount x p + treeCount (Branch xs) p

--c)
treeList :: GenTree a -> [a]
treeList (Leaf x) = [x]
treeList (Branch []) = []
treeList (Branch (x:xs)) = treeList ++ treeList (Branch xs)

--d)
treeDepth :: GenTree a -> Int
treeDepth (Leaf x) = 1
treeDepth (Branch []) = 0
treeDepth (Branch xs) = 1 + (foldl max 0 . map treeDepth) xs

