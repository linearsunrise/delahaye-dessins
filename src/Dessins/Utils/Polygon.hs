module Dessins.Utils.Polygon
  ( axis
  , xAxis
  , yAxis
  , polygonRegulier
  , polygonEtoile
  )
where

import Dessins.Const (remSize)

import Diagrams.Prelude (P2, p2)

axis :: (Floating a) => a -> (a -> a) -> a -> a -> a
axis x fn vertices phi =
  (3 / 2) * fromInteger remSize * fn (x * 2 * pi / vertices + phi)

xAxis :: (Floating a) => a -> a -> a -> a
xAxis x = axis x sin

yAxis :: (Floating a) => a -> a -> a -> a
yAxis x = axis x cos

polygonRegulier :: (Enum p, Floating p) => p -> p -> [P2 p]
polygonRegulier vertices phi = [f x | x <- [1 .. vertices]]
  where
    point x = (xAxis x vertices phi, yAxis x vertices phi)
    f x = p2 (point x)

polygonEtoile :: (Enum p, Floating p) => p -> p -> [P2 p]
polygonEtoile vertices step = [f x | x <- [1 .. vertices]]
  where
    f x = p2 (xAxis x (vertices / step) 0, yAxis x (vertices / step) 0)
