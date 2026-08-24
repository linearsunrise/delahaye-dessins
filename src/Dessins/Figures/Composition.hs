{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Composition
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
import Dessins.Types (ConstraintRender, TDiagram)
import Dessins.Utils.Polygon (polygonEtoile, xAxis, yAxis)
import Dessins.Utils.Scene (renderTrail, squareFrame)

import Diagrams
  ( V2
  , r2
  , scale
  , translate
  , (#)
  )

renderFigure ::
  forall n b.
  (ConstraintRender n b, Enum n) =>
  n -> n -> (n, n) -> n -> TDiagram n b
renderFigure figureRadius compositionRadius (innerVertices, innerStep) pointCount =
  -- Взято из книги, радиус композиции = .27,
  -- радиус кругов = .22.
  -- Нужно приравнять это к текущему масштабу, а затем восстановить
  let starRadius = figureRadius / compositionRadius
      similarityCoefficient = (compositionRadius + figureRadius) / (1 + starRadius)

      star :: TDiagram n b
      star =
        renderTrail (polygonEtoile innerVertices innerStep) # scale starRadius

      vertices = [1 .. pointCount]
      phi = 0

      calcVectors t = r2 (xAxis t pointCount phi, yAxis t pointCount phi)

      shiftPoints :: [V2 n]
      shiftPoints = map calcVectors vertices

      createFigure :: V2 n -> TDiagram n b
      createFigure v = star # translate v

      figures :: [TDiagram n b]
      figures = map createFigure shiftPoints
   in ( mconcat figures
          # scale (2 * similarityCoefficient)
      )
        # squareFrame (getRemSizeDiv (* 4))

figure13 :: (ConstraintRender n b, Enum n) => TDiagram n b
figure13 = renderFigure 0.22 0.27 (25, 12) 5

figure14 :: (ConstraintRender n b, Enum n) => TDiagram n b
figure14 = renderFigure 0.3 0.2 (24, 11) 6

figure15 :: (ConstraintRender n b, Enum n) => TDiagram n b
figure15 = renderFigure 0.25 0.25 (80, 1) 40

figure16 :: (ConstraintRender n b, Enum n) => TDiagram n b
figure16 = renderFigure 0.15 0.35 (10, 3) 10

figure17 :: (ConstraintRender n b, Enum n) => TDiagram n b
figure17 = renderFigure 0.35 0.15 (4, 1) 63

figure18 :: (ConstraintRender n b, Enum n) => TDiagram n b
figure18 = renderFigure 0.4 0.1 (5, 2) 25

figure19 :: (ConstraintRender n b, Enum n) => TDiagram n b
figure19 = renderFigure 0.25 0.25 (7, 3) 99
