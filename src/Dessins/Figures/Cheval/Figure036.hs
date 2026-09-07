{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Figure036 (figure) where

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
              # G.scaleByX ((-1) ** i)
              # G.scaleBy (0.5 ** j, 0.5 ** j)
              # G.translate (0, -(80 * 0.5 ** j))
   in chevals
        # Convertable.combineFigures
        # Convertable.toDessinFrame
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
