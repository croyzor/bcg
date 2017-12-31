module Render where

import Board (Card)
import Control.Monad (forM_)
import Text.Blaze.Html5

render :: Card -> Html
render c = html $ do
  h1    $ toHtml "Bingo Card Generator"
  table $ forM_ [ forM_ row (td.toHtml) | row <- c ] tr
