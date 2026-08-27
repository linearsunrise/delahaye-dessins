module Dessins.Utils
  ( module Dessins.Utils.Grid
  , module Dessins.Utils.Polygon
  , module Dessins.Utils.Scene
  , Matrix2x2
  , applyMatrixToPoint
  , applyMatrix3x3ToPoint
  , rotateBy
  , scaleBy
  , scaleByX
  , scaleByY
  , flip
  , flipX
  , flipY
  , flipXY
  , translate
  )
where

import Dessins.Utils.Grid
import Dessins.Utils.Polygon
import Dessins.Utils.Scene

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
             _   _   _  )
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