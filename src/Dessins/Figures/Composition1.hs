{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Composition1
  ( figure13
  , figure14
  , figure15
  , figure16
  , figure17
  , figure18
  , figure19
  )
where

import Dessins.Const (getRemSizeDiv)
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import Data.Function ((&))
import Diagrams as D ((#))
import qualified Diagrams as D

-- import Diagrams.Prelude as D

data FigureParams n = FigureParams
  { figureRadius :: n
  , compositionRadius :: n
  , innerVertices :: n
  , innerStep :: n
  , pointCount :: n
  }

renderFigure ::
  forall n b.
  (Enum n, T.Render n b) =>
  FigureParams n -> T.TDiagram n b
renderFigure params =
  -- Взято из книги, радиус композиции = .27,
  -- радиус кругов = .22.
  -- Нужно приравнять это к текущему масштабу, а затем восстановить
  let starRadius = (params & figureRadius) / (params & compositionRadius)

      similarityCoefficient =
        let radius1 = (params & compositionRadius) + (params & figureRadius)
            radius2 = (1 + starRadius)
         in radius1 / radius2

      star =
        U.polygonEtoile (params & innerVertices) (params & innerStep)
          # U.renderTrail
          # D.scale starRadius

      vertices = [1 .. (params & pointCount)]
      phi = 0

      calcVectors t =
        D.r2
          ( U.xAxis t (params & pointCount) phi
          , U.yAxis t (params & pointCount) phi
          )

      shiftPoints = map calcVectors vertices

      createFigure v = star # D.translate v

      figures = map createFigure shiftPoints
   in mconcat figures
        # D.scale (2 * similarityCoefficient)
        # U.squareFrame (getRemSizeDiv (* 4))

figure13 :: (Enum n, T.Render n b) => T.TDiagram n b
figure13 =
  renderFigure
    FigureParams
      { figureRadius = 0.22
      , compositionRadius = 0.27
      , innerVertices = 25
      , innerStep = 12
      , pointCount = 5
      }

figure14 :: (Enum n, T.Render n b) => T.TDiagram n b
figure14 =
  renderFigure
    FigureParams
      { figureRadius = 0.3
      , compositionRadius = 0.2
      , innerVertices = 24
      , innerStep = 11
      , pointCount = 6
      }

figure15 :: (Enum n, T.Render n b) => T.TDiagram n b
figure15 =
  renderFigure
    FigureParams
      { figureRadius = 0.25
      , compositionRadius = 0.25
      , innerVertices = 80
      , innerStep = 1
      , pointCount = 40
      }

figure16 :: (Enum n, T.Render n b) => T.TDiagram n b
figure16 =
  renderFigure
    FigureParams
      { figureRadius = 0.15
      , compositionRadius = 0.35
      , innerVertices = 10
      , innerStep = 3
      , pointCount = 10
      }

figure17 :: (Enum n, T.Render n b) => T.TDiagram n b
figure17 =
  renderFigure
    FigureParams
      { figureRadius = 0.35
      , compositionRadius = 0.15
      , innerVertices = 4
      , innerStep = 1
      , pointCount = 63
      }

figure18 :: (Enum n, T.Render n b) => T.TDiagram n b
figure18 =
  renderFigure
    FigureParams
      { figureRadius = 0.4
      , compositionRadius = 0.1
      , innerVertices = 5
      , innerStep = 2
      , pointCount = 25
      }

figure19 :: (Enum n, T.Render n b) => T.TDiagram n b
figure19 =
  renderFigure
    FigureParams
      { figureRadius = 0.25
      , compositionRadius = 0.25
      , innerVertices = 7
      , innerStep = 3
      , pointCount = 99
      }
