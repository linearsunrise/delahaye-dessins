{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Bonus.BonusV (figure) where

import qualified Dessins.Utils as U

import Dessins.Const (getRemSizeDiv)

import qualified Dessins.Types as T

import qualified Dessins.Types.Convertable as Convertable

import qualified Dessins.Types.Geometry.Path as G
import qualified Dessins.Types.Geometry.Point as G
import Dessins.Types.Geometry.Vector
  ( Additive ((~+))
  , Concat ((^++))
  , lastPt
  )
import qualified Dessins.Types.Geometry.Vector as G

import qualified Diagrams as D
import Diagrams.Prelude as DP ((#))

dragonInitCurve :: (Floating a) => G.Path a
dragonInitCurve =
  G.Path
    [ G.Point (-3) 0 1
    , G.Point (-1) 0 1
    ]

dragon :: (Eq b, Floating n, Num b) => G.Path n -> b -> G.Path n
dragon xs n = case n of
  0 -> xs
  m ->
    xs
      # (\ls -> ls ^++ G.rotateZ90AroundOrigin newOrigin ls)
      # (\ls -> dragon ls (m - 1))
    where
      lastPoint = lastPt xs
      dir = G.vectorByLastTwoPoints xs
      newOrigin = lastPoint ~+ dir

figure :: (T.Render n b) => T.TDiagram n b
figure =
  let repeats = 17 :: Integer
      path = dragon dragonInitCurve repeats
   in path
        # Convertable.toDessinFrame
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
