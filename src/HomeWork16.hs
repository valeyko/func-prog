module HomeWork16 where

-- 1
cantor = [(x, y - x) | y <- [2..], x <- [1..y-1]]

-- 2
generalizedCantor 2 = [[x, y - x] | y <- [2..], x <- [1..y-1]]
generalizedCantor n = [generalizedCantor 2 !! (x - 1) ++ xs | (x:xs) <- generalizedCantor (n - 1)]