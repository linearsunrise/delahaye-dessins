-- Same abstract demo as Example.hs, rendered through the SVG backend
-- instead of Rasterific. Only the import and the `B` type differ.
module Main (main) where

import Diagrams.Backend.SVG.CmdLine
import Diagrams.Prelude

doodle :: Diagram B
doodle =
  hcat' (with & sep .~ 0.5)
    [ circle 1 # fc red # lw none
    , square 1.5 # fc lightblue # lw thin # rotateBy (1 / 8)
    , triangle 1.5 # fc palegreen # lw thin
    ]
    # frame 0.5

main :: IO ()
main = mainWith doodle
