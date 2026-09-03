{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.EtoilesRegulieres.Figure009 (figure009) where

import Dessins.Figures.EtoilesRegulieres.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

figure009 :: (T.Render n b) => T.TDiagram n b
figure009 = U.renderSquareFrame (U.polygonEtoile 20 9)
