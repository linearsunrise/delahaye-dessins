{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Joligones.Figure028 (figure) where

import qualified Dessins.Types as T

import Dessins.Figures.Joligones.Common

import Diagrams ((#))

figure ::
  (Enum n, T.Render n b) =>
  T.TDiagram n b
figure =
  renderFigure
    FigureParams
      { vertices = 8
      , fineAngle = 0
      , rate = 0.98
      , pointsCount = 200
      , phase = pi / 8
      }
    # renderPipe
