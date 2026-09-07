{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.Dragon.Figure051 (figure) where

import qualified Dessins.Utils as U

import Dessins.Const (getRemSizeDiv)

import qualified Dessins.Types as T

import qualified Dessins.Types.Convertable as Convertable
import qualified Dessins.Types.Geometry as G

import qualified Dessins.Figures.Dragon.Common as C

import qualified Diagrams as D
import Diagrams.Prelude as DP ((#))

figure :: (T.Render n b) => T.TDiagram n b
figure =
  let repeats = 10
      path = C.dragon C.dragonInitCurve repeats
   in path
        # (\(G.Path xs) -> take (length xs - 1) xs)
        # G.Path
        # G.flipY
        # Convertable.toDessinFrame
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
