{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Figure038 (figure038) where

import qualified Dessins.Const as Const
import Dessins.Figures.Cheval.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import Diagrams ((#))
import qualified Diagrams as D

figure038 :: (T.Render n b) => T.TDiagram n b
figure038 =
  let pointsCount = 6
      chevals =
        [ createFigure x y
        | x <- [0 .. (pointsCount - 1)]
        , y <- [0 .. ((2 ** x) - 1)]
        ]
        where
          createFigure i j =
            chevalData
              # U.scaleBy (1 / 40, 1 / 40)
              # U.translate (j, 0)
              # U.scaleBy (0.5 ** i, 0.5 ** i)
              # U.translate (0, 2 - 2 * 0.5 ** i)
   in chevals
        # U.combineFigures
        # U.toDessinFrame
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
