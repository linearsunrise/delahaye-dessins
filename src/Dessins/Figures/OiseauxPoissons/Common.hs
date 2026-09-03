{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.OiseauxPoissons.Common where

import Dessins.Const (getRemSizeDiv)
import qualified Dessins.Types as T
import qualified Dessins.Utils as D
import qualified Dessins.Utils as U

import qualified Diagrams as D
import Diagrams.Prelude as DP (Bifunctor (bimap), (#))

lionData :: (RealFloat n) => [[(n, n)]]
lionData =
  [ [ (11, 5)
    , (9, 6)
    , (7, 6)
    , (3, 4)
    , (2, 4)
    , (2.7, 3.3)
    , (2.7, 3.2)
    , (3, 3.2)
    , (3, 3.5)
    , (2.7, 3.5)
    , (2.7, 3.2)
    , (2.8, 3.2)
    , (3, 3)
    , (4, 3)
    , (5, 4)
    , (6, 4)
    , (5, 3)
    , (6, 1)
    , (9, 0)
    , (9, 1)
    , (7, 2)
    , (7, 4)
    , (7, 2)
    , (11, 0)
    , (11, 1)
    , (9, 3)
    , (10, 4)
    , (11, 4)
    , (11, 5)
    , (10, 7)
    , (11, 8)
    , (10, 8)
    , (9, 7)
    , (8, 7)
    , (7, 8)
    , (5, 9)
    , (5, 8)
    , (2, 9)
    , (2, 8)
    , (1, 8)
    , (0, 7)
    , (1, 7)
    , (0, 7)
    , (1.5, 5.5)
    , (2, 5.5)
    , (2, 6)
    , (1.5, 6)
    , (1.5, 5.5)
    , (2, 5)
    , (3, 7)
    , (4, 6)
    , (4, 7)
    , (3, 7)
    , (2, 8)
    , (7, 8)
    , (2, 8)
    , (3, 7)
    , (2, 5)
    , (5, 5)
    , (2, 5)
    , (2, 4)
    , (3, 4)
    , (7, 6)
    , (9, 6)
    , (11, 5)
    ]
      # map
        ( U.translate -- находим origin для симметрии
            ( -((fishBirdWidth + 2.5) / 2)
            , -((fishBirdHeight + 1.5) / 2)
            )
            . U.flipY
        )
  ]

fishBirdWidth :: (RealFloat n) => n
fishBirdWidth = 11

fishBirdHeight :: (RealFloat n) => n
fishBirdHeight = 9

createPath :: (T.Render n b) => [(n, n)] -> T.TDiagram n b
createPath x =
  getPointsList x
    # D.fromVertices
    # D.strokePath
    # D.fillRule D.EvenOdd
    # D.lw (D.global 0.045)
    # D.lineJoin D.LineJoinBevel

getPathsList ::
  (T.Render n b) =>
  [[(n, n)]] -> T.TDiagram n b
getPathsList =
  mconcat
    . map createPath

getPointsList :: [(n, n)] -> [D.Point D.V2 n]
getPointsList = map D.p2
