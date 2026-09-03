{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Joligones.Figure031 (figure) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Figures.Joligones.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

import Data.Bifunctor (Bifunctor (bimap))
import Data.Function ((&))
import Diagrams ((#))
import qualified Diagrams as D

figure ::
  (Enum n, T.Render n b) =>
  T.TDiagram n b
figure =
  renderFigure
    FigureParams
      { vertices = 2 * 7 / 6
      , fineAngle = 0.0
      , rate = 0.98
      , pointsCount = 100
      , phase = -(pi / 4)
      }
    # renderPipe
