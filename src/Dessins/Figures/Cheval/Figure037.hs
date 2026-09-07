{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Figure037 (figure) where

import qualified Dessins.Utils as U

import qualified Dessins.Const as Const

import qualified Dessins.Types as T

import qualified Dessins.Types.Convertable as Convertable

import Dessins.Figures.Cheval.Common

import qualified Dessins.Types.Geometry.Figure as G
import qualified Dessins.Types.Geometry.Transformable as G
import qualified Dessins.Types.Geometry.Vector as G

import Diagrams ((#))
import qualified Diagrams as D

figure :: forall n b. (T.Render n b) => T.TDiagram n b
figure =
  let vertices = 6

      phi = pi / 12

      rr = 0.87

      pointsCount = 16

      ax i =
        2 * i * pi / vertices + phi

      chevals =
        [ createFigure i
        | i <- [0 .. pointsCount - 1]
        ]
        where
          createFigure :: Int -> G.Figure n
          createFigure i =
            chevalData
              # G.translate (G.Vector 0.15 0.15 0)
              # G.scaleBy (3 / 110, 3 / 110)
              # G.translate (G.Vector 0.5 0.5 0)
              # G.rotateZ (ax a)
              # G.scaleBy (rr ** a / 2, rr ** a / 2)
            where
              a :: n
              a = fromIntegral i
   in chevals
        # Convertable.combineFigures
        # Convertable.toDessinFrame
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
