{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Bonus.BonusIV (figure) where

import qualified Dessins.Utils as U

import Dessins.Const (getRemSizeDiv)

import qualified Dessins.Types as T

import qualified Dessins.Types.Convertable as Convertable
import qualified Dessins.Types.Geometry as G

import qualified Diagrams as D
import Diagrams.Prelude as DP ((#))
import qualified Dessins.Types.Geometry.Point as Point

figure :: (T.Render n b) => T.TDiagram n b
figure =
  let vector = G.Point 0 10 0 # G.rotateByZ (pi / 2)
      n = 200
      g phi = 1 / (2 * cos phi)

      f 0 _ _ figureData = figureData
      f m phi lastPoint figureData =
        f (m - 1) phi lp d
        where
          scaleFactor = g phi ** m * ((-1) ** (m + 1))
          rotateAngle = phi * m
          vec =
            vector
              # G.scaleBy (scaleFactor, scaleFactor)
              # G.rotateByZ rotateAngle

          lp =
            lastPoint
              # G.translate (Point.px vec, Point.py vec)
          d = lp : figureData

      angle = (36 * (pi / 180))
      initData = []
      comprehensionBy x = f x angle (G.Point 0 1 0) initData

      list = comprehensionBy n
   in G.Path list
        # Convertable.toDessinFrame
        # D.centerXY
        # D.scaleUToX (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
