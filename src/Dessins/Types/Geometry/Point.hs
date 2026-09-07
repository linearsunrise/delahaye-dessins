{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeFamilies #-}

module Dessins.Types.Geometry.Point where

data Point n = Point {px :: n, py :: n, pz :: n}
  deriving (Eq, Show)
