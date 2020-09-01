module Lizz.Format where

increaseIndent :: [String] -> [String]
increaseIndent = map ("  " ++)

decreaseIndent :: [String] -> [String]
decreaseIndent = map (drop 2)
