{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.Dragon.Figure050 (figure) where

import qualified Dessins.Utils as U

import Dessins.Const (getRemSizeDiv)

import qualified Dessins.Types as T

import qualified Diagrams as D
import Diagrams.Prelude as DP ((#))
import qualified Dessins.Figures.Dragon.Common as C

figure :: (T.Render n b) => T.TDiagram n b
figure =
  let repeats = 6
      path = C.dragon C.dragonInitCurve repeats
   in path
        # (\(U.Path xs) -> take (length xs - 1) xs)
        # U.Path
        # U.flipX
        # U.toDessinFrame
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
