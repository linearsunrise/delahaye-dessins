{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Composition1.Common where

import Dessins.Const (getRemSizeDiv)
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import Data.Function ((&))
import Diagrams as D ((#))
import qualified Diagrams as D

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
