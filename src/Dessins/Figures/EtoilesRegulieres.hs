{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.EtoilesRegulieres
  ( figure07
  , figure08
  , figure09
  , figure10
  , figure11
  , figure12
  )
where

import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

figure07 :: (T.Render n b) => T.TDiagram n b
figure07 = U.renderSquareFrame (U.polygonEtoile 5 2)

figure08 :: (T.Render n b) => T.TDiagram n b
figure08 = U.renderSquareFrame (U.polygonEtoile 7 4)

figure09 :: (T.Render n b) => T.TDiagram n b
figure09 = U.renderSquareFrame (U.polygonEtoile 20 9)

figure10 :: (T.Render n b) => T.TDiagram n b
figure10 = U.renderSquareFrame (U.polygonEtoile 20 7)

figure11 :: (T.Render n b) => T.TDiagram n b
figure11 = U.renderSquareFrame (U.polygonEtoile 51 20)

figure12 :: (T.Render n b) => T.TDiagram n b
figure12 = U.renderSquareFrame (U.polygonEtoile 51 25)
