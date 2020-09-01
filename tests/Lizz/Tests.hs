module Lizz.Tests where

import Distribution.TestSuite
import Lizz.Parser

input :: IO String
input = readFile "tests/Lizz/input.txt"

parsing' :: IO Progress
parsing' = do
  i <- input
  let l = fromString i
  return $ if i == unlines (map show l)
    then Finished Pass
    else Finished
      (Fail "input == encode(decode(input))")

parsing :: TestInstance
parsing = TestInstance
  { run = parsing'
  , name = "parsing"
  , tags = []
  , options = []
  , setOption = \_ _ -> Right parsing
  }

tests :: IO [Test]
tests = return [Test parsing]
