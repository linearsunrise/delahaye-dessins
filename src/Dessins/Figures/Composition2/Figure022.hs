{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Composition2.Figure022 (figure022) where

import Dessins.Figures.Composition2.Common
import qualified Dessins.Types as T

figure022 ::
  (Enum n, T.Render n b) =>
  T.TDiagram n b
figure022 =
  renderFigure
    FigureParams
      { figureRadius = 0.5
      , compositionRadius = 0.0
      , innerVertices = 18
      , innerStep = 7
      , pointsCount = 10
      , mult = 0.80
      , starsPerCycle = 10
      }
