{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Joligones.Figure030 (figure030) where

import Dessins.Figures.Joligones.Common
import qualified Dessins.Types as T

import Diagrams ((#))

figure030 ::
  (Enum n, T.Render n b) =>
  T.TDiagram n b
figure030 =
  renderFigure
    FigureParams
      { vertices = 2 * 5 / 4
      , fineAngle = 0.02
      , rate = 0.99
      , pointsCount = 200
      , phase = pi / 4
      }
    # renderPipe
