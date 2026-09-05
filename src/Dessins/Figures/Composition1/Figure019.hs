{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Composition1.Figure019 (figure) where

-- import Diagrams.Prelude as D

import qualified Dessins.Types as T

import Dessins.Figures.Composition1.Common

figure :: (Enum n, T.Render n b) => T.TDiagram n b
figure =
  renderFigure
    FigureParams
      { figureRadius = 0.25
      , compositionRadius = 0.25
      , innerVertices = 7
      , innerStep = 3
      , pointCount = 99
      }
