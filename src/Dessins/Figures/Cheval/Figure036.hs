{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Figure036 (figure) where

import qualified Dessins.Utils as U

import qualified Dessins.Const as Const

import qualified Dessins.Types as T

import Dessins.Figures.Cheval.Common

import Diagrams ((#))
import qualified Diagrams as D

figure :: (T.Render n b) => T.TDiagram n b
figure =
  let stages = 6
      flips = 2

      chevals =
        [ f x y
        | x <- [0 .. (flips - 1)]
        , y <- [0 .. (stages - 1)]
        ]
        where
          f i j =
            chevalData
              # U.scaleByX ((-1) ** i)
              # U.scaleBy (0.5 ** j, 0.5 ** j)
              # U.translate (0, -(80 * 0.5 ** j))
   in chevals
        # U.combineFigures
        # U.toDessinFrame
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
