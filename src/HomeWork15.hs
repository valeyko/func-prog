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
foldScheme r s p (R a) = r a
foldScheme r s p (S s1 s2) = s (foldScheme r s p s1) (foldScheme r s p s2)
foldScheme r s p (P s1 s2) = p (foldScheme r s p s1) (foldScheme r s p s2)

totalResistance = foldScheme id (+) (\r1 r2 -> 1 / (1 / r1 + 1 / r2))
numberOfResistors = foldScheme (const 1) (+) (+)

-- 5
ones = ones' 1
ones' x | x == 0 = []
        | otherwise = x : ones' (10 * x + 1)