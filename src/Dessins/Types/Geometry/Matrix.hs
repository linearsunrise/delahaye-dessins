module Dessins.Types.Geometry.Matrix where

data Matrix n
  = Matrix
      (n, n, n)
      (n, n, n)
      (n, n, n)
  deriving (Eq, Show)
