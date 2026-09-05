{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Figure035 (figure035) where

import qualified Dessins.Const as Const
import Dessins.Figures.Cheval.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import Diagrams ((#))
import qualified Diagrams as D

figure035 :: (T.Render n b) => T.TDiagram n b
figure035 =
  let vertices = 6
      phi = pi / 12

      divideBy = 90

      chevals = [f x | x <- [0 .. (vertices - 1)]]
        where
          ax i = (2 * i * pi / vertices + phi)

          f t =
            chevalData
              # U.translate (0.5, 0.5)
              # U.rotateByZ (ax t)
              # U.scaleBy (1 / divideBy, 1 / divideBy)
   in chevals
        # U.combineFigures
        # U.toDessinFrame
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
