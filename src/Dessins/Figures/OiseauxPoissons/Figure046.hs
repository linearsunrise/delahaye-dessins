{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.OiseauxPoissons.Figure046 (figure046) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Figures.OiseauxPoissons.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import qualified Diagrams as D
import Diagrams.Prelude as DP ((#))

figure046 :: (T.Render n b) => T.TDiagram n b
figure046 =
  lionData
    # getPathsList
    # D.centerXY
    # D.scaleUToX (getRemSizeDiv (* 3))
    # U.squareFrame (getRemSizeDiv (* 4))
