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
  (Enum n, T.Render n b) =>
  FigureParams n -> T.TDiagram n b
renderFigure params =
  let star :: (T.Render n b) => T.TDiagram n b
      star =
        U.polygonEtoile
          (params & innerVertices)
          (params & innerStep)
          # U.renderTrail

      vertices = [0 .. ((params & pointsCount) - 1)]

      calcVectors vert =
        let pCount = (params & starsPerCycle)
            rr = (params & compositionRadius) * (params & mult) ** vert
            t = vert
         in (U.yAxis t pCount 0, U.xAxis t pCount 0)
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
        # centerXY
        # scaleUToX (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))

figure20 ::
  (Enum n, T.Render n b) =>
  T.TDiagram n b
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
  (Enum n, T.Render n b) =>
  T.TDiagram n b
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
  (Enum n, T.Render n b) =>
  T.TDiagram n b
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
  (Enum n, T.Render n b) =>
  T.TDiagram n b
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
  (Enum n, T.Render n b) =>
  T.TDiagram n b
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
  (Enum n, T.Render n b) =>
  T.TDiagram n b
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
