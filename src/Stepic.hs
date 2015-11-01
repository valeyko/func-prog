module Stepic where

data Point3D a = Point3D a a a deriving Show
instance Functor Point3D where
    fmap f (Point3D a b c) = (Point3D (f a) (f b) (f c))

data GeomPrimitive a = Point (Point3D a) | LineSegment (Point3D a) (Point3D a)

instance Functor GeomPrimitive where
    fmap f (Point p) = Point $ fmap f p
    fmap f (LineSegment p1 p2) = LineSegment (fmap f p1) (fmap f p2)

data Tree a = Leaf (Maybe a) | Branch (Tree a) (Maybe a) (Tree a) deriving Show
instance Functor Tree where
    fmap f (Leaf a) = Leaf (fmap f a)
    fmap f (Branch l a r) = Branch (fmap f l) (fmap f a) (fmap f r)

data Entry k1 k2 v = Entry (k1, k2) v deriving Show
data Map k1 k2 v = Map [Entry k1 k2 v] deriving Show

instance Functor (Entry k1 k2) where
    fmap f (Entry (k1, k2) v) = Entry (k1, k2) (f v)

instance Functor (Map k1 k2) where
    fmap f (Map xs) = Map (map (fmap f) xs)

data Log a = Log [String] a deriving Show

toLogger :: (a -> b) -> String -> (a -> Log b)
toLogger f m = \x -> Log [m] (f x)

getMessage :: Log a -> [String]
getMessage (Log m _) = m

getResult :: Log a -> a
getResult (Log _ a) = a

execLoggers :: a -> (a -> Log b) -> (b -> Log c) -> Log c
execLoggers a f g = Log (getMessage l1 ++ getMessage l2) (getResult l2)
    where l1 = f a
          l2 = g $ getResult l1

bindLog :: Log a -> (a -> Log b) -> Log b
bindLog l f = Log (getMessage l ++ getMessage fl) (getResult fl)
    where fl = f $ getResult l

returnLog :: a -> Log a
returnLog a = Log [] a

execLoggersList :: a -> [a -> Log a] -> Log a
execLoggersList a [] = returnLog a
execLoggersList a (x:xs) = x a `bindLog` (\a -> execLoggersList a xs)