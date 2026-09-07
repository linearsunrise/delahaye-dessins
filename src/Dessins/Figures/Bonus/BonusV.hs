{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Bonus.BonusV (figure) where

import qualified Dessins.Utils.Scene as U

import Dessins.Const (getRemSizeDiv)

import qualified Dessins.Types as T

import qualified Dessins.Types.Convertable as Convertable
import qualified Dessins.Types.Units as T

import qualified Dessins.Types.Geometry.Path as G
import qualified Dessins.Types.Geometry.Point as G
import qualified Dessins.Types.Geometry.Transformable as G
import Dessins.Types.Geometry.Vector hiding ((^++))
import qualified Dessins.Types.Geometry.Vector as G

import qualified Diagrams as D
import Diagrams.Prelude as DP ((#))

dragonInitCurve :: (Floating a) => G.Path a
dragonInitCurve =
  G.Path
    [ G.Point (-3) 0 1
    , G.Point (-1) 0 1
    ]

brokenRotateZAround ::
  (G.Transformable c) => G.Scalar c -> G.Point (G.Scalar c) -> c -> c
brokenRotateZAround phi origin =
  G.translate (G.fromPoint origin)
    . G.rotateZ phi
    . G.translate (G.fromPoint origin)

(^++) :: G.Path n -> G.Path n -> G.Path n
(G.Path path1) ^++ (G.Path path2) = G.Path (path1 ++ reverse path2)

dragon :: (Eq b, Eq n, Floating n, Num b) => G.Path n -> b -> G.Path n
dragon xs n = case n of
  0 -> xs
  m ->
    xs
      # (\ls -> ls ^++ brokenRotateZAround (T.deg 90) lastPoint ls)
      # (\ls -> dragon ls (m - 1))
    where
      lastPoint = lastPt xs

figure :: (T.Render n b) => T.TDiagram n b
figure =
  let repeats = 15 :: Integer
      path = dragon dragonInitCurve repeats
   in path
        # G.rotateZ (-T.deg 45)
        # Convertable.toDessinFrame
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
