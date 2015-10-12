module HomeWork9 where

-- 1
swapSymbols str = map (\c -> if c == '!' then '?' else if c == '?' then '!' else c) str

-- 2
multTable n = multTable' n [] where multTable' n acc = map (\i -> acc ++ (map (\j -> i * j) [1..n])) [1..n]

-- 3
repeatFunc f n | n == 1 = f | otherwise = f . repeatFunc f (n - 1)

-- 4
countOdd xs = foldr (\x acc -> acc + mod x 2) 0 xs
countOdd1 xs = length $ filter (\x -> mod x 2 == 1) xs

-- 5
myfoldl f start [] = start
myfoldl f start (x : xs) = myfoldl f (f start x) xs