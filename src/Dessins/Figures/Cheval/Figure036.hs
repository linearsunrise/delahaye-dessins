{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Figure036 (figure036) where

import qualified Dessins.Const as Const
import Dessins.Figures.Cheval.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import Diagrams ((#))
import qualified Diagrams as D

figure036 :: (T.Render n b) => T.TDiagram n b
figure036 =
  let stages = 6
      flips = 2 :: Integer

      chevals =
        mconcat
          [ f x y
          | x <- [0 .. (flips - 1)]
          , y <- [0 .. (stages - 1)]
          ]
        where
          transform i j dt =
            ( if even i then
                dt
              else
                dt # U.flipX
            )
              # U.scaleBy (0.5 ** j, 0.5 ** j)
              # U.translate (0, -(80 * 0.5 ** j))

          f t u = map (map (transform t u)) chevalData
   in chevals
        # getTrailsList
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
