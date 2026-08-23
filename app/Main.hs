module Main (main) where

import           Diagrams.Backend.SVG.CmdLine
import           Diagrams.Prelude hiding (polygon)
import           Dessins.Figures
import           Dessins.Utils
import           Dessins.Const (getRemSizeDiv)

scene :: Diagram B
scene = ver (getRemSizeDiv (/ 2)) [polygonesReguliers, etoilesRegulieres]
  # frame (getRemSizeDiv (/ 2))

main :: IO ()
main = mainWith scene