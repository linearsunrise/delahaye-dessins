{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Joligones.Figure031 (figure031) where

import Dessins.Figures.Joligones.Common
import qualified Dessins.Types as T

import Diagrams ((#))

figure031 ::
  (Enum n, T.Render n b) =>
  T.TDiagram n b
figure031 =
  renderFigure
    FigureParams
      { vertices = 2 * 7 / 6
      , fineAngle = 0.0
      , rate = 0.98
      , pointsCount = 100
      , phase = -(pi / 4)
      }
    # renderPipe
