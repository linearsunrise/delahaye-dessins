{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Joligones.Common where

import Dessins.Const (getRemSizeDiv)
import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

import Data.Bifunctor (Bifunctor (bimap))
import Data.Function ((&))
import Diagrams ((#))
import qualified Diagrams as D

data FigureParams n = FigureParams
  { vertices :: n
  , rate :: n
  , pointsCount :: n
  , fineAngle :: n
  , phase :: n
  }

renderFigure ::
  forall n b.
  (Enum n, T.Render n b) =>
  FigureParams n -> T.TDiagram n b
renderFigure params =
  let calcVectors vert =
        let pCount = (params & vertices) + (params & fineAngle)
            rr = (params & rate) ** vert
            t = vert
            phi = -(3 * pi / 4) + (params & phase)
         in (U.yAxis t pCount phi, U.xAxis t pCount phi)
              # bimap (rr *) (rr *)
              # D.p2

      vectors = [0 .. ((params & pointsCount) - 1)]

      figure =
        map calcVectors vectors
          # D.trailFromVertices
          # D.strokeTrail
          # D.lw (D.global 0.045)
   in figure

renderPipe ::
  (Enum n, T.Render n b) =>
  T.TDiagram n b -> T.TDiagram n b
renderPipe v =
  v
    # D.centerXY
    # D.scaleUToX (getRemSizeDiv (* 3))
    # U.squareFrame (getRemSizeDiv (* 4))
