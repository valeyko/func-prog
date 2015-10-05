module HomeWork9 where

swapSymbols str = map (\c -> if c == '!' then '?' else if c == '?' then '!' else c) str

multTable n = multTable' n [] where multTable' n acc = map (\i -> acc ++ (map (\j -> i * j) [1..n])) [1..n]

repeatFunc f n | n == 1 = f | otherwise = f . repeatFunc f (n - 1)

countOdd xs = foldr (\x acc -> acc + mod x 2) 0 xs
countOdd1 xs = length $ filter (\x -> mod x 2 == 1) xs

myfoldl f start [] = start
myfoldl f start (x : xs) = myfoldl f (f start x) xs