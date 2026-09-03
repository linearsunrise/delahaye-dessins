{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Joligones.Figure027 (figure027) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Figures.Joligones.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

import Data.Bifunctor (Bifunctor (bimap))
import Data.Function ((&))
import Diagrams ((#))
import qualified Diagrams as D

figure027 ::
  (Enum n, T.Render n b) =>
  T.TDiagram n b
figure027 =
  renderFigure
    FigureParams
      { vertices = 2 * 30 / 29
      , fineAngle = 0
      , rate = 0.98
      , pointsCount = 120
      , phase = -(pi / 4)
      }
    # renderPipe
