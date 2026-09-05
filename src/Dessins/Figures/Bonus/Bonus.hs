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

bonus :: (T.Render n b) => T.TDiagram n b
bonus =
  let vertices = 6
      phi = 0

      warp :: (RealFloat a) => (a, a, a) -> (a, a, a) -> (a, a, a)
      warp (x1, y1, _) (x2, y2, _) =
        (add (co * x - si * y), add (si * x - co * y), 0)
        where
          (x, y) = (x2, y2)
          (co, si) = (x1, y1)
          add = (+ 0.5)

      warpWith t =
        warp
          ( U.xAxis (t / vertices) vertices phi
          , U.yAxis (t / vertices) vertices phi
          , 0
          )

      chevals = [createFigure x | x <- [0 .. (vertices - 1)]]
        where
          createFigure t =
            chevalData
              # U.warp (warpWith t)
   in chevals
        # U.combineFigures
        # U.toDessinFrame
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
