{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Composition1.Figure016 (figure016) where

-- import Diagrams.Prelude as D

import Dessins.Figures.Composition1.Common
import qualified Dessins.Types as T

figure016 :: (Enum n, T.Render n b) => T.TDiagram n b
figure016 =
  renderFigure
    FigureParams
      { figureRadius = 0.15
      , compositionRadius = 0.35
      , innerVertices = 10
      , innerStep = 3
      , pointCount = 10
      }
