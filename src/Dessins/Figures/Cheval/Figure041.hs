{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Figure041 (figure041) where

import qualified Dessins.Const as Const
import Dessins.Figures.Cheval.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import Diagrams ((#))
import qualified Diagrams as D

figure041 :: (T.Render n b) => T.TDiagram n b
figure041 =
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
              # U.translate (by i, by j)
              # U.warp warp
            where
              by t = (fromIntegral t - 1) * 20
   in chevals
        # U.combineFigures
        # U.toDessinFrame
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
