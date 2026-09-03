{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Joligones.Figure026 (figure026) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Figures.Joligones.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

import Data.Bifunctor (Bifunctor (bimap))
import Data.Function ((&))
import Diagrams ((#))
import qualified Diagrams as D

figure026 ::
  (Enum n, T.Render n b) =>
  T.TDiagram n b
figure026 =
  renderFigure
    FigureParams
      { vertices = 2 * 31 / 15
      , fineAngle = 0
      , rate = 0.98
      , pointsCount = 200
      , phase = 0
      }
    # renderPipe
