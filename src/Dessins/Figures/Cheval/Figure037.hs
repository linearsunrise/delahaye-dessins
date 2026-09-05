{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Figure037 (figure) where

import qualified Dessins.Utils as U

import qualified Dessins.Const as Const

import qualified Dessins.Types as T

import Dessins.Figures.Cheval.Common

import Diagrams ((#))
import qualified Diagrams as D

figure :: forall n b. (T.Render n b) => T.TDiagram n b
figure =
  let vertices :: n
      vertices = 6

      phi :: n
      phi = pi / 12

      rr :: n
      rr = 0.87

      pointsCount :: Int
      pointsCount = 16

      ax :: n -> n
      ax i =
        2 * i * pi / vertices + phi

      chevals :: [U.Figure n]
      chevals =
        [ createFigure i
        | i <- [0 .. pointsCount - 1]
        ]
        where
          createFigure :: Int -> U.Figure n
          createFigure i =
            chevalData
              # U.translate (0.15, 0.15)
              # U.scaleBy (3 / 110, 3 / 110)
              # U.translate (0.5, 0.5)
              # U.rotateByZ (ax a)
              # U.scaleBy (rr ** a / 2, rr ** a / 2)
            where
              a :: n
              a = fromIntegral i
   in chevals
        # U.combineFigures
        # U.toDessinFrame
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
