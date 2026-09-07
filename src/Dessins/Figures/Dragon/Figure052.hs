{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.Dragon.Figure052 (figure) where

import qualified Dessins.Utils as U

import Dessins.Const (getRemSizeDiv)

import qualified Dessins.Types as T

import qualified Dessins.Types.Convertable as Convertable

import qualified Dessins.Figures.Dragon.Common as C

import qualified Dessins.Types.Geometry.Path as G
import qualified Dessins.Types.Geometry.Transformable as G

import qualified Diagrams as D
import Diagrams.Prelude as DP ((#))

figure :: (T.Render n b) => T.TDiagram n b
figure =
  let repeats = 14
      path = C.dragon C.dragonInitCurve repeats
   in path
        # (\(G.Path xs) -> take (length xs - 1) xs)
        # G.Path
        # G.flipX
        # Convertable.toDessinFrame
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
