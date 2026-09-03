{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Composition1.Figure013 (figure) where

import Dessins.Figures.Composition1.Common
import qualified Dessins.Types as T

figure :: (Enum n, T.Render n b) => T.TDiagram n b
figure =
  renderFigure
    FigureParams
      { figureRadius = 0.22
      , compositionRadius = 0.27
      , innerVertices = 25
      , innerStep = 12
      , pointCount = 5
      }
