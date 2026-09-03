{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.PolygonesReguliers.Figure002 (figure002) where

import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

figure002 :: (T.Render n b) => T.TDiagram n b
figure002 = U.renderSquareFrame (U.polygonRegulier 3 (pi / 2))
