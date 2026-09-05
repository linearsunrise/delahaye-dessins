{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Composition1.Figure014 (figure) where

import qualified Dessins.Types as T

import Dessins.Figures.Composition1.Common

figure :: (Enum n, T.Render n b) => T.TDiagram n b
figure =
  renderFigure
    FigureParams
      { figureRadius = 0.3
      , compositionRadius = 0.2
      , innerVertices = 24
      , innerStep = 11
      , pointCount = 6
      }
