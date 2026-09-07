{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}

module Dessins.Types.Geometry.Transformable where

import qualified Dessins.Types.Geometry.Figure as Figure
  ( Figure (Figure)
  )
import qualified Dessins.Types.Geometry.Matrix as Matrix
  ( Matrix (Matrix)
  )
import qualified Dessins.Types.Geometry.Path as Path (Path (Path))
import qualified Dessins.Types.Geometry.Point as Point (Point (Point))
import qualified Dessins.Types.Geometry.Vector as Vector
  ( Vector (Vector)
  , fromPoint
  , toPoint
  )

class Transformable a where
  type Scalar a

  apply :: Matrix.Matrix (Scalar a) -> a -> a
  translate :: Vector.Vector (Scalar a) -> a -> a
  setOrigin :: Vector.Vector (Scalar a) -> a -> a
  rotateX :: Scalar a -> a -> a
  rotateY :: Scalar a -> a -> a
  rotateZ :: Scalar a -> a -> a
  rotateZAround :: Scalar a -> Vector.Vector (Scalar a) -> a -> a
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

instance (Eq n, Floating n) => Transformable (Point.Point n) where
  type Scalar (Point.Point n) = n

  apply
    ( Matrix.Matrix
        (m11, m12, m13)
        (m21, m22, m23)
        (m31, m32, m33)
      )
    (Point.Point x y z) =
      Point.Point
        (m11 * x + m12 * y + m13 * z)
        (m21 * x + m22 * y + m23 * z)
        (m31 * x + m32 * y + m33 * z)

  translate (Vector.Vector dx dy _) (Point.Point x y _) =
    apply
      ( Matrix.Matrix
          (1, 0, dx)
          (0, 1, dy)
          (0, 0, 1)
      )
      (Point.Point x y 1)

  setOrigin (Vector.Vector dx dy dz) = translate (Vector.Vector (-dx) (-dy) (-dz))

  rotateX theta =
    apply
      ( Matrix.Matrix
          (1, 0, 0)
          (0, cos theta, -sin theta)
          (0, sin theta, cos theta)
      )

  rotateY theta =
    apply
      ( Matrix.Matrix
          (cos theta, 0, sin theta)
          (0, 1, 0)
          (-sin theta, 0, cos theta)
      )

  rotateZ theta
    | theta == -(pi / 2) =
        apply
          ( Matrix.Matrix
              (0, 1, 0)
              (-1, 0, 0)
              (0, 0, 1)
          )
    | theta == (pi / 2) =
        apply
          ( Matrix.Matrix
              (0, -1, 0)
              (1, 0, 0)
              (0, 0, 1)
          )
    | otherwise =
        apply
          ( Matrix.Matrix
              (cos theta, -sin theta, 0)
              (sin theta, cos theta, 0)
              (0, 0, 1)
          )

  rotateZAround theta vec =
    translate vec . rotateZ theta . setOrigin vec

  scaleBy (x, y) =
    apply
      ( Matrix.Matrix
          (x, 0, 0)
          (0, y, 0)
          (0, 0, 1)
      )

  scaleByX x = scaleBy (x, 1)

  scaleByY y = scaleBy (1, y)

  flipX = scaleByX (-1)

  flipY = scaleByY (-1)

  flipXY = scaleBy (-1, -1)

  warp fn (Point.Point x y z) = Point.Point dx dy dz
    where
      (dx, dy, dz) = fn (x, y, z)

instance (Eq n, Floating n) => Transformable (Vector.Vector n) where
  type Scalar (Vector.Vector n) = n

  apply ::
    (Eq n, Floating n) =>
    Matrix.Matrix (Scalar (Vector.Vector n))
    -> Vector.Vector n
    -> Vector.Vector n
  apply matrix = Vector.fromPoint . apply matrix . Vector.toPoint

  translate tup = Vector.fromPoint . translate tup . Vector.toPoint

  setOrigin tup = Vector.fromPoint . setOrigin tup . Vector.toPoint

  rotateX theta = Vector.fromPoint . rotateX theta . Vector.toPoint

  rotateY theta = Vector.fromPoint . rotateY theta . Vector.toPoint

  rotateZ theta = Vector.fromPoint . rotateZ theta . Vector.toPoint

  rotateZAround theta origin = Vector.fromPoint . rotateZAround theta origin . Vector.toPoint

  scaleBy by = Vector.fromPoint . scaleBy by . Vector.toPoint

  scaleByX by = Vector.fromPoint . scaleByX by . Vector.toPoint

  scaleByY byTup = Vector.fromPoint . scaleByY byTup . Vector.toPoint

  flipX = Vector.fromPoint . flipX . Vector.toPoint

  flipY = Vector.fromPoint . flipY . Vector.toPoint

  flipXY = Vector.fromPoint . flipXY . Vector.toPoint

  warp withFn = Vector.fromPoint . warp withFn . Vector.toPoint

instance (Eq n, Floating n) => Transformable (Path.Path n) where
  type Scalar (Path.Path n) = n

  apply matrix (Path.Path ps) =
    Path.Path (map (apply matrix) ps)

  translate offset (Path.Path ps) =
    Path.Path (map (translate offset) ps)

  setOrigin offset (Path.Path ps) =
    Path.Path (map (setOrigin offset) ps)

  rotateX theta (Path.Path ps) =
    Path.Path (map (rotateX theta) ps)

  rotateY theta (Path.Path ps) =
    Path.Path (map (rotateY theta) ps)

  rotateZ theta (Path.Path ps) =
    Path.Path (map (rotateZ theta) ps)

  rotateZAround theta origin (Path.Path ps) =
    Path.Path (map (rotateZAround theta origin) ps)

  scaleBy scale (Path.Path ps) =
    Path.Path (map (scaleBy scale) ps)

  scaleByX x (Path.Path ps) =
    Path.Path (map (scaleByX x) ps)

  scaleByY y (Path.Path ps) =
    Path.Path (map (scaleByY y) ps)

  flipX (Path.Path ps) =
    Path.Path (map flipX ps)

  flipY (Path.Path ps) =
    Path.Path (map flipY ps)

  flipXY (Path.Path ps) =
    Path.Path (map flipXY ps)

  warp fn (Path.Path ps) =
    Path.Path (map (warp fn) ps)

instance (Eq n, Floating n) => Transformable (Figure.Figure n) where
  type Scalar (Figure.Figure n) = n

  apply matrix (Figure.Figure pts) =
    Figure.Figure (map (apply matrix) pts)

  translate offset (Figure.Figure pts) =
    Figure.Figure (map (translate offset) pts)

  setOrigin offset (Figure.Figure pts) =
    Figure.Figure (map (setOrigin offset) pts)

  rotateX theta (Figure.Figure pts) =
    Figure.Figure (map (rotateX theta) pts)

  rotateY theta (Figure.Figure pts) =
    Figure.Figure (map (rotateY theta) pts)

  rotateZ theta (Figure.Figure pts) =
    Figure.Figure (map (rotateZ theta) pts)

  rotateZAround theta origin (Figure.Figure pts) =
    Figure.Figure (map (rotateZAround theta origin) pts)

  scaleBy scale (Figure.Figure pts) =
    Figure.Figure (map (scaleBy scale) pts)

  scaleByX x (Figure.Figure pts) =
    Figure.Figure (map (scaleByX x) pts)

  scaleByY y (Figure.Figure pts) =
    Figure.Figure (map (scaleByY y) pts)

  flipX (Figure.Figure pts) =
    Figure.Figure (map flipX pts)

  flipY (Figure.Figure pts) =
    Figure.Figure (map flipY pts)

  flipXY (Figure.Figure pts) =
    Figure.Figure (map flipXY pts)

  warp fn (Figure.Figure ps) =
    Figure.Figure (map (warp fn) ps)
