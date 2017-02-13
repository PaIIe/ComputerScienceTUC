data FloatExpr = Val FLoat
               | Add FLoatExpr FLoatExpr
               | Mull FloatExpr FloatExpr
               | Sqrt FloatExpr
               | Abs FloatExpr
               
numOps :: FloatExpr -> Int
numOps (Val _) = 0
numOps (Add x y) = 1 + (numOps x) + (numOps y)
numOps (Mull x y) = 1 + (numOps x) + (numOps y)
numOps (Sqrt x) = 1 + (numOps x)
numOps (Abs x) = 1 + (numOps x)

numVals :: FloatExpr -> Int
numVals (Val _) = 1
numVals (Add x y) = (numVals x ) + (numVals y)
numvals (Mull x y) = (numVals x) + (numVals y)
numVals (Sqrt x) = (numVals x)
numVals (Abs x) = (numVals x)

evalExpr :: FloatExpr -> Float
evalExpr Val x = x
evalExpr Add x y = (evalExpr x) + (evalExpr y)
evalExpr Mull x y = (evalExpr x) * (evalExpr y)
evalExpr Sqrt x = sqrt (evalExpr x)
evalExpr Abs x = abs(evalExpr x)

showExpr :: FloatExpr -> String
showExpr Val x = show x
showExpr Add x y = "(" ++ (showExpr x) ++ "+" ++ (showExpr y) ++ ")"
showExpr Mull x y = "(" ++ (showExpr x) ++ "*" ++ (showExpr y) ++ ")"
showExpr Sqrt x = "sqrt(" ++ (showExpr x) ++")"
showExpr Abs x = "|" ++ (showExpr x) ++ "|"
