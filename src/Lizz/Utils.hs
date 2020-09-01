module Lizz.Utils where

import Prelude hiding (map)
import Lizz.Internal

flatten :: Int -> Lizz -> Lizz
flatten _ [] = []
flatten 0 xs = xs
flatten n (Lizz' x xs : ys) = l ++ flatten n ys
  where
    l = Lizz' x [] : flatten (n - 1) xs

map :: (String -> String) -> Lizz -> Lizz
map _ [] = []
map f (Lizz' x xs : ys) = l : map f ys
  where l = Lizz' (f x) $ map f xs
