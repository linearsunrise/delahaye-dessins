{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Figure041 (figure) where

import qualified Dessins.Utils as U

import qualified Dessins.Const as Const

import qualified Dessins.Types as T

import qualified Dessins.Types.Convertable as Convertable
import qualified Dessins.Types.Geometry as G

import Dessins.Figures.Cheval.Common

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
          warp (x, y, _) = (x * abs x, y * abs y, 0)
          createFigure j i =
            chevalData
              # G.translate (by i, by j)
              # G.warp warp
            where
              by t = (fromIntegral t - 1) * 20
   in chevals
        # Convertable.combineFigures
        # Convertable.toDessinFrame
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
