{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Smurf.Figure049 (figure) where

import qualified Dessins.Utils as U

import Dessins.Const (getRemSizeDiv)

import qualified Dessins.Types as T


import qualified Diagrams as D
import Diagrams.Prelude as DP ((#))
import qualified Dessins.Figures.Smurf.Common as C

figure :: (T.Render n b) => T.TDiagram n b
figure =
  let repeats = 7
    
      list = [createFigure x | x <- [0..repeats]]

      createFigure i =
        C.smurfData
          # U.scaleBy (np / 100 * k, np / 100 * k)
          # U.translate (-(k * np), 0)
            where
              k = 0.5 ** i
              np = 480
  in list
    # U.combineFigures
    # U.toDessinFrame
    # D.centerXY
    # D.scaleUToX (getRemSizeDiv (* 3))
    # U.squareFrame (getRemSizeDiv (* 4))
