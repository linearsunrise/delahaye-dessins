{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Joligones
  ( figure26
  , figure27
  , figure28
  , figure29
  , figure30
  , figure31
  , figure32
  , figure33
  )
where

import Dessins.Const (getRemSizeDiv)
import Dessins.Types (ConstraintRender, TDiagram)
import Dessins.Utils.Polygon (xAxis, yAxis)
import Dessins.Utils.Scene (squareFrame)

import Data.Bifunctor (Bifunctor (bimap))
import Data.Function ((&))
import Diagrams
  ( centerXY
  , global
  , lw
  , p2
  , scaleUToX
  , scaleX
  , strokeTrail
  , trailFromVertices
  , (#)
  )

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
          # lw (global 0.045)
   in figure

renderPipe ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b -> TDiagram n b
renderPipe v =
  v
    # centerXY
    # scaleUToX (getRemSizeDiv (* 3))
    # squareFrame (getRemSizeDiv (* 4))

figure26 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure26 =
  renderFigure
    FigureParams
      { vertices = 2 * 31 / 15
      , fineAngle = 0
      , rate = 0.98
      , pointsCount = 200
      , phase = 0
      }
    # renderPipe

figure27 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure27 =
  renderFigure
    FigureParams
      { vertices = 2 * 30 / 29
      , fineAngle = 0
      , rate = 0.98
      , pointsCount = 120
      , phase = -(pi / 4)
      }
    # renderPipe

figure28 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure28 =
  renderFigure
    FigureParams
      { vertices = 8
      , fineAngle = 0
      , rate = 0.98
      , pointsCount = 200
      , phase = pi / 8
      }
    # renderPipe

figure29 ::
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
    # renderPipe

figure30 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure30 =
  renderFigure
    FigureParams
      { vertices = 2 * 5 / 4
      , fineAngle = 0.02
      , rate = 0.99
      , pointsCount = 200
      , phase = pi / 4
      }
    # renderPipe

figure31 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure31 =
  renderFigure
    FigureParams
      { vertices = 2 * 7 / 6
      , fineAngle = 0.0
      , rate = 0.98
      , pointsCount = 100
      , phase = -(pi / 4)
      }
    # renderPipe

figure32 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure32 =
  renderFigure
    FigureParams
      { vertices = 5 - 0.03
      , fineAngle = 0
      , rate = 0.993
      , pointsCount = 300
      , phase = 0
      }
    # renderPipe

figure33 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure33 =
  renderFigure
    FigureParams
      { vertices = 2 * 60 / 19
      , fineAngle = 0
      , rate = 0.996
      , pointsCount = 400
      , phase = -(pi / 4)
      }
    # scaleX 1.7
    # centerXY
    # scaleUToX (getRemSizeDiv (* 3))
    # squareFrame (getRemSizeDiv (* 4))
