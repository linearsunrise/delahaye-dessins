{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Composition1.Figure017 (figure) where

-- import Diagrams.Prelude as D

import qualified Dessins.Types as T

import Dessins.Figures.Composition1.Common

figure :: (Enum n, T.Render n b) => T.TDiagram n b
figure =
  renderFigure
    FigureParams
      { figureRadius = 0.35
      , compositionRadius = 0.15
      , innerVertices = 4
      , innerStep = 1
      , pointCount = 63
      }
