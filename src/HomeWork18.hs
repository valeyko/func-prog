module HomeWork18 where

-- 1
approxSum (x:xs) | abs x > 0.000001 = x + approxSum xs
                 | otherwise = 0
z = approxSum [1 / (i*i) | i <- [1..]]

-- 2
checkWeekends (x1:x2:x3:x4:x5:x6:x7:xs) = if (x6 <= 1 && x7 <= 1) then checkWeekends xs else False
checkWeekends xs = True

-- 3
brackets = ["[]"] ++ ['[' : x ++ "]" | x <- brackets]

-- 4
superMap f [] = []
superMap f (x:xs) = f x ++ superMap f xs