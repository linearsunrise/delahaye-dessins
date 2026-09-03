{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Bonus.TriangleFigure (triangleFigure) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Figures.OiseauxPoissons.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils as D
import qualified Dessins.Utils as U

import qualified Diagrams as D
import Diagrams.Prelude as DP (Bifunctor (bimap), (#))

triangleFigure :: (T.Render n b) => T.TDiagram n b
triangleFigure =
  let vector = (0, 10) # U.rotateBy (pi / 2)
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
              # U.rotateBy rotateAngle

          lp =
            lastPoint
              # U.translate vec
          d = lp : figureData

      angle = (59.5 * (pi / 180))
      initData = []
      comprehensionBy x = f x angle (0, 1) initData

      list = comprehensionBy n
   in list
        # createPath
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
