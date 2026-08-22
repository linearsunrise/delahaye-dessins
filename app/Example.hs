-- Abstract demo of the diagrams-lib workflow, not a solution to any
-- task from the book. Copy this file's shape (imports + `main`) when
-- starting a new task.
module Main (main) where

import Diagrams.Backend.Rasterific.CmdLine
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
