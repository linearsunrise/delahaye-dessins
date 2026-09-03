{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.PolygonesReguliers.Figure003 (figure003) where

import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

figure003 :: (T.Render n b) => T.TDiagram n b
figure003 = U.renderSquareFrame (U.polygonRegulier 3 0)
