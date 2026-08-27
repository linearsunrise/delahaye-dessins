{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval
  ( figure34
  , figure35
  , figure36
  , figure37
  , figure38
  , figure39
  , figure40
  , bonus
  ) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Types (ConstraintRender, TDiagram)
import Dessins.Utils.Polygon (xAxis, yAxis)
import Dessins.Utils.Scene (squareFrame)

import qualified Dessins.Utils as U

import Diagrams ((#))

import qualified Diagrams as D
import Diagrams.Prelude as DP (Bifunctor (bimap), red)

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
    # D.fromVertices
    # D.strokePath
    # D.lw D.ultraThin
    # D.fc DP.red

getTrailsList ::
  (ConstraintRender n b) =>
  [[(n, n)]] -> TDiagram n b
getTrailsList =
  mconcat
    . map createPath

pointsListToTrail :: [(n, n)] -> [D.Point D.V2 n]
pointsListToTrail = map D.p2

figure34 :: (ConstraintRender n b) => TDiagram n b
figure34 =
  chevalData
    # getTrailsList
    # D.centerXY
    # D.scaleUToY (getRemSizeDiv (* 3))
    # squareFrame (getRemSizeDiv (* 4))

figure35 :: (ConstraintRender n b) => TDiagram n b
figure35 =
  let vertices = 6
      phi = pi / 12

      divideBy = 90

      chevals = mconcat [f x | x <- [0 .. (vertices - 1)]]
        where
          ax i = (2 * i * pi / vertices + phi)
          transform t v = v
              # U.translate (0.5, 0.5)
              # U.rotateBy (ax t)
              # U.scaleBy (1 / divideBy, 1 / divideBy)

          f t = map (map (transform t)) chevalData
   in chevals
        # getTrailsList
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # squareFrame (getRemSizeDiv (* 4))

figure36 :: (ConstraintRender n b) => TDiagram n b
figure36 =
  let stages = 6
      flips = 2

      chevals = mconcat [f x y | 
          x <- [0 .. (flips - 1)]
        , y <- [0 .. (stages - 1)]]
        where
          transform i j dt = 
            (if even i then dt
                       else dt # U.flipX
            )
              # U.scaleBy (0.5 ** j, 0.5 ** j)
              # U.translate (0, -(80 * 0.5 ** j))

          f t u = map (map (transform t u)) chevalData
      
   in chevals
        # getTrailsList
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # squareFrame (getRemSizeDiv (* 4))

figure37 :: (ConstraintRender n b) => TDiagram n b
figure37 =
  let vertices = 6
      phi = pi / 12
      rr = 0.87
      pointsCount = 16

      chevals = mconcat [f x | x <- [0 .. (pointsCount - 1)]]
        where
          ax i = (2 * i * pi / vertices + phi)
          transform i v = v
              # U.translate (0.15, 0.15)
              # U.scaleBy (3 / 110, 3 / 110)
              # U.translate (0.5, 0.5)
              # U.rotateBy (ax i)
              # U.scaleBy (rr ** i / 2, rr ** i / 2)

          f t = map (map (transform t)) chevalData
   in chevals
        # getTrailsList
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # squareFrame (getRemSizeDiv (* 4))

figure38 :: (ConstraintRender n b) => TDiagram n b
figure38 =
  let pointsCount = 6
      chevals = mconcat [f x y |
          x <- [0 .. (pointsCount - 1)]
        , y <- [0 .. ((2 ** x) - 1)]]
        where
          transform i j v = v
              # U.scaleBy (1 / 40, 1 / 40)
              # U.translate (j, 0)
              # U.scaleBy (0.5 ** i, 0.5 ** i)
              # U.translate (0, 2 - 2* 0.5**i)

          f i j = map (map (transform i j)) chevalData
   in chevals
        # getTrailsList
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # squareFrame (getRemSizeDiv (* 4))

figure39 :: (ConstraintRender n b) => TDiagram n b
figure39 =
  let iCount = 3
      jCount = 3
      chevals = mconcat [f x y |
          x <- [0 .. (iCount - 1)]
        , y <- [0 .. (jCount - 1)]]
        where
          transform i j v = v
              # U.translate (i * 20, j * 20)

          f i j = map (map (transform i j)) chevalData
   in chevals
        # getTrailsList
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # squareFrame (getRemSizeDiv (* 4))

figure40 :: (ConstraintRender n b) => TDiagram n b
figure40 =
  let iCount = 4
      chevals = mconcat [f x y |
          x <- [-iCount .. iCount]
        , y <- [-abs x .. abs x]]
        where
          transform i j v = v
              # U.translate (fromIntegral i * 20, fromIntegral j * 20)

          f j i = map (map (transform i j)) chevalData
   in chevals
        # getTrailsList
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # squareFrame (getRemSizeDiv (* 4))

bonus :: (ConstraintRender n b) => TDiagram n b
bonus =
  let vertices = 6
      phi = 0

      warp :: (RealFloat a) => (a, a) -> (a, a) -> (a, a)
      warp (x1, y1) (x2, y2) =
        (co * x - si * y, si * x - co * y)
          # DP.bimap add add
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
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # squareFrame (getRemSizeDiv (* 4))
