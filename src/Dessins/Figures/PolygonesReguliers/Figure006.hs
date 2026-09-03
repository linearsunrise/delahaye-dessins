{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.PolygonesReguliers.Figure006 (figure006) where

import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

figure006 :: (T.Render n b) => T.TDiagram n b
figure006 = U.renderSquareFrame (U.polygonRegulier 20 0)
