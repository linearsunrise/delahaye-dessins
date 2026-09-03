{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Composition1.Figure017 (figure) where

import Dessins.Const (getRemSizeDiv)
-- import Diagrams.Prelude as D

import Dessins.Figures.Composition1.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import Data.Function ((&))
import Diagrams as D ((#))
import qualified Diagrams as D

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
