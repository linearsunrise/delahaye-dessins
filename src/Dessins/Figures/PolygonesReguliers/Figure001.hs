{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.PolygonesReguliers.Figure001 (figure) where

import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

import qualified Dessins.Types as T

figure :: (T.Render n b) => T.TDiagram n b
figure = U.renderSquareFrame (U.polygonRegulier 4 (pi / 4))
