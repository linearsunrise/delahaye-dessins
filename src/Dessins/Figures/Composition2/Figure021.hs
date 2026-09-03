{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Composition2.Figure021 (figure021) where

import Dessins.Figures.Composition2.Common
import qualified Dessins.Types as T

figure021 ::
  (Enum n, T.Render n b) =>
  T.TDiagram n b
figure021 =
  renderFigure
    FigureParams
      { figureRadius = 0.15
      , compositionRadius = 0.35
      , innerVertices = 8
      , innerStep = 3
      , pointsCount = 30
      , mult = 0.85
      , starsPerCycle = 10
      }
