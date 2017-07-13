module PE072 (solve072) where

import Data.List (group)
import Data.MemoCombinators (integral)
import Data.Numbers.Primes (primeFactors)

-- we are counting terms in farey sequences
-- most notably, |F_n| = |F_{n - 1}| + phi(n), where F_1 = 0, so
-- |F_n| = \sum_{i = 1}^n phi(i) - 1
-- Define |G_n| to be |F_n| + 1, and we obtain (through M\"{o}bius inversion)
-- the formula
-- |G_n| = n(n + 3)/2 - \sum_{d = 2}^n |G_{n/d}|

phi :: Integer -> Integer
phi n = (n * product (pred <$> pfn)) `div` product pfn
  where pf = fmap head . group . primeFactors
        pfn = pf n

solve072 :: String -> Integer
solve072 _ = farey 1000000
  where farey = pred . pred . garey
        garey = integral garey'
        garey' n = (n * (n + 3)) `div` 2 - sum [garey (n `div` d) | d <- [2..n]]

solve072' :: String -> Integer
solve072' _ = sum (phi <$> [1..1000000])
