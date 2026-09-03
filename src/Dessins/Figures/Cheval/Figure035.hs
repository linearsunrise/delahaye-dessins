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
import qualified Diagrams.Prelude as DP

figure035 :: (T.Render n b) => T.TDiagram n b
figure035 =
  let vertices = 6
      phi = pi / 12

      divideBy = 90

      chevals = mconcat [f x | x <- [0 .. (vertices - 1)]]
        where
          ax i = (2 * i * pi / vertices + phi)
          transform t v =
            v
              # U.translate (0.5, 0.5)
              # U.rotateBy (ax t)
              # U.scaleBy (1 / divideBy, 1 / divideBy)

          f t = map (map (transform t)) chevalData
   in chevals
        # getTrailsList
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
