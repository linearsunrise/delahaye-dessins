{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Lion.Figure045 (figure) where

import qualified Dessins.Utils as U

import Dessins.Const (getRemSizeDiv)

import qualified Dessins.Types as T

import qualified Dessins.Types.Convertable as Convertable
import qualified Dessins.Types.Geometry as G

import Dessins.Figures.Lion.Common as C
  ( lionData
  , lionHeight
  , lionWidth
  )

import qualified Diagrams as D
import Diagrams.Prelude as DP

figure :: (T.Render n b) => T.TDiagram n b
figure =
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
              # G.scaleBy ((-1) ** j, (-1) ** i)
              # G.translate
                ( (C.lionWidth - 4.5) * i
                , (C.lionHeight - 5) * j
                )
   in lions
        # Convertable.combineFigures
        # Convertable.toDessinFrame
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
