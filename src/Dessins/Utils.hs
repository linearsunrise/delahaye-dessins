{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE TypeFamilies #-}

module Dessins.Utils
  ( module U
  , Matrix (Matrix)
  , Point (Point)
  , Figure (Figure)
  , Path (Path)
  , Transformable
  , Convertable
  , UpperType
  , Scalar
  , apply
  , rotateByX
  , rotateByY
  , rotateByZ
  , scaleBy
  , scaleByX
  , scaleByY
  , flip
  , flipX
  , flipY
  , flipXY
  , translate
  , warp
  , toDessinFrame
  , setOrigin
  , combineFigures
  , getPoints
  , getPaths
  , px
  , py
  , pz
  , points
  , paths
  )
where

import qualified Dessins.Types as T
import Dessins.Utils.Grid as U (group, hor, ver)
import Dessins.Utils.Polygon as U
  ( axis
  , polygonEtoile
  , polygonRegulier
  , xAxis
  , yAxis
  )
import Dessins.Utils.Scene as U
  ( renderSquareFrame
  , renderTrail
  , squareFrame
  )

import Data.Function ((&))
import qualified Diagrams as D
import qualified Diagrams.Prelude as DP

data Matrix n = Matrix
  { r1 :: (n, n, n)
  , r2 :: (n, n, n)
  , r3 :: (n, n, n)
  }
  deriving (Eq, Show)

data Point n = Point {px :: n, py :: n, pz :: n}
  deriving (Eq, Show)

newtype Path n = Path
  { points :: [Point n]
  }
  deriving (Eq, Show)

newtype Figure n = Figure
  { paths :: [Path n]
  }
  deriving (Eq, Show)

getPaths :: Figure n -> [Path n]
getPaths = paths

getPoints :: Path n -> [Point n]
getPoints = points

--------------------------------------

class Transformable a where
  type Scalar a

  apply :: Matrix (Scalar a) -> a -> a
  translate :: (Scalar a, Scalar a) -> a -> a
  setOrigin :: (Scalar a, Scalar a) -> a -> a
  rotateByX :: Scalar a -> a -> a
  rotateByY :: Scalar a -> a -> a
  rotateByZ :: Scalar a -> a -> a
  scaleBy :: (Scalar a, Scalar a) -> a -> a
  scaleByX :: Scalar a -> a -> a
  scaleByY :: Scalar a -> a -> a
  flipX :: a -> a
  flipY :: a -> a
  flipXY :: a -> a
  warp ::
    ((Scalar a, Scalar a, Scalar a) -> (Scalar a, Scalar a, Scalar a))
    -> a
    -> a

instance (Floating n) => Transformable (Point n) where
  type Scalar (Point n) = n

  apply
    ( Matrix
        (m11, m12, m13)
        (m21, m22, m23)
        (m31, m32, m33)
      )
    (Point x y z) =
      ( Point
          { px = m11 * x + m12 * y + m13 * z
          , py = m21 * x + m22 * y + m23 * z
          , pz = m31 * x + m32 * y + m33 * z
          }
      )
  translate (dx, dy) (Point x y _) =
    apply
      ( Matrix
          (1, 0, dx)
          (0, 1, dy)
          (0, 0, 1)
      )
      (Point x y 1)

  setOrigin (dx, dy) = translate (-dx, -dy)

  rotateByX theta =
    apply
      ( Matrix
          (1, 0, 0)
          (0, cos theta, -sin theta)
          (0, sin theta, cos theta)
      )

  rotateByY theta =
    apply
      ( Matrix
          (cos theta, 0, sin theta)
          (0, 1, 0)
          (-sin theta, 0, cos theta)
      )

  rotateByZ theta =
    apply
      ( Matrix
          (cos theta, -sin theta, 0)
          (sin theta, cos theta, 0)
          (0, 0, 1)
      )

  scaleBy (x, y) =
    apply
      ( Matrix
          (x, 0, 0)
          (0, y, 0)
          (0, 0, 1)
      )

  scaleByX x = scaleBy (x, 1)

  scaleByY y = scaleBy (1, y)

  flipX = scaleByX (-1)

  flipY = scaleByY (-1)

  flipXY = scaleBy (-1, -1)

  warp fn (Point x y z) = Point {px = dx, py = dy, pz = dz}
    where
      (dx, dy, dz) = fn (x, y, z)

instance (Floating n) => Transformable (Path n) where
  type Scalar (Path n) = n

  apply matrix (Path ps) =
    Path (map (apply matrix) ps)

  translate offset (Path ps) =
    Path (map (translate offset) ps)

  setOrigin offset (Path ps) =
    Path (map (setOrigin offset) ps)

  rotateByX theta (Path ps) =
    Path (map (rotateByX theta) ps)

  rotateByY theta (Path ps) =
    Path (map (rotateByY theta) ps)

  rotateByZ theta (Path ps) =
    Path (map (rotateByZ theta) ps)

  scaleBy scale (Path ps) =
    Path (map (scaleBy scale) ps)

  scaleByX x (Path ps) =
    Path (map (scaleByX x) ps)

  scaleByY y (Path ps) =
    Path (map (scaleByY y) ps)

  flipX (Path ps) =
    Path (map flipX ps)

  flipY (Path ps) =
    Path (map flipY ps)

  flipXY (Path ps) =
    Path (map flipXY ps)

  warp fn (Path ps) =
    Path (map (warp fn) ps)

instance (Floating n) => Transformable (Figure n) where
  type Scalar (Figure n) = n

  apply matrix (Figure pts) =
    Figure (map (apply matrix) pts)

  translate offset (Figure pts) =
    Figure (map (translate offset) pts)

  setOrigin offset (Figure pts) =
    Figure (map (setOrigin offset) pts)

  rotateByX theta (Figure pts) =
    Figure (map (rotateByX theta) pts)

  rotateByY theta (Figure pts) =
    Figure (map (rotateByY theta) pts)

  rotateByZ theta (Figure pts) =
    Figure (map (rotateByZ theta) pts)

  scaleBy scale (Figure pts) =
    Figure (map (scaleBy scale) pts)

  scaleByX x (Figure pts) =
    Figure (map (scaleByX x) pts)

  scaleByY y (Figure pts) =
    Figure (map (scaleByY y) pts)

  flipX (Figure pts) =
    Figure (map flipX pts)

  flipY (Figure pts) =
    Figure (map flipY pts)

  flipXY (Figure pts) =
    Figure (map flipXY pts)

  warp fn (Figure ps) =
    Figure (map (warp fn) ps)

----------------------------------

toVertices :: Path n -> [D.Point D.V2 n]
toVertices (Path pts) =
  map
    (\(Point x y _) -> D.p2 (x, y))
    pts

class Convertable a where
  type UpperType a

  toDessinFrame ::
    (T.Render (UpperType a) b) => a -> T.TDiagram (UpperType a) b

instance Convertable (Path a) where
  type UpperType (Path a) = a

  toDessinFrame d =
    toVertices d
      D.# D.fromVertices
      D.# D.strokePath
      D.# D.lw (D.global 0.045)
      D.# D.fc DP.red
      D.# D.lineJoin D.LineJoinBevel

instance Convertable (Figure a) where
  type UpperType (Figure a) = a

  toDessinFrame (Figure ps) = combineFrames ps
    where
      combineFrames :: (T.Render n b) => [Path n] -> T.TDiagram n b
      combineFrames = mconcat . map toDessinFrame

combineFigures :: [Figure n] -> Figure n
combineFigures figures =
  concatMap (\(Figure ps) -> ps) figures
    & Figure
