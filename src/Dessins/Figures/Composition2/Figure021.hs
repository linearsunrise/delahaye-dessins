{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Composition2.Figure021 (figure) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Figures.Composition2.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

import Data.Function ((&))
import Diagrams
  ( centerXY
  , r2
  , scale
  , scaleUToX
  , translate
  , (#)
  )
import Diagrams.Prelude (Bifunctor (bimap))

figure ::
  (Enum n, T.Render n b) =>
  T.TDiagram n b
figure =
  renderFigure
    FigureParams
      { figureRadius = 0.15
      , compositionRadius = 0.35
      , innerVertices = 8
      , innerStep = 3
      , pointsCount = 30
      , mult = 0.85
      , starsPerCycle = 10
      }
