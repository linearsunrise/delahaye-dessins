{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Figure041 (figure) where

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
          transform i j v =
            v
              # U.translate (by i, by j)
              # DP.bimap warp warp
            where
              by t = (fromIntegral t - 1) * 20
              warp x = x * abs x

          f j i = map (map (transform i j)) chevalData
   in chevals
        # getTrailsList
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
