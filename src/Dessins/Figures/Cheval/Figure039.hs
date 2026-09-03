{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Figure039 (figure039) where

import qualified Dessins.Const as Const
import Dessins.Figures.Cheval.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import Diagrams ((#))
import qualified Diagrams as D

figure039 :: (T.Render n b) => T.TDiagram n b
figure039 =
  let iCount = 3
      jCount = 3
      chevals =
        mconcat
          [ f x y
          | x <- [0 .. (iCount - 1)]
          , y <- [0 .. (jCount - 1)]
          ]
        where
          transform i j v =
            v
              # U.translate (i * 20, j * 20)

          f i j = map (map (transform i j)) chevalData
   in chevals
        # getTrailsList
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
