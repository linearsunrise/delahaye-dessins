module Main (main) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Figures
  ( composition1
  , composition2
  , etoilesRegulieres
  , polygonesReguliers
  )
import Dessins.Utils.Grid (ver)

import Diagrams.Backend.SVG.CmdLine (B, mainWith)
import Diagrams.Prelude (Diagram, frame, (#))

scene :: Diagram B
scene =
  ver
    (getRemSizeDiv (/ 2))
    [polygonesReguliers, etoilesRegulieres, composition1, composition2]
    # frame (getRemSizeDiv (/ 2))

main :: IO ()
main = mainWith scene
