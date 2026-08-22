{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.PolygonesReguliers
    ( figure01
    , figure02
    , figure03
    , figure04
    , figure05
    , figure06) where

import           Data.Typeable (Typeable)
import           Diagrams.Prelude hiding (polygon)
import           Dessins.Utils

figure01 :: (Typeable n, RealFloat n, Enum n, Renderable (Path V2 n) b)
         => QDiagram b V2 n Any
figure01 = renderSquareFrame (polygon 4 (pi / 4))

figure02 :: (Typeable n, RealFloat n, Enum n, Renderable (Path V2 n) b)
         => QDiagram b V2 n Any
figure02 = renderSquareFrame (polygon 3 (pi / 2))

figure03 :: (Typeable n, RealFloat n, Enum n, Renderable (Path V2 n) b)
         => QDiagram b V2 n Any
figure03 = renderSquareFrame (polygon 3 0)

figure04 :: (Typeable n, RealFloat n, Enum n, Renderable (Path V2 n) b)
         => QDiagram b V2 n Any
figure04 = renderSquareFrame (polygon 5 0)

figure05 :: (Typeable n, RealFloat n, Enum n, Renderable (Path V2 n) b)
         => QDiagram b V2 n Any
figure05 = renderSquareFrame (polygon 8 0)

figure06 :: (Typeable n, RealFloat n, Enum n, Renderable (Path V2 n) b)
         => QDiagram b V2 n Any
figure06 = renderSquareFrame (polygon 20 0)
