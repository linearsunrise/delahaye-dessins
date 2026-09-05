{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Composition1.Figure016 (figure) where

-- import Diagrams.Prelude as D

import qualified Dessins.Types as T

import Dessins.Figures.Composition1.Common

figure :: (Enum n, T.Render n b) => T.TDiagram n b
figure =
  renderFigure
    FigureParams
      { figureRadius = 0.15
      , compositionRadius = 0.35
      , innerVertices = 10
      , innerStep = 3
      , pointCount = 10
      }
