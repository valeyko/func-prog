module HomeWork21 where

lst367 :: [Integer]
lst367 = 0 : lst367 >>= \x -> map ((+) (10 * x)) [3, 6, 7]

doubleEven :: Integral a => [a] -> [a]
doubleEven = (=<<) $ \x -> if (mod x 2 == 0) then [x, x] else [x]

cartesian :: [a] -> [b] -> [(a, b)]
cartesian xs ys = xs >>= \x -> map ((,) x) ys