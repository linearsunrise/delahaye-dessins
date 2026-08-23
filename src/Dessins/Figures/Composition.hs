{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Composition
  ( figure13
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

figure13 :: forall n b. (ConstraintRender n b, Enum n) => TDiagram n b
figure13 =
  let starScale = 0.22 / 0.27 -- Взято из книги, радиус композиции = .27,
  -- радиус кругов = .22

      star :: TDiagram n b
      star = renderTrail (polygonEtoile 25 12) # scale starScale

      pointCount = 5
      vertices = [1 .. pointCount]
      phi = 0

      calcVectors t = r2 (xAxis t pointCount phi, yAxis t pointCount phi)

      shiftPoints :: [V2 n]
      shiftPoints = map calcVectors vertices

      createFigure :: V2 n -> TDiagram n b
      createFigure v = star # translate v

      figures :: [TDiagram n b]
      figures = map createFigure shiftPoints
   in squareFrame
        (getRemSizeDiv (* 4))
        (mconcat figures # scale ((starScale + 1) / 3))
