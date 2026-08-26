{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Cheval (figure34, figure35) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Types (ConstraintRender, TDiagram)
import Dessins.Utils.Polygon (xAxis, yAxis)
import Dessins.Utils.Scene (squareFrame)

import Diagrams
  ( P2
  , Point
  , V2
  , centerXY
  , fromVertices
  , lw
  , p2
  , scale
  , scaleUToY
  , strokePath
  , ultraThin
  , (#), fillColor, fc
  )
import Diagrams.Prelude (Bifunctor (bimap), white, red)

-- chevalData :: (ConstraintRender n b) => TDiagram n b
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

createPath :: (ConstraintRender n b) => [(n, n)] -> TDiagram n b
createPath x =
  pointsListToTrail x
    # fromVertices
    # strokePath
    # lw ultraThin
    # fc red

getTrailsList ::
  (ConstraintRender n b) =>
  [[(n, n)]] -> TDiagram n b
getTrailsList =
  mconcat
    . map createPath

pointsListToTrail :: [(n, n)] -> [Point V2 n]
pointsListToTrail = map p2

figure34 :: (ConstraintRender n b) => TDiagram n b
figure34 =
  chevalData
    # getTrailsList
    # centerXY
    # scaleUToY (getRemSizeDiv (* 3))
    # squareFrame (getRemSizeDiv (* 4))

figure35 :: (ConstraintRender n b) => TDiagram n b
figure35 =
  let vertices = 6
      phi = 0

      divider :: (Num a) => a
      divider = 12

      warp :: (RealFloat a) => (a, a) -> (a, a) -> (a, a)
      warp (x1, y1) (x2, y2) =
        (co * x - si * y, si * x + co * y)
          # bimap add add
        where
          (x, y)   = (x1 / divider, y1 / divider)
          (co, si) = (x2, y2)
          add      = (+ 0)


      chevals = mconcat [f x | x <- [0 .. (vertices - 1)]]
        where
          ax fn i = fn (2 * i * pi / vertices + phi)
          f t =
            ( ax cos t
            , ax sin t
            ) # \point -> map (map (warp point)) chevalData

   in chevals
        # getTrailsList
        # centerXY
        # scaleUToY (getRemSizeDiv (* 3))
        # squareFrame (getRemSizeDiv (* 4))

bonus :: (ConstraintRender n b) => TDiagram n b
bonus =
  let vertices = 6
      phi = 0

      warp :: (RealFloat a) => (a, a) -> (a, a) -> (a, a)
      warp (x1, y1) (x2, y2) =
        (co * x - si * y, si * x - co * y)
          # bimap add add
        where
          (x, y) = (x2, y2)
          (co, si) = (x1, y1)
          add = (+ 0.5)

      chevals = mconcat [f x | x <- [0 .. (vertices - 1)]]
        where
          f t =
            (xAxis (t / vertices) vertices phi, yAxis (t / vertices) vertices phi)
              # \point -> map (map (warp point)) chevalData
   in chevals
        # getTrailsList
        # centerXY
        # scaleUToY (getRemSizeDiv (* 3))
        # squareFrame (getRemSizeDiv (* 4))
