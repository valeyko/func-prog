module HomeWork10 where

-- 1
transpose xs | any (\x -> x == []) xs = []
             | otherwise = (map head xs) : transpose (map tail xs)

-- 2
powerset [] = [[]]
powerset (x:xs) = powerset xs ++ map (x:) (powerset xs)