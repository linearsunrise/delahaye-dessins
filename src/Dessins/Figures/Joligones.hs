{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Joligones
  ( figure26
  , figure27
  , figure28
  , figure29
  )
where

import Dessins.Const (getRemSizeDiv)
import Dessins.Types (ConstraintRender, TDiagram)
import Dessins.Utils.Polygon (xAxis, yAxis)
import Dessins.Utils.Scene (squareFrame)

import Data.Function ((&))
import Diagrams
  ( centerXY
  , lw
  , p2
  , scaleUToX
  , strokeTrail
  , trailFromVertices
  , ultraThin
  , (#)
  )
import Diagrams.Prelude (Bifunctor (bimap))

data FigureParams n = FigureParams
  { vertices :: n
  , rate :: n
  , pointsCount :: n
  , fineAngle :: n
  , phase :: n
  }

renderFigure ::
  forall n b.
  (ConstraintRender n b, Enum n) =>
  FigureParams n -> TDiagram n b
renderFigure params =
  let calcVectors vert =
        let pCount = (params & vertices) + (params & fineAngle)
            rr = (params & rate) ** vert
            t = vert
            phi = -(3 * pi / 4) + (params & phase)
         in (yAxis t pCount phi, xAxis t pCount phi)
              # bimap (rr *) (rr *)
              # p2

      vectors = [0 .. ((params & pointsCount) - 1)]

      figure =
        map calcVectors vectors
          # trailFromVertices
          # strokeTrail
          # lw ultraThin
   in figure
        # centerXY
        # scaleUToX (getRemSizeDiv (* 3))
        # squareFrame (getRemSizeDiv (* 4))

figure26 ::
  (ConstraintRender n b, Enum n) =>
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure26 =
  renderFigure
    FigureParams
      { vertices = 4
      , fineAngle = (1 * pi) / 31
      , rate = 0.98
      , pointsCount = 200
      , phase = 0
      }

figure27 ::
  (ConstraintRender n b, Enum n) =>
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure27 =
  renderFigure
    FigureParams
      { vertices = 30 / (29 / 2)
      , fineAngle = 0
      , rate = 0.98
      , pointsCount = 120
      , phase = -(pi / 4)
      }

figure28 ::
  (ConstraintRender n b, Enum n) =>
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure28 =
  renderFigure
    FigureParams
      { vertices = 8
      , fineAngle = 0
      , rate = 0.98
      , pointsCount = 200
      , phase = pi/8
      }

figure29 ::
  (ConstraintRender n b, Enum n) =>
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure29 =
  renderFigure
    FigureParams
      { vertices = 20
      , fineAngle = 0
      , rate = 0.998
      , pointsCount = 2000
      , phase = pi / 4
      }
