{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Figure035 (figure) where

import qualified Dessins.Utils as U

import qualified Dessins.Const as Const

import qualified Dessins.Types as T

import qualified Dessins.Types.Convertable as Convertable

import Dessins.Figures.Cheval.Common

import qualified Dessins.Types.Geometry.Transformable as G
import qualified Dessins.Types.Geometry.Vector as G

import Diagrams ((#))
import qualified Diagrams as D

figure :: (T.Render n b) => T.TDiagram n b
figure =
  let vertices = 6
      phi = pi / 12

      divideBy = 90

      chevals = [f x | x <- [0 .. (vertices - 1)]]
        where
          ax i = (2 * i * pi / vertices + phi)

          f t =
            chevalData
              # G.translate (G.Vector 0.5 0.5 0)
              # G.rotateZ (ax t)
              # G.scaleBy (1 / divideBy, 1 / divideBy)
   in chevals
        # Convertable.combineFigures
        # Convertable.toDessinFrame
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
