{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.PolygonesReguliers
  ( figure01
  , figure02
  , figure03
  , figure04
  , figure05
  , figure06
  )
where

import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

figure01 :: (T.Render n b) => T.TDiagram n b
figure01 = U.renderSquareFrame (U.polygonRegulier 4 (pi / 4))

figure02 :: (T.Render n b) => T.TDiagram n b
figure02 = U.renderSquareFrame (U.polygonRegulier 3 (pi / 2))

figure03 :: (T.Render n b) => T.TDiagram n b
figure03 = U.renderSquareFrame (U.polygonRegulier 3 0)

figure04 :: (T.Render n b) => T.TDiagram n b
figure04 = U.renderSquareFrame (U.polygonRegulier 5 0)

figure05 :: (T.Render n b) => T.TDiagram n b
figure05 = U.renderSquareFrame (U.polygonRegulier 8 0)

figure06 :: (T.Render n b) => T.TDiagram n b
figure06 = U.renderSquareFrame (U.polygonRegulier 20 0)
