module HomeWork9 where

swapSymbols str = map (\c -> if c == '!' then '?' else if c == '?' then '!' else c) str

multTable n = multTable' n []
multTable' n acc = map (\i -> acc ++ (map (\j -> i * j) [1..n])) [1..n]