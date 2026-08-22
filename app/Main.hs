module Main (main) where

import           Diagrams.Backend.SVG.CmdLine
import           Diagrams.Prelude hiding (polygon)
import           Dessins.Figures
import           Dessins.Utils

scene :: Diagram B
scene = ver [polygonesReguliers, etoilesRegulieres]

main :: IO ()
main = mainWith scene