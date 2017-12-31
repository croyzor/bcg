module Board (Card, card) where

import Debug.Trace
import Data.List
import System.Random
import Control.Monad.State.Lazy

type Card = [[String]]

-- Remove the specified index from
-- the list and return them both
pop :: (Eq a) => Int -> State [a] a
pop n = do
    x <- gets (!!n)
    modify (delete x)
    return x

-- Take n random elements from a list
pick :: (Eq a) => Int -> StdGen -> [a] -> [a]
pick 0 _ _  = []
pick i g xs = 
  let (n, g') = randomR (0, length xs - 1) g in
    let (y, ys) = runState (pop n) xs in
      y : pick (i-1) g' ys

-- Selections into rows of 5
groupRows :: [String] -> Card
groupRows xs = aux 5 xs
  where
  aux 0 xs = []
  aux n xs = take 5 xs : aux (n-1) (drop 5 xs)

card :: StdGen -> [String] -> Card
card g ps = groupRows $ pick 25 g ps
