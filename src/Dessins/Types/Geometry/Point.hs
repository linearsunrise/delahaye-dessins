{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeFamilies #-}

module Dessins.Types.Geometry.Point where

import Dessins.Types.Geometry.Matrix (Matrix (Matrix))
import Dessins.Types.Geometry.Transformable (Transformable (..))

data Point n = Point {px :: n, py :: n, pz :: n}
  deriving (Eq, Show)

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

rotateZ90AroundOrigin ::
  (Num (Scalar a), Transformable a) =>
  Point (Scalar a) -> a -> a
rotateZ90AroundOrigin (Point ox oy _) =
  apply
    ( Matrix
        (0, -1, ox + oy)
        (1, 0, oy - ox)
        (0, 0, 1)
    )
