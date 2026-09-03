{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Composition1.Figure017 (figure017) where

-- import Diagrams.Prelude as D

import Dessins.Figures.Composition1.Common
import qualified Dessins.Types as T

figure017 :: (Enum n, T.Render n b) => T.TDiagram n b
figure017 =
  renderFigure
    FigureParams
      { figureRadius = 0.35
      , compositionRadius = 0.15
      , innerVertices = 4
      , innerStep = 1
      , pointCount = 63
      }
