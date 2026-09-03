{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.EtoilesRegulieres.Figure012 (figure012) where

import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

figure012 :: (T.Render n b) => T.TDiagram n b
figure012 = U.renderSquareFrame (U.polygonEtoile 51 25)
