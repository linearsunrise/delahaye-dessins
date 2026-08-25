{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Composition2
  ( figure20
  , figure21
  , figure22
  , figure23
  , figure24
  , figure25
  )
where

import Dessins.Const (getRemSizeDiv)
import Dessins.Types (ConstraintRender, TDiagram)
import Dessins.Utils.Polygon (polygonEtoile, xAxis, yAxis)
import Dessins.Utils.Scene (renderTrail, squareFrame)

import Data.Function ((&))
import Diagrams
  ( centerX
  , r2
  , scale
  , scaleUToX
  , translate
  , (#)
  )
import Diagrams.Prelude (Bifunctor (bimap))

data FigureParams n = FigureParams
  { figureRadius :: n
  , compositionRadius :: n
  , innerVertices :: n
  , innerStep :: n
  , pointsCount :: n
  , mult :: n
  , starsPerCycle :: n
  }

renderFigure ::
  forall n b.
  (ConstraintRender n b, Enum n) =>
  FigureParams n -> TDiagram n b
renderFigure params =
  let star :: (ConstraintRender n b) => TDiagram n b
      star =
        polygonEtoile
          (params & innerVertices)
          (params & innerStep)
          # renderTrail

      vertices = [0 .. ((params & pointsCount) - 1)]

      calcVectors vert =
        let pCount = (params & starsPerCycle)
            rr = (params & compositionRadius) * (params & mult) ** vert
            t = vert
         in (yAxis t pCount 0, xAxis t pCount 0)
              # bimap (rr *) (rr *)
              # r2

      figures =
        map
          ( \x ->
              let vtx = calcVectors x
                  rr = (params & figureRadius) * (params & mult) ** x
                  figure =
                    star
                      # scale rr
                      # translate vtx
               in figure
          )
          vertices
   in mconcat figures
        # centerX
        # scaleUToX (getRemSizeDiv (* 3))
        # squareFrame (getRemSizeDiv (* 4))

figure20 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure20 =
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

figure21 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure21 =
  renderFigure
    FigureParams
      { figureRadius = 0.15
      , compositionRadius = 0.35
      , innerVertices = 8
      , innerStep = 3
      , pointsCount = 30
      , mult = 0.85
      , starsPerCycle = 10
      }

figure22 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure22 =
  renderFigure
    FigureParams
      { figureRadius = 0.5
      , compositionRadius = 0.0
      , innerVertices = 18
      , innerStep = 7
      , pointsCount = 10
      , mult = 0.80
      , starsPerCycle = 10
      }

figure23 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure23 =
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

figure24 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure24 =
  renderFigure
    FigureParams
      { figureRadius = 0.35
      , compositionRadius = 0.15
      , innerVertices = 7
      , innerStep = 3
      , pointsCount = 56
      , mult = 0.95
      , starsPerCycle = 28
      }

figure25 ::
  (ConstraintRender n b, Enum n) =>
  TDiagram n b
figure25 =
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
