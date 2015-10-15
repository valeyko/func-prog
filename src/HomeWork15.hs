module HomeWork15 where

-- 1
sumDiv n = divs n 2
perfects n | n == 1 = []
           | otherwise = if (sumDiv n == n) then n : perfects (n - 1) else perfects (n - 1)
divs n i | i > d = 1
         | otherwise = if (mod n i == 0) then i + divs n (i + 1) else divs n (i + 1)
         where d = div n 2

-- 2
amicables n | (n == 1) = []
            | otherwise = [(a, b) | a <- [1..n], let b = sumDiv a, a == sumDiv b, a < b]

-- 3
data Tree = Empty | Node Int Tree Tree
foldTree f e (Node val l r) = f val resl resr
                              where resl = foldTree f e l
                                    resr = foldTree f e r
foldTree f e Empty = e
sumSqr = foldTree (\v l r -> v ^ 2 + l + r) 0

-- 4
data Scheme a = P (Scheme a) (Scheme a) | S (Scheme a) (Scheme a) | R a

-- 5
ones = [ones' i | i <- [1..]]
ones' n | n == 1 = 1
        | otherwise = ones' (n - 1) * 10 + 1