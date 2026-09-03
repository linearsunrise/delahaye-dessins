{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Composition2.Figure025 (figure025) where

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

figure025 ::
  (Enum n, T.Render n b) =>
  T.TDiagram n b
figure025 =
  renderFigure
    FigureParams
      { figureRadius = 0.45
      , compositionRadius = 0.05
      , innerVertices = 8
      , innerStep = 1
      , pointsCount = 60
      , mult = 0.945
      , starsPerCycle = 20
      }
