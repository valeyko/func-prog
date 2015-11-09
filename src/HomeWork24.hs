module HomeWork24 where

-- 1
data Rect = Rect Double Double Double Double
data Circle = Circle Double Double Double

class Shape a where
    area :: a -> Double
    perim :: a -> Double
    contains :: a -> Double -> Double -> Bool

instance Shape Rect where
    area (Rect a b _ _) = a * b
    perim (Rect a b _ _) = 2 * (a + b)
    contains (Rect a b x0 y0) x y = (abs (x - x0) <= a / 2 && abs (y - y0) <= b / 2)
instance Shape Circle where
    area (Circle r _ _) = pi * r * r
    perim (Circle r _ _) = 2 * pi * r
    contains (Circle r x0 y0) x y = (x - x0) ^ 2 + (y - y0) ^ 2 <= r ^ 2

-- 2
data Ration = Rat Integer Integer

instance Eq Ration where
    (Rat a1 b1) == (Rat a2 b2) = a1 * b2 == a2 * b1
instance Ord Ration where
    (Rat a1 b1) < (Rat a2 b2) = if b1 * b2 > 0 then a1 * b2 < a2 * b1 else a1 * b2 > a2 * b1
instance Num Ration where
    (Rat a1 b1) + (Rat a2 b2) = Rat (a1 * b2 + a2 * b1) (b1 * b2)
instance Show Ration where
    show (Rat a b) = show a ++ "/" ++ show b

-- 3
checkNoSquares :: [Int] -> Bool
checkNoSquares xs = let xs2 = map (^2) xs in not $ any (\x -> if x == 0 || x == 1 then False else elem x xs2) xs

-- 4
triangle :: Int -> [Int]
triangle n = do
    x <- [1..n]
    y <- [1..x]
    return $ 10 * x + y

-- 5
findSame :: Eq a => [a] -> Maybe a
findSame [] = Nothing
findSame (x:xs) = if elem x xs then Just x else findSame xs

findSame1 :: Eq a => [a] -> Either String a
findSame1 [] = Left "Not found"
findSame1 (x:xs) = if elem x xs then Right x else findSame1 xs