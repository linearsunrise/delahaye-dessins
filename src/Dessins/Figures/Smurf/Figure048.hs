{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Smurf.Figure048 (figure) where

import qualified Dessins.Utils as U

import Dessins.Const (getRemSizeDiv)

import qualified Dessins.Types as T

import Dessins.Figures.Smurf.Common as C (smurfData)

import qualified Diagrams as D
import Diagrams.Prelude as DP ((#))

figure :: (T.Render n b) => T.TDiagram n b
figure =
  C.smurfData
    # U.toDessinFrame
    # D.centerXY
    # D.scaleUToY (getRemSizeDiv (* 3))
    # U.squareFrame (getRemSizeDiv (* 4))
