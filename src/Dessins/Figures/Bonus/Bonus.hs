{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Bonus.Bonus (bonus) where

import qualified Dessins.Const as Const
import Dessins.Figures.Cheval.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import Diagrams ((#))
import qualified Diagrams as D
import qualified Diagrams.Prelude as DP

bonus :: (T.Render n b) => T.TDiagram n b
bonus =
  let vertices = 6
      phi = 0

      warp :: (RealFloat a) => (a, a) -> (a, a) -> (a, a)
      warp (x1, y1) (x2, y2) =
        (co * x - si * y, si * x - co * y)
          # DP.bimap add add
        where
          (x, y) = (x2, y2)
          (co, si) = (x1, y1)
          add = (+ 0.5)

      chevals = mconcat [f x | x <- [0 .. (vertices - 1)]]
        where
          f t =
            ( U.xAxis (t / vertices) vertices phi
            , U.yAxis (t / vertices) vertices phi
            )
              # \point -> map (map (warp point)) chevalData
   in chevals
        # getTrailsList
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
