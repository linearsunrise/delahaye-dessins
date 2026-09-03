{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.EtoilesRegulieres.Figure008 (figure008) where

import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

figure008 :: (T.Render n b) => T.TDiagram n b
figure008 = U.renderSquareFrame (U.polygonEtoile 7 4)
