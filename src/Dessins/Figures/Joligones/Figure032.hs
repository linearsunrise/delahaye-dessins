{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Joligones.Figure032 (figure032) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Figures.Joligones.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

import Data.Bifunctor (Bifunctor (bimap))
import Data.Function ((&))
import Diagrams ((#))
import qualified Diagrams as D

figure032 ::
  (Enum n, T.Render n b) =>
  T.TDiagram n b
figure032 =
  renderFigure
    FigureParams
      { vertices = 5 - 0.03
      , fineAngle = 0
      , rate = 0.993
      , pointsCount = 300
      , phase = 0
      }
    # renderPipe
