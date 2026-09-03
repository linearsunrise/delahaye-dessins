{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Lion.Common where

import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import qualified Diagrams as D
import Diagrams.Prelude as DP

lionData :: (RealFloat n) => [[(n, n)]]
lionData =
  [ [ (5, 5)
    , (5, 3)
    , (6, 0.5)
    , (6.5, 1)
    , (5.5, 3)
    , (5.5, 5)
    , (5.5, 3)
    , (6.5, 1)
    , (7.5, 2)
    , (6, 3)
    , (6, 5)
    , (6, 3)
    , (7.5, 2)
    , (7.5, 3)
    , (6.5, 4)
    , (6.5, 5)
    , (10.5, 5)
    , (9.5, 3)
    , (10, 2)
    , (11, 2)
    , (11, 2.5)
    , (11, 2)
    , (10, 2)
    , (10.5, 1)
    , (12.5, 0)
    , (14.5, 1)
    , (14.5, 2)
    , (13.5, 2.5)
    , (14.5, 2)
    , (15, 2)
    , (14.5, 2)
    , (14.5, 1.5)
    , (14, 1.5)
    , (13, 1)
    , (12.5, 1)
    , (12.5, 0.5)
    , (13, 0.5)
    , (13, 1)
    , (14, 1.5)
    , (14.5, 1.5)
    , (14.5, 1)
    , (15.5, 3)
    , (14.5, 3)
    , (12.5, 3.5)
    , (11.5, 3.5)
    , (12.5, 3.5)
    , (14.5, 3)
    , (13.5, 4)
    , (14.5, 6)
    , (15.5, 7)
    , (16.5, 12)
    , (17.5, 12)
    , (18.5, 13)
    , (18.5, 14)
    , (14.5, 14)
    , (14.5, 12)
    , (13.5, 9)
    , (14, 8)
    , (13.5, 9)
    , (11.5, 11)
    , (11.5, 12)
    , (12.5, 13)
    , (12.5, 14)
    , (8.5, 14)
    , (9.5, 12)
    , (10.5, 8)
    , (9.5, 12)
    , (8.5, 10)
    , (10, 10.5)
    , (8.5, 10)
    , (6.5, 9)
    , (7.5, 7)
    , (6.5, 6)
    , (7.5, 7)
    , (6.5, 9)
    , (4.5, 10)
    , (3.5, 12)
    , (4.5, 12)
    , (5.5, 13)
    , (5, 14)
    , (0, 14)
    , (0.5, 13)
    , (1.5, 12)
    , (2.5, 7)
    , (3.5, 7)
    , (4.5, 6)
    , (4.5, 3)
    , (5.5, 0)
    , (6, 0.5)
    , (5, 3)
    , (5, 5)
    ]
      # map
        ( U.flipY
            . U.translate -- находим origin для симметрии
              ( -((lionWidth + 0.5) / 2)
              , -((lionHeight + 5) / 2)
              )
        )
  ]

lionWidth :: (RealFloat n) => n
lionWidth = 18.5

lionHeight :: (RealFloat n) => n
lionHeight = 14

createPath :: (T.Render n b) => [(n, n)] -> T.TDiagram n b
createPath x =
  pointsListToTrail x
    # D.fromVertices
    # D.strokePath
    # D.fillRule D.EvenOdd
    # D.lw (D.global 0.045)
    # D.lineJoin D.LineJoinBevel

getTrailsList ::
  (T.Render n b) =>
  [[(n, n)]] -> T.TDiagram n b
getTrailsList =
  mconcat
    . map createPath

pointsListToTrail :: [(n, n)] -> [D.Point D.V2 n]
pointsListToTrail = map D.p2
