{-# LANGUAGE TypeFamilies #-}

module Dessins.Types.Geometry.Path where

import Dessins.Types.Geometry.Point

newtype Path n = Path [Point n]
  deriving (Eq, Show)

getPoints :: Path n -> [Point n]
getPoints (Path points) = points
