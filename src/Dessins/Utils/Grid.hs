module Dessins.Utils.Grid (hor, ver, group) where

import           Diagrams.Prelude
import           Diagrams.Backend.SVG.CmdLine

hor :: [Diagram B] -> Diagram B
hor = hcat' (with & sep .~ 0.5)

ver :: [Diagram B] -> Diagram B
ver = vcat' (with & sep .~ 0.5)

group :: String -> [Diagram B] -> Diagram B
group title ct = ver
  [text title # fontSize (local 0.25) # alignL, hor ct # frame 0.25]
  # frame 0.5