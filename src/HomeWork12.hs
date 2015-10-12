module HomeWork12 where

-- 1
frame n = [[1 | _ <- [1..n]]] ++ [1 : [0 | _ <- [3..n]] ++ [1] | _ <- [3..n]] ++ [[1 | _ <- [1..n]]]

-- 2
data Tree = Empty | Node Int Tree Tree
foldTree f start Empty = start
foldTree f start (Node value l r) = foldTree f left r where left = foldTree f (f start value) l

-- 3
data Scheme = Resistance Float | ConsistentResistance Float Float | ParallelResistance Float Float
totalResistance (Resistance r) = r
totalResistance (ConsistentResistance r1 r2) = r1 + r2
totalResistance (ParallelResistance r1 r2) = 1 / (1 / r1 + 1 / r2)

-- 4
coins n = [[x, y, z] | x <- [0..div n 2], y <- [0..div n 3], z <- [0..div n 5], 2 * x + 3 * y + 5 * z == n]