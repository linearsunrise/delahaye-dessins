{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Composition1.Figure019 (figure019) where

-- import Diagrams.Prelude as D

import Dessins.Figures.Composition1.Common
import qualified Dessins.Types as T

figure019 :: (Enum n, T.Render n b) => T.TDiagram n b
figure019 =
  renderFigure
    FigureParams
      { figureRadius = 0.25
      , compositionRadius = 0.25
      , innerVertices = 7
      , innerStep = 3
      , pointCount = 99
      }
