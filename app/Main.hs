module Main (main) where

import qualified Dessins.Const as Const
import qualified Dessins.Figures as Compositions
import qualified Dessins.Utils.Grid as U

import qualified Diagrams.Backend.SVG.CmdLine as SVG (B, mainWith)
import qualified Diagrams.Prelude as DP (Diagram, frame, (#))

scene :: DP.Diagram SVG.B
scene =
  U.ver
    (Const.getRemSizeDiv (/ 2))
    [ Compositions.polygonesReguliers
    , Compositions.etoilesRegulieres
    , Compositions.composition1
    , Compositions.composition2
    , Compositions.joligones
    , Compositions.cheval
    , Compositions.lion
    , Compositions.oiseauxPoissons
    ]
    DP.# DP.frame (Const.getRemSizeDiv (/ 2))

main :: IO ()
main = SVG.mainWith scene
