{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Figure040 (figure040) where

import qualified Dessins.Const as Const
import Dessins.Figures.Cheval.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import Diagrams ((#))
import qualified Diagrams as D

figure040 :: (T.Render n b) => T.TDiagram n b
figure040 =
  let iCount = 4 :: Integer
      chevals =
        [ f x y
        | x <- [-iCount .. iCount]
        , y <- [-abs x .. abs x]
        ]
        where
          f j i =
            chevalData
              # U.translate (fromIntegral i * 20, fromIntegral j * 20)
   in chevals
        # U.combineFigures
        # U.toDessinFrame
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
