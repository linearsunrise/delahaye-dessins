{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Figure043 (figure043) where

import qualified Dessins.Const as Const
import Dessins.Figures.Cheval.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import Diagrams ((#))
import qualified Diagrams as D

figure043 :: (T.Render n b) => T.TDiagram n b
figure043 =
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

          createFigure j i =
            chevalData
              # U.translate (by i, by j)
              # U.warp warp
   in chevals
        # U.combineFigures
        # U.toDessinFrame
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
