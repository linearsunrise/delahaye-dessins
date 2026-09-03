{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Common where

import qualified Dessins.Const as Const
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import Diagrams ((#))
import qualified Diagrams as D
import qualified Diagrams.Prelude as DP

chevalData :: (RealFloat n) => [[(n, n)]]
chevalData =
  [ [(10, 10), (8, 12), (9, 16), (12, 17), (13, 18), (14, 20)]
  ,
    [ (13, 18)
    , (12, 19)
    , (9, 21)
    , (9, 20)
    , (10, 19)
    , (9, 17)
    , (7, 20)
    , (8, 22)
    , (12, 22)
    ]
  , [(12, 20), (12, 22), (13, 26), (16, 31), (18, 31), (19, 32)]
  , [(16, 31), (14, 31), (14, 32)]
  ,
    [ (14, 31)
    , (10, 30)
    , (12, 31)
    , (10, 32)
    , (10, 34)
    , (11, 34)
    , (11, 33)
    , (10, 33)
    ]
  , [(12, 32), (13, 31)]
  , [(10, 34), (16, 36)]
  , [(16, 35), (16, 37), (18, 35), (17, 34)]
  , [(17, 36), (20, 36), (22, 32), (19, 26)]
  ,
    [ (20, 36)
    , (22, 36)
    , (22, 34)
    , (24, 32)
    , (24, 30)
    , (19, 26)
    , (18, 23)
    , (21, 22)
    , (21, 24)
    , (30, 30)
    , (34, 31)
    , (36, 31)
    , (33, 26)
    , (32, 22)
    , (28, 22)
    , (27, 20)
    , (29, 17)
    , (30, 19)
    , (29, 20)
    , (29, 21)
    , (32, 19)
    , (33, 18)
    , (32, 17)
    , (29, 16)
    , (28, 12)
    , (30, 10)
    , (21, 4)
    , (21, 2)
    , (18, 3)
    , (19, 6)
    , (24, 10)
    , (24, 12)
    , (22, 14)
    , (22, 16)
    , (23, 17)
    ]
  , [(22, 16), (17, 16), (16, 17), (17, 18)]
  , [(16, 17), (16, 16), (10, 14), (10, 12), (12, 11), (10, 10)]
  , [(21, 21), (22, 24), (30, 30)]
  , [(24, 24), (34, 28)]
  , [(25, 23), (33, 26)]
  , [(25, 21), (27, 20)]
  , [(23, 21), (24, 19)]
  , [(27, 20), (22, 19), (22, 21)]
  , [(22, 19), (21, 20)]
  , [(13, 34), (15, 35), (16, 34), (16, 33)]
  , [(15, 35), (15, 34), (16, 34), (15, 34), (15, 35)]
  , [(24, 12), (26, 10), (19, 5), (19, 3)]
  , [(28, 22), (25, 22)]
  ]

createPath :: (T.Render n b) => [(n, n)] -> T.TDiagram n b
createPath x =
  pointsListToTrail x
    # D.fromVertices
    # D.strokePath
    # D.lw (D.global 0.045)
    # D.fc DP.red
    # D.lineJoin D.LineJoinBevel

getTrailsList ::
  (T.Render n b) =>
  [[(n, n)]] -> T.TDiagram n b
getTrailsList =
  mconcat
    . map createPath

pointsListToTrail :: [(n, n)] -> [D.Point D.V2 n]
pointsListToTrail = map D.p2
