{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}
{-# OPTIONS_GHC -Wno-overlapping-patterns #-}
{-# OPTIONS_GHC -Wno-unused-matches #-}

module Dessins.Figures.Cheval
  ( figure34
  , figure35
  , figure36
  , bonus
  ) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Types (ConstraintRender, TDiagram)
import Dessins.Utils.Polygon (xAxis, yAxis)
import Dessins.Utils.Scene (squareFrame)

import Diagrams
  ( Point
  , V2
  , centerXY
  , fc
  , fromVertices
  , lw
  , p2
  , scaleUToY
  , strokePath
  , ultraThin
  , (#), scaleUToX
  )
import Diagrams.Prelude (Bifunctor (bimap), red)

data Matrix2x2 a = Matrix2x2
  { a11 :: a, a12 :: a
  , a21 :: a, a22 :: a
  }
  deriving (Eq, Show)
  
data Matrix3x3 a = Matrix3x3
  { b11 :: a, b12 :: a, b13 :: a
  , b21 :: a, b22 :: a, b23 :: a
  , b31 :: a, b32 :: a, b33 :: a
  }
  deriving (Eq, Show)

applyMatrixToPoint :: Num b => Matrix2x2 b -> (b, b) -> (b, b)
applyMatrixToPoint
  (Matrix2x2 m11 m12
             m21 m22)
  (x, y) =
    (m11 * x + m12 * y, m21 * x + m22 * y)

applyMatrix3x3ToPoint :: Num b => Matrix3x3 b -> (b, b) -> (b, b)
applyMatrix3x3ToPoint
  (Matrix3x3 m11 m12 m13
             m21 m22 m23
             m31 m32 m33)
  (x, y) =
    (m11 * x + m12 * y + m13, m21 * x + m22 * y + m23)

rotateBy :: (Floating a) => a -> (a, a) -> (a, a)
rotateBy theta =
  applyMatrixToPoint
    ( Matrix2x2
        { a11 = cos theta, a12 = -sin theta
        , a21 = sin theta, a22 = cos theta
        }
    )

scaleBy :: (Num a) => (a, a) -> (a, a) -> (a, a)
scaleBy (x, y) =
  applyMatrixToPoint
    ( Matrix2x2
        { a11 = x, a12 = 0
        , a21 = 0, a22 = y
        }
    )

scaleByX :: (Num a) => a -> (a, a) -> (a, a)
scaleByX x = scaleBy (x, 1)

scaleByY :: (Num a) => a -> (a, a) -> (a, a)
scaleByY y = scaleBy (1, y)

flipX :: (Num a) => (a, a) -> (a, a)
flipX = scaleBy (-1, 1)

flipY :: (Num a) => (a, a) -> (a, a)
flipY = 
  scaleBy (1, -1)

flipXY :: (Num a) => (a, a) -> (a, a)
flipXY = scaleBy (-1, -1)

translate :: Num b => (b, b) -> (b, b) -> (b, b)
translate (x, y) =
  applyMatrix3x3ToPoint 
    ( Matrix3x3 
        { b11 = 1, b12 = 0, b13 = x
        , b21 = 0, b22 = 1, b23 = y
        , b31 = 0, b32 = 0, b33 = 1
        }
    )

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
      phi = pi / 12

      divideBy = 90

      chevals = mconcat [f x | x <- [0 .. (vertices - 1)]]
        where
          ax i = (2 * i * pi / vertices + phi)
          transform t v = v
              # translate (0.5, 0.5)
              # rotateBy (ax t)
              # scaleBy (1 / divideBy, 1 / divideBy)

          f t = map (map (transform t)) chevalData
   in chevals
        # getTrailsList
        # centerXY
        # scaleUToY (getRemSizeDiv (* 3))
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
                       else dt # flipX
            )
              # scaleBy (0.5 ** j, 0.5 ** j)
              # translate (0, -(80 * 0.5 ** j))

          f t u = map (map (transform t u)) chevalData
      
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
