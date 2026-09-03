{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Figure037 (figure037) where

import qualified Dessins.Const as Const
import Dessins.Figures.Cheval.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import Diagrams ((#))
import qualified Diagrams as D

figure037 :: (T.Render n b) => T.TDiagram n b
figure037 =
  let vertices = 6
      phi = pi / 12
      rr = 0.87
      pointsCount = 16

      chevals = mconcat [f x | x <- [0 .. (pointsCount - 1)]]
        where
          ax i = (2 * i * pi / vertices + phi)
          transform i v =
            v
              # U.translate (0.15, 0.15)
              # U.scaleBy (3 / 110, 3 / 110)
              # U.translate (0.5, 0.5)
              # U.rotateBy (ax i)
              # U.scaleBy (rr ** i / 2, rr ** i / 2)

          f t = map (map (transform t)) chevalData
   in chevals
        # getTrailsList
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
