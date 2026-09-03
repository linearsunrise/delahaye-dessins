{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.PolygonesReguliers.Figure001 (figure001) where

import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

figure001 :: (T.Render n b) => T.TDiagram n b
figure001 = U.renderSquareFrame (U.polygonRegulier 4 (pi / 4))
