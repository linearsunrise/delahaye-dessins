{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}

module Dessins.Types.Geometry.Vector where

import Dessins.Types.Geometry.Path (Path (..))
import Dessins.Types.Geometry.Point (Point (Point))

import Data.Function ((&))

data Vector a = Vector a a a
  deriving (Eq, Ord, Show)

toPoint :: Vector a -> Point a
toPoint (Vector x y z) = Point x y z

fromPoint :: Point a -> Vector a
fromPoint (Point x y z) = Vector x y z

class Additive a b c where
  (~+) :: a -> b -> c

infixl 6 ~+

instance (Num a) => Additive (Point a) (Vector a) (Point a) where
  Point x y z ~+ Vector dx dy dz =
    Point (x + dx) (y + dy) (z + dz)

direction :: (Num a) => Point a -> Point a -> Vector a
direction (Point x1 y1 z1) (Point x2 y2 z2) =
  Vector (x2 - x1) (y2 - y1) (z2 - z1)

normalize :: (Floating a) => Vector a -> Vector a
normalize (Vector x y z) =
  let len = sqrt (x ** 2 + y ** 2 + z ** 2)
   in Vector (x / len) (y / len) (z / len)

getNormalizedByTwoPoints ::
  (Floating a) => Point a -> Point a -> Vector a
getNormalizedByTwoPoints p1 p2 =
  let dir = direction p1 p2
   in normalize dir

class Concat a where
  (^++) :: a -> a -> a

infixl 6 ^++

instance Concat (Path a) where
  (Path path1) ^++ (Path path2) = Path (path1 ++ reverse path2)

class Scalable a where
  type SScalar a
  (~*) :: a -> SScalar a -> a

instance (Floating a) => Scalable (Vector a) where
  type SScalar (Vector a) = a

  (Vector x y z) ~* m = Vector (x * m) (y * m) (z * m)

vectorByLastTwoPoints :: (Floating n) => Path n -> Vector n
vectorByLastTwoPoints (Path xs) = drop (length xs - 2) xs & getVector
  where
    getVector :: (Floating a) => [Point a] -> Vector a
    getVector (p1 : p2 : _) = getNormalizedByTwoPoints p1 p2
    getVector (p1 : _) = getNormalizedByTwoPoints (Point 0 0 1) p1
    getVector [] = Vector 0 0 1

lastPt :: Path a -> Point a
lastPt (Path xs) = last xs
