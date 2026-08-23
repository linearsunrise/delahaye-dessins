{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.PolygonesReguliers
  ( figure01
  , figure02
  , figure03
  , figure04
  , figure05
  , figure06
  )
where

import Dessins.Types (ConstraintRender, TDiagram)
import Dessins.Utils.Polygon (polygonRegulier)
import Dessins.Utils.Scene (renderSquareFrame)

figure01 :: (ConstraintRender n b) => TDiagram n b
figure01 = renderSquareFrame (polygonRegulier 4 (pi / 4))

figure02 :: (ConstraintRender n b) => TDiagram n b
figure02 = renderSquareFrame (polygonRegulier 3 (pi / 2))

figure03 :: (ConstraintRender n b) => TDiagram n b
figure03 = renderSquareFrame (polygonRegulier 3 0)

figure04 :: (ConstraintRender n b) => TDiagram n b
figure04 = renderSquareFrame (polygonRegulier 5 0)

figure05 :: (ConstraintRender n b) => TDiagram n b
figure05 = renderSquareFrame (polygonRegulier 8 0)

figure06 :: (ConstraintRender n b) => TDiagram n b
figure06 = renderSquareFrame (polygonRegulier 20 0)
