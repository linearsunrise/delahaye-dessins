{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.EtoilesRegulieres.Figure010 (figure010) where

import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

figure010 :: (T.Render n b) => T.TDiagram n b
figure010 = U.renderSquareFrame (U.polygonEtoile 20 7)
