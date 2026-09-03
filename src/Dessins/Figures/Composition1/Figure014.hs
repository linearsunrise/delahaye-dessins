{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Composition1.Figure014 (figure014) where

import Dessins.Figures.Composition1.Common
import qualified Dessins.Types as T

figure014 :: (Enum n, T.Render n b) => T.TDiagram n b
figure014 =
  renderFigure
    FigureParams
      { figureRadius = 0.3
      , compositionRadius = 0.2
      , innerVertices = 24
      , innerStep = 11
      , pointCount = 6
      }
