module Lizz.Parser where

import Data.List (isPrefixOf)
import Lizz.Format (decreaseIndent)
import Lizz.Internal

fromStrings :: [String] -> Lizz
fromStrings [] = []
fromStrings (x:xs) = Lizz' x ys' : fromStrings zs
  where
    (ys, zs) = break ("*" `isPrefixOf`) xs
    ys' = fromStrings $ decreaseIndent ys

fromString :: String -> Lizz
fromString = fromStrings . lines

toString :: Lizz -> String
toString = unlines . map show
