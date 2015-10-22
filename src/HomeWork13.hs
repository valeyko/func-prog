module HomeWork13 where

allLists n 0 = [[]]
allLists n k = [x:xs | x <- [1..n], xs <- allLists n (k - 1)]