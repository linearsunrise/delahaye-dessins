{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.EtoilesRegulieres
  ( figure07
  , figure08
  , figure09
  , figure10
  , figure11
  , figure12
  )
where

import Dessins.Types (ConstraintRender, TDiagram)
import Dessins.Utils.Polygon (polygonEtoile)
import Dessins.Utils.Scene (renderSquareFrame)

figure07 :: (ConstraintRender n b) => TDiagram n b
figure07 = renderSquareFrame (polygonEtoile 5 2)

figure08 :: (ConstraintRender n b) => TDiagram n b
figure08 = renderSquareFrame (polygonEtoile 7 4)

figure09 :: (ConstraintRender n b) => TDiagram n b
figure09 = renderSquareFrame (polygonEtoile 20 9)

figure10 :: (ConstraintRender n b) => TDiagram n b
figure10 = renderSquareFrame (polygonEtoile 20 7)

figure11 :: (ConstraintRender n b) => TDiagram n b
figure11 = renderSquareFrame (polygonEtoile 51 20)

figure12 :: (ConstraintRender n b) => TDiagram n b
figure12 = renderSquareFrame (polygonEtoile 51 25)
