{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Composition2.Figure020 (figure) where

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
      { figureRadius = 0.14
      , compositionRadius = 0.36
      , innerVertices = 16
      , innerStep = 5
      , pointsCount = 32
      , mult = 0.9
      , starsPerCycle = 8
      }
