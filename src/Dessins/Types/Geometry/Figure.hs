{-# LANGUAGE TypeFamilies #-}

module Dessins.Types.Geometry.Figure where

import Dessins.Types.Geometry.Path
import Dessins.Types.Geometry.Transformable (Transformable (..))

newtype Figure n = Figure [Path n]
  deriving (Eq, Show)

instance (Floating n) => Transformable (Figure n) where
  type Scalar (Figure n) = n

  apply matrix (Figure pts) =
    Figure (map (apply matrix) pts)

  translate offset (Figure pts) =
    Figure (map (translate offset) pts)

  setOrigin offset (Figure pts) =
    Figure (map (setOrigin offset) pts)

  rotateByX theta (Figure pts) =
    Figure (map (rotateByX theta) pts)

  rotateByY theta (Figure pts) =
    Figure (map (rotateByY theta) pts)

  rotateByZ theta (Figure pts) =
    Figure (map (rotateByZ theta) pts)

  scaleBy scale (Figure pts) =
    Figure (map (scaleBy scale) pts)

  scaleByX x (Figure pts) =
    Figure (map (scaleByX x) pts)

  scaleByY y (Figure pts) =
    Figure (map (scaleByY y) pts)

  flipX (Figure pts) =
    Figure (map flipX pts)

  flipY (Figure pts) =
    Figure (map flipY pts)

  flipXY (Figure pts) =
    Figure (map flipXY pts)

  warp fn (Figure ps) =
    Figure (map (warp fn) ps)

getPaths :: Figure n -> [Path n]
getPaths (Figure paths) = paths
