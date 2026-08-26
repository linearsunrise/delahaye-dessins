{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Joligones
  ( figure26
  , figure27
  , figure28
  , figure29
  , figure30
  , figure31
  , figure32
  , figure33
  , figure34
  )
where

import Dessins.Const (getRemSizeDiv)
import Dessins.Types (ConstraintRender, TDiagram)
import Dessins.Utils.Polygon (xAxis, yAxis)
import Dessins.Utils.Scene (squareFrame)

import Data.Bifunctor (Bifunctor (bimap))
import Data.Function ((&))
import Diagrams
  ( Point
  , V2
  , centerXY
  , fromVertices
  , lw
  , p2
  , scaleUToX
  , scaleUToY
  , scaleX
  , strokePath
  , strokeTrail
  , trailFromVertices
  , ultraThin
  , (#)
  )

data FigureParams n = FigureParams
  { vertices :: n
  , rate :: n
  , pointsCount :: n
  , fineAngle :: n
  , phase :: n
  }

renderFigure ::
  forall n b.
  (ConstraintRender n b, Enum n) =>
  FigureParams n -> TDiagram n b
renderFigure params =
  let calcVectors vert =
        let pCount = (params & vertices) + (params & fineAngle)
            rr = (params & rate) ** vert
            t = vert
            phi = -(3 * pi / 4) + (params & phase)
         in (yAxis t pCount phi, xAxis t pCount phi)
              # bimap (rr *) (rr *)
              # p2

      vectors = [0 .. ((params & pointsCount) - 1)]

      figure =
        map calcVectors vectors
          # trailFromVertices
          # strokeTrail
          # lw ultraThin
   in figure

renderPipe ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b -> TDiagram n b
renderPipe v =
  v
    # centerXY
    # scaleUToX (getRemSizeDiv (* 3))
    # squareFrame (getRemSizeDiv (* 4))

figure26 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure26 =
  renderFigure
    FigureParams
      { vertices = 2 * 31 / 15
      , fineAngle = 0
      , rate = 0.98
      , pointsCount = 200
      , phase = 0
      }
    # renderPipe

figure27 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure27 =
  renderFigure
    FigureParams
      { vertices = 2 * 30 / 29
      , fineAngle = 0
      , rate = 0.98
      , pointsCount = 120
      , phase = -(pi / 4)
      }
    # renderPipe

figure28 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure28 =
  renderFigure
    FigureParams
      { vertices = 8
      , fineAngle = 0
      , rate = 0.98
      , pointsCount = 200
      , phase = pi / 8
      }
    # renderPipe

figure29 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure29 =
  renderFigure
    FigureParams
      { vertices = 20
      , fineAngle = 0
      , rate = 0.998
      , pointsCount = 2000
      , phase = pi / 4
      }
    # renderPipe

figure30 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure30 =
  renderFigure
    FigureParams
      { vertices = 2 * 5 / 4
      , fineAngle = 0.02
      , rate = 0.99
      , pointsCount = 200
      , phase = pi / 4
      }
    # renderPipe

figure31 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure31 =
  renderFigure
    FigureParams
      { vertices = 2 * 7 / 6
      , fineAngle = 0.0
      , rate = 0.98
      , pointsCount = 100
      , phase = -(pi / 4)
      }
    # renderPipe

figure32 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure32 =
  renderFigure
    FigureParams
      { vertices = 5 - 0.03
      , fineAngle = 0
      , rate = 0.993
      , pointsCount = 300
      , phase = 0
      }
    # renderPipe

figure33 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure33 =
  renderFigure
    FigureParams
      { vertices = 2 * 60 / 19
      , fineAngle = 0
      , rate = 0.996
      , pointsCount = 400
      , phase = -(pi / 4)
      }
    # scaleX 1.7
    # centerXY
    # scaleUToX (getRemSizeDiv (* 3))
    # squareFrame (getRemSizeDiv (* 4))

chevalData :: (ConstraintRender n b) => TDiagram n b
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
    # getTrailsList

createTrail :: (ConstraintRender n b) => [(n, n)] -> TDiagram n b
createTrail x =
  pointsListToTrail x
    # fromVertices
    # strokePath
    # lw ultraThin

getTrailsList ::
  (ConstraintRender n b) =>
  [[(n, n)]] -> TDiagram n b
getTrailsList =
  mconcat
    . map createTrail

pointsListToTrail :: [(n, n)] -> [Point V2 n]
pointsListToTrail = map p2

figure34 :: (ConstraintRender n b) => TDiagram n b
figure34 =
  chevalData
    # centerXY
    # scaleUToY (getRemSizeDiv (* 3))
    # squareFrame (getRemSizeDiv (* 4))
