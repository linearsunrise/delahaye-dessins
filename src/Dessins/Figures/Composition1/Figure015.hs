{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Composition1.Figure015 (figure) where

import qualified Dessins.Types as T

import Dessins.Figures.Composition1.Common

figure :: (Enum n, T.Render n b) => T.TDiagram n b
figure =
  renderFigure
    FigureParams
      { figureRadius = 0.25
      , compositionRadius = 0.25
      , innerVertices = 80
      , innerStep = 1
      , pointCount = 40
      }
