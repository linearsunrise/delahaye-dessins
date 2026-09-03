{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Composition2.Figure023 (figure023) where

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

figure023 ::
  (Enum n, T.Render n b) =>
  T.TDiagram n b
figure023 =
  renderFigure
    FigureParams
      { figureRadius = 0.5
      , compositionRadius = 0.0
      , innerVertices = 21
      , innerStep = 10
      , pointsCount = 10
      , mult = 0.75
      , starsPerCycle = 10
      }
