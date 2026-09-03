{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Lion.Figure044 (figure) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Figures.Lion.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import qualified Diagrams as D
import Diagrams.Prelude as DP

figure :: (T.Render n b) => T.TDiagram n b
figure =
  lionData
    # getTrailsList
    # D.centerXY
    # D.scaleUToX (getRemSizeDiv (* 3))
    # U.squareFrame (getRemSizeDiv (* 4))
