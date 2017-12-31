import Board
import Render
import System.Random

import Text.Blaze.Html.Renderer.String

main = do
  g <- getStdGen
  file <- readFile "input.txt"
  let possibilities = lines file
  let picks = card g possibilities
  writeFile "index.html" (renderHtml (render picks))

