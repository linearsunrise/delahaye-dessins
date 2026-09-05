{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Lion.Figure045 (figure045) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Figures.Lion.Common as C
  ( lionData
  , lionHeight
  , lionWidth
  )
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import qualified Diagrams as D
import Diagrams.Prelude as DP

figure045 :: (T.Render n b) => T.TDiagram n b
figure045 =
  let rows = 5
      cols = 3

      lions =
        [ f x y
        | x <- [0 .. (cols - 1)]
        , y <- [0 .. (rows - 1)]
        ]
        where
          f i j =
            C.lionData
              # U.scaleBy ((-1) ** j, (-1) ** i)
              # U.translate
                ( (C.lionWidth - 4.5) * i
                , (C.lionHeight - 5) * j
                )
   in lions
        # U.combineFigures
        # U.toDessinFrame
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
