{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.EtoilesRegulieres
    ( figure07
    , figure08
    , figure09
    , figure10
    , figure11
    , figure12) where

import           Data.Typeable (Typeable)
import           Diagrams.Prelude
import           Dessins.Utils

figure07 :: (Typeable n, RealFloat n, Enum n, Renderable (Path V2 n) b)
         => QDiagram b V2 n Any
figure07 = renderSquareFrame (polygonEtoile 5 2)

figure08 :: (Typeable n, RealFloat n, Enum n, Renderable (Path V2 n) b)
         => QDiagram b V2 n Any
figure08 = renderSquareFrame (polygonEtoile 7 4)

figure09 :: (Typeable n, RealFloat n, Enum n, Renderable (Path V2 n) b)
         => QDiagram b V2 n Any
figure09 = renderSquareFrame (polygonEtoile 20 9)

figure10 :: (Typeable n, RealFloat n, Enum n, Renderable (Path V2 n) b)
         => QDiagram b V2 n Any
figure10 = renderSquareFrame (polygonEtoile 20 7)

figure11 :: (Typeable n, RealFloat n, Enum n, Renderable (Path V2 n) b)
         => QDiagram b V2 n Any
figure11 = renderSquareFrame (polygonEtoile 51 20)

figure12 :: (Typeable n, RealFloat n, Enum n, Renderable (Path V2 n) b)
         => QDiagram b V2 n Any
figure12 = renderSquareFrame (polygonEtoile 51 25)
