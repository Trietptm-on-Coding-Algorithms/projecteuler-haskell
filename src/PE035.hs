module PE035 (solve035) where

import Data.Maybe (isJust)
import Math.NumberTheory.Primes (isPrime)

circular :: Integer -> Bool
circular = and . fmap (isJust . isPrime) . nums
  where nums n = take (digits n) . nums' $ n
        nums' n = n : nums' (n `div` 10 + (n `mod` 10) * 10 ^ (digits n - 1))
        digits = length . show

solve035 :: String -> Integer
solve035 _ = toInteger . length . filter circular $ [1..999999]
