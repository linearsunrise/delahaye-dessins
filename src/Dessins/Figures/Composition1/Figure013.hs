{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Composition1.Figure013 (figure013) where

import Dessins.Figures.Composition1.Common
import qualified Dessins.Types as T

figure013 :: (Enum n, T.Render n b) => T.TDiagram n b
figure013 =
  renderFigure
    FigureParams
      { figureRadius = 0.22
      , compositionRadius = 0.27
      , innerVertices = 25
      , innerStep = 12
      , pointCount = 5
      }
