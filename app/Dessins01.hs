{-# LANGUAGE FlexibleContexts #-}

module Main (main) where

import           Diagrams.Backend.SVG.CmdLine
import           Diagrams.Prelude hiding (polygon)
import           Data.Typeable (Typeable)

xAxis :: Floating a => a -> a -> a -> a
xAxis x vertices phi = sin (x * 2 * pi / vertices + phi)

yAxis :: Floating a => a -> a -> a -> a
yAxis x vertices phi = cos (x * 2 * pi / vertices + phi)

polygon :: (Enum p, Floating p) => p -> p -> [P2 p]
polygon vertices phi = [f x | x <- [1 .. vertices]]
  where
    f x = p2 (xAxis x vertices phi, yAxis x vertices phi)

renderTrail :: (Typeable n, RealFloat n, Renderable (Path V2 n) b)
            => [Point V2 n]
            -> QDiagram b V2 n Any
renderTrail v = strokeTrail (closeTrail (fromVertices v)) # lw thick # centerXY

doodle :: Diagram B
doodle = hcat'
  (with & sep .~ 0.5)
  [ renderTrail (polygon 4 (pi / 4))
  , renderTrail (polygon 3 (pi / 2))
  , renderTrail (polygon 3 0)
  , renderTrail (polygon 5 0)
  , renderTrail (polygon 8 0)
  , renderTrail (polygon 20 0)
  , renderTrail (polygon 20 0)]
  # frame 0.5

main :: IO ()
main = mainWith doodle
