{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.EtoilesRegulieres.Figure011 (figure011) where

import Dessins.Figures.EtoilesRegulieres.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

figure011 :: (T.Render n b) => T.TDiagram n b
figure011 = U.renderSquareFrame (U.polygonEtoile 51 20)
