{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Smurf.Figure049 (figure) where

import qualified Dessins.Utils.Scene as U

import qualified Dessins.Const as Const

import qualified Dessins.Types as T

import qualified Dessins.Types.Convertable as Convertable

import qualified Dessins.Figures.Smurf.Common as C

import qualified Dessins.Types.Geometry.Transformable as G
import qualified Dessins.Types.Geometry.Vector as G

import qualified Diagrams as D
import Diagrams.Prelude as DP ((#))

figure :: (T.Render n b) => T.TDiagram n b
figure =
  let repeats = 7

      list = [createFigure x | x <- [0 .. repeats]]

      createFigure i =
        C.smurfData
          # G.scaleBy (np / 100 * k, np / 100 * k)
          # G.translate (G.Vector (-(k * np)) 0 0)
        where
          k = 0.5 ** i
          np = 480
   in list
        # Convertable.combineFigures
        # Convertable.toDessinFrame
        # D.centerXY
        # D.scaleUToX (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
