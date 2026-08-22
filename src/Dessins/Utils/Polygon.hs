module Dessins.Utils.Polygon (axis, xAxis, yAxis, polygon, polygonEtoile) where

import           Diagrams.Prelude hiding (polygon)

axis :: Floating a => a -> (a -> a) -> a -> a -> a
axis x fn vertices phi = fn (x * 2 * pi / vertices + phi)

xAxis :: Floating a => a -> a -> a -> a
xAxis x = axis x sin

yAxis :: Floating a => a -> a -> a -> a
yAxis x = axis x cos

polygon :: (Enum p, Floating p) => p -> p -> [P2 p]
polygon vertices phi = [f x | x <- [1 .. vertices]]
  where
    f x = p2 (xAxis x vertices phi, yAxis x vertices phi)

polygonEtoile :: (Enum p, Floating p) => p -> p -> [P2 p]
polygonEtoile vertices step = [f x | x <- [1 .. vertices]]
  where
    f x = p2 (xAxis x (vertices / step) 0, yAxis x (vertices / step) 0)