{-# LANGUAGE TypeFamilies #-}

module Dessins.Types.Geometry.Path where

import Dessins.Types.Geometry.Point
import Dessins.Types.Geometry.Transformable

newtype Path n = Path [Point n]
  deriving (Eq, Show)

instance (Floating n) => Transformable (Path n) where
  type Scalar (Path n) = n

  apply matrix (Path ps) =
    Path (map (apply matrix) ps)

  translate offset (Path ps) =
    Path (map (translate offset) ps)

  setOrigin offset (Path ps) =
    Path (map (setOrigin offset) ps)

  rotateByX theta (Path ps) =
    Path (map (rotateByX theta) ps)

  rotateByY theta (Path ps) =
    Path (map (rotateByY theta) ps)

  rotateByZ theta (Path ps) =
    Path (map (rotateByZ theta) ps)

  scaleBy scale (Path ps) =
    Path (map (scaleBy scale) ps)

  scaleByX x (Path ps) =
    Path (map (scaleByX x) ps)

  scaleByY y (Path ps) =
    Path (map (scaleByY y) ps)

  flipX (Path ps) =
    Path (map flipX ps)

  flipY (Path ps) =
    Path (map flipY ps)

  flipXY (Path ps) =
    Path (map flipXY ps)

  warp fn (Path ps) =
    Path (map (warp fn) ps)

getPoints :: Path n -> [Point n]
getPoints (Path points) = points
