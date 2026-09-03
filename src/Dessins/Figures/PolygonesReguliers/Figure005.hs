{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.PolygonesReguliers.Figure005 (figure005) where

import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

figure005 :: (T.Render n b) => T.TDiagram n b
figure005 = U.renderSquareFrame (U.polygonRegulier 8 0)
