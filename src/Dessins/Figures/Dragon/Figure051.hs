{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.Dragon.Figure051 (figure) where

import qualified Dessins.Utils as U

import Dessins.Const (getRemSizeDiv)

import qualified Dessins.Types as T

import qualified Dessins.Figures.Dragon.Common as C

import qualified Diagrams as D
import Diagrams.Prelude as DP ((#))

figure :: (T.Render n b) => T.TDiagram n b
figure =
  let repeats = 10
      path = C.dragon C.dragonInitCurve repeats
   in path
        # (\(U.Path xs) -> take (length xs - 1) xs)
        # U.Path
        # U.flipY
        # U.toDessinFrame
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
