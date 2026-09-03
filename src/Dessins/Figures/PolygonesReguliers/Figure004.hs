{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.PolygonesReguliers.Figure004 (figure004) where

import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

figure004 :: (T.Render n b) => T.TDiagram n b
figure004 = U.renderSquareFrame (U.polygonRegulier 5 0)
