module Main where

import Cards
import System.Random.Shuffle
import Data.List

main :: IO()
main = do
  shuffled <- shuffleM allCards
  print . sort . take 5 $ shuffled
