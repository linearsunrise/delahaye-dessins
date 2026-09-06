{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Bonus.BonusV (figure) where

import qualified Dessins.Utils as U

import Dessins.Const (getRemSizeDiv)

import qualified Dessins.Types as T

import qualified Diagrams as D
import Diagrams.Prelude as DP ((#))

rotateZ90AroundOrigin ::
  (Num (U.Scalar a), U.Transformable a) =>
  U.Point (U.Scalar a) -> a -> a
rotateZ90AroundOrigin (U.Point ox oy _) =
  U.apply
    ( U.Matrix
        (0, -1, ox - oy)
        (1, 0, oy + ox)
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

class Concat a where
  (^++) :: a -> a -> a

infixl 6 ^++

instance Concat (U.Path a) where
  (U.Path path1) ^++ (U.Path path2) = U.Path (path1 ++ reverse path2)

lastTwo :: U.Path a -> [U.Point a]
lastTwo (U.Path xs) = drop (length xs - 2) xs

lastPt :: U.Path a -> U.Point a
lastPt (U.Path xs) = last xs

dragonInitCurve :: (Floating a) => U.Path a
dragonInitCurve =
  U.Path
    [ U.Point (-3) 0 1
    , U.Point (-1) 0 1
    ]

dragon :: (Eq b, Floating n, Num b) => U.Path n -> b -> U.Path n
dragon xs n = case n of
  0 -> xs
  m ->
    xs
      # (\ls -> ls ^++ rotateZ90AroundOrigin newOrigin ls)
      # (\ls -> dragon ls (m - 1))
    where
      lastPoint = lastPt xs
      dir =
        lastTwo xs
          # \(p1 : p2 : _) -> getNormalizedByTwoPoints p1 p2
      newOrigin = lastPoint ~+ dir

figure :: (T.Render n b) => T.TDiagram n b
figure =
  let repeats = 17 :: Integer
      path = dragon dragonInitCurve repeats
   in path
        # U.toDessinFrame
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
