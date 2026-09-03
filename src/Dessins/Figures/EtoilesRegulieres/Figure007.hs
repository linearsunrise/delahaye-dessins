{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.EtoilesRegulieres.Figure007 (figure007) where

import Dessins.Figures.EtoilesRegulieres.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

figure007 :: (T.Render n b) => T.TDiagram n b
figure007 = U.renderSquareFrame (U.polygonEtoile 5 2)
