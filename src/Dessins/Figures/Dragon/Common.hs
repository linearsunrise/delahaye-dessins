{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}

module Dessins.Figures.Dragon.Common where

import qualified Dessins.Utils as U

import Diagrams.Prelude ((#))

rotateZ90AroundOrigin ::
  (Num (U.Scalar a), U.Transformable a) =>
  U.Point (U.Scalar a) -> a -> a
rotateZ90AroundOrigin (U.Point ox oy _) =
  U.apply
    ( U.Matrix
        (0, -1, ox + oy)
        (1, 0, oy - ox)
        (0, 0, 1)
    )

data Vector a = Vector a a a
  deriving (Eq, Ord, Show)

class Additive a b c where
  (~+) :: a -> b -> c

infixl 6 ~+

instance (Num a) => Additive (U.Point a) (Vector a) (U.Point a) where
  U.Point x y z ~+ Vector dx dy dz =
    U.Point (x + dx) (y + dy) (z + dz)

direction :: (Num a) => U.Point a -> U.Point a -> Vector a
direction (U.Point x1 y1 z1) (U.Point x2 y2 z2) =
  Vector (x2 - x1) (y2 - y1) (z2 - z1)

normalize :: (Floating a) => Vector a -> Vector a
normalize (Vector x y z) =
  let len = sqrt (x ** 2 + y ** 2 + z ** 2)
   in Vector (x / len) (y / len) (z / len)

getNormalizedByTwoPoints ::
  (Floating a) => U.Point a -> U.Point a -> Vector a
getNormalizedByTwoPoints p1 p2 =
  let dir = direction p1 p2
   in normalize dir

{-
1. Берём U.Path.
2. Находим вектор движения двух последних точек в path
3. Относительно этого направления, добавляем нормализованный вектор к последней точке, и получаем новый origin
4.1. Копируем Path
4.2. поворачиваем вокруг origin на 90deg
4.3. делаем reverse этого Path
5. Конкатенируем

Повторяем #-> (1)
-}

class Concat a where
  (^++) :: a -> a -> a

infixl 6 ^++

instance Concat (U.Path a) where
  (U.Path path1) ^++ (U.Path path2) = U.Path (path1 ++ reverse path2)

class Scalable a where
  type Scalar a

  (~*) :: a -> Scalar a -> a

instance (Floating a) => Scalable (Vector a) where
  type Scalar (Vector a) = a

  (Vector x y z) ~* m = Vector (x * m) (y * m) (z * m)

vectorByLastTwoPoints :: (Floating n) => U.Path n -> Vector n
vectorByLastTwoPoints (U.Path xs) = drop (length xs - 2) xs # getVector
  where
    getVector :: (Floating a) => [U.Point a] -> Vector a
    getVector (p1 : p2 : _) = getNormalizedByTwoPoints p1 p2
    getVector (p1 : _) = getNormalizedByTwoPoints (U.Point 0 0 1) p1
    getVector [] = Vector 0 0 1

lastPt :: U.Path a -> U.Point a
lastPt (U.Path xs) = last xs

dragonInitCurve :: (Floating a) => U.Path a
dragonInitCurve =
  U.Path
    [ U.Point (-4) 0 1
    , U.Point 0 0 1
    ]

dragon :: (Floating n) => U.Path n -> Integer -> U.Path n
dragon xs 0 = xs
dragon xs n =
  xs
    # (\ls -> ls ^++ rotateZ90AroundOrigin newOrigin ls)
    # (\ls -> dragon ls (n - 1))
  where
    lastPoint = lastPt xs
    dir = vectorByLastTwoPoints xs ~* 2
    newOrigin = lastPoint ~+ dir
