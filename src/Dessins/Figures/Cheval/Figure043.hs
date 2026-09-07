{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Figure043 (figure) where

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
  let iCount = 4 :: Integer
      chevals =
        [ createFigure x y
        | x <- [-iCount .. iCount]
        , y <- [-iCount .. iCount]
        ]
        where
          fn t = abs t ** 0.7 * signum t + 1
          warp (x, y, _) = (fn x, fn y, 0)

          by t = (fromIntegral t - 1) * 20
          getVector i j = G.Vector (by i) (by j) 0

          createFigure j i =
            chevalData
              # G.translate (getVector i j)
              # G.warp warp
   in chevals
        # Convertable.combineFigures
        # Convertable.toDessinFrame
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
