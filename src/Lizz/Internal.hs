module Lizz.Internal where

import Data.List (intercalate)
import Lizz.Format (increaseIndent)

data Lizz' = Lizz' String [Lizz']
type Lizz = [Lizz']

instance Show Lizz' where
  show (Lizz' x xs) = unlines' (x:xs')
    where
      unlines' = intercalate "\n"
      indentR = unlines' . increaseIndent . lines
      xs' = indentR . show <$> xs
