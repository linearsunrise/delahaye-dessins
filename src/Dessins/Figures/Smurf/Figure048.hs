{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Smurf.Figure048 (figure048) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Figures.Smurf.Common as C (smurfData)
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import qualified Diagrams as D
import Diagrams.Prelude as DP ((#))

figure048 :: (T.Render n b) => T.TDiagram n b
figure048 =
  C.smurfData
    # U.toDessinFrame
    # D.centerXY
    # D.scaleUToY (getRemSizeDiv (* 3))
    # U.squareFrame (getRemSizeDiv (* 4))
