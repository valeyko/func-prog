module HomeWork19 where

pascal :: [[Integer]]
pascal = [1] : map (\x -> zipWith (+) (0 : x) (x ++ [0])) pascal