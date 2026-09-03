{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Composition1.Figure018 (figure018) where

-- import Diagrams.Prelude as D

import Dessins.Figures.Composition1.Common
import qualified Dessins.Types as T

figure018 :: (Enum n, T.Render n b) => T.TDiagram n b
figure018 =
  renderFigure
    FigureParams
      { figureRadius = 0.4
      , compositionRadius = 0.1
      , innerVertices = 5
      , innerStep = 2
      , pointCount = 25
      }
