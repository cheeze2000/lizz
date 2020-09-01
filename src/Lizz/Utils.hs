module Lizz.Utils where

import Prelude hiding (map)
import Lizz.Internal

map :: (String -> String) -> Lizz -> Lizz
map _ [] = []
map f (Lizz' x xs : ys) = l : map f ys
  where l = Lizz' (f x) $ map f xs
