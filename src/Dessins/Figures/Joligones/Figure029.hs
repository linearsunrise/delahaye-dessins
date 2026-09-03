{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Joligones.Figure029 (figure029) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Figures.Joligones.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

import Data.Bifunctor (Bifunctor (bimap))
import Data.Function ((&))
import Diagrams ((#))
import qualified Diagrams as D

figure029 ::
  (Enum n, T.Render n b) =>
  T.TDiagram n b
figure029 =
  renderFigure
    FigureParams
      { vertices = 20
      , fineAngle = 0
      , rate = 0.998
      , pointsCount = 2000
      , phase = pi / 4
      }
    # renderPipe
