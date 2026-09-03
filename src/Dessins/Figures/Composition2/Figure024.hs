{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Composition2.Figure024 (figure024) where

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

figure024 ::
  (Enum n, T.Render n b) =>
  T.TDiagram n b
figure024 =
  renderFigure
    FigureParams
      { figureRadius = 0.35
      , compositionRadius = 0.15
      , innerVertices = 7
      , innerStep = 3
      , pointsCount = 56
      , mult = 0.95
      , starsPerCycle = 28
      }
