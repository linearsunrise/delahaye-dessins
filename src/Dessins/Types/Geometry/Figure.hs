{-# LANGUAGE TypeFamilies #-}

module Dessins.Types.Geometry.Figure where

import Dessins.Types.Geometry.Path

newtype Figure n = Figure [Path n]
  deriving (Eq, Show)

getPaths :: Figure n -> [Path n]
getPaths (Figure paths) = paths
