{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Figure034 (figure034) where

import qualified Dessins.Const as Const
import Dessins.Figures.Cheval.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import Diagrams ((#))
import qualified Diagrams as D
import qualified Diagrams.Prelude as DP

figure034 :: (T.Render n b) => T.TDiagram n b
figure034 =
  chevalData
    # getTrailsList
    # D.centerXY
    # D.scaleUToY (Const.getRemSizeDiv (* 3))
    # U.squareFrame (Const.getRemSizeDiv (* 4))
