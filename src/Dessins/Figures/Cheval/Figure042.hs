{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Figure042 (figure) where

import qualified Dessins.Const as Const
import Dessins.Figures.Cheval.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import Diagrams ((#))
import qualified Diagrams as D
import qualified Diagrams.Prelude as DP

figure :: (T.Render n b) => T.TDiagram n b
figure =
  let iCount = 4
      chevals =
        mconcat
          [ f x y
          | x <- [-iCount .. iCount]
          , y <- [-iCount .. iCount]
          ]
        where
          warp (x, y) =
            let an =
                  if x == 0 then
                    pi / 2 * signum y
                  else
                    atan (y / x) + pi * (1 - signum x) / 2

                di =
                  sqrt (x ** 2 + y ** 2)
                    # \t -> t / (1 + t) * 0.65
             in (di * cos an, di * sin an)

          transform i j v =
            v
              # U.translate (by i, by j)
              # U.scaleBy (aspect, aspect)
              # warp
            where
              by t = (fromIntegral t - 1) * 20
              aspect = 2 / 80

          f j i = map (map (transform i j)) chevalData
   in chevals
        # getTrailsList
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
