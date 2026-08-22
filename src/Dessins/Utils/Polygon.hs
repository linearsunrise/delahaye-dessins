module Dessins.Utils.Polygon (axis, xAxis, yAxis, polygon) where

import           Diagrams.Prelude hiding (polygon)

axis x fn vertices phi = fn (x * 2 * pi / vertices + phi)

xAxis :: Floating a => a -> a -> a -> a
xAxis x vertices phi = axis x sin vertices phi

yAxis :: Floating a => a -> a -> a -> a
yAxis x vertices phi = axis x cos vertices phi

polygon :: (Enum p, Floating p) => p -> p -> [P2 p]
polygon vertices phi = [f x | x <- [1 .. vertices]]
  where
    f x = p2 (xAxis x vertices phi, yAxis x vertices phi)