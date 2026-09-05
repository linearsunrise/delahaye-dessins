{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Bonus.TriangleFigureA (triangleFigure) where

import Dessins.Const (getRemSizeDiv)
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import qualified Diagrams as D
import Diagrams.Prelude as DP ((#))

triangleFigure :: (T.Render n b) => T.TDiagram n b
triangleFigure =
  let vector = U.Point 0 10 0 # U.rotateByZ (pi / 2)
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
              # U.scaleBy (scaleFactor, scaleFactor)
              # U.rotateByZ rotateAngle

          lp =
            lastPoint
              # U.translate (U.px vec, U.py vec)
          d = lp : figureData

      angle = (59.5 * (pi / 180))
      initData = []
      comprehensionBy x = f x angle (U.Point 0 1 0) initData

      list = comprehensionBy n
   in U.Path list
        # U.toDessinFrame
        # D.centerXY
        # D.scaleUToX (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
