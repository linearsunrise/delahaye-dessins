{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Figure039 (figure) where

import qualified Dessins.Utils as U

import qualified Dessins.Const as Const

import qualified Dessins.Types as T

import qualified Dessins.Types.Convertable as Convertable

import Dessins.Figures.Cheval.Common

import qualified Dessins.Types.Geometry.Transformable as G
import qualified Dessins.Types.Geometry.Vector as G

import Diagrams ((#))
import qualified Diagrams as D

figure :: (T.Render n b) => T.TDiagram n b
figure =
  let iCount = 3
      jCount = 3
      chevals =
        [ createFigure x y
        | x <- [0 .. (iCount - 1)]
        , y <- [0 .. (jCount - 1)]
        ]
        where
          createFigure i j =
            chevalData
              # G.translate (G.Vector (i * 20) (j * 20) 0)
   in chevals
        # Convertable.combineFigures
        # Convertable.toDessinFrame
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
