{-# LANGUAGE TypeFamilies #-}

module Dessins.Types.Geometry.Transformable where

import Dessins.Types.Geometry.Matrix (Matrix)

class Transformable a where
  type Scalar a

  apply :: Matrix (Scalar a) -> a -> a
  translate :: (Scalar a, Scalar a) -> a -> a
  setOrigin :: (Scalar a, Scalar a) -> a -> a
  rotateByX :: Scalar a -> a -> a
  rotateByY :: Scalar a -> a -> a
  rotateByZ :: Scalar a -> a -> a
  scaleBy :: (Scalar a, Scalar a) -> a -> a
  scaleByX :: Scalar a -> a -> a
  scaleByY :: Scalar a -> a -> a
  flipX :: a -> a
  flipY :: a -> a
  flipXY :: a -> a
  warp ::
    ((Scalar a, Scalar a, Scalar a) -> (Scalar a, Scalar a, Scalar a))
    -> a
    -> a
