{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.Dragon.Figure053 (figure) where

import qualified Dessins.Utils as U

import Dessins.Const (getRemSizeDiv)

import qualified Dessins.Types as T

import qualified Dessins.Types.Convertable as Convertable

import qualified Dessins.Figures.Dragon.Common as C

import qualified Dessins.Types.Geometry.Path as G
import qualified Dessins.Types.Geometry.Transformable as G

import qualified Diagrams as D
import Diagrams.Prelude as DP ((#))
import qualified Dessins.Types.Units as T

figure :: (T.Render n b) => T.TDiagram n b
figure =
  let repeats :: (Num n) => n
      repeats = 10
      path = C.dragon C.dragonInitCurve repeats (\n -> (n + 1) `mod` 3)
   in path
        # (\(G.Path xs) -> take (length xs - 1) xs)
        # G.Path
        # G.flipX
        # G.rotateZ (T.deg (-90) * (repeats + 1))
        # Convertable.toDessinFrame
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
