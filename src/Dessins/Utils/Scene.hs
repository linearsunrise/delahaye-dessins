{-# LANGUAGE FlexibleContexts #-}

module Dessins.Utils.Scene (renderTrail, squareFrame, renderSquareFrame) where

import           Data.Typeable (Typeable)
import           Diagrams.Prelude

renderTrail :: (Typeable n, RealFloat n, Renderable (Path V2 n) b)
            => [Point V2 n]
            -> QDiagram b V2 n Any
renderTrail v =
  strokeTrail (closeTrail (fromVertices v)) # lw ultraThin # centerXY

squareFrame :: (Typeable n, RealFloat n, Renderable (Path V2 n) b)
            => n
            -> QDiagram b V2 n Any
            -> QDiagram b V2 n Any
squareFrame s content = content
  <> square s # fc (sRGB24read "#d0d0d0") # lw none

renderSquareFrame :: (Typeable n, RealFloat n, Renderable (Path V2 n) b)
                  => [Point V2 n]
                  -> QDiagram b V2 n Any
renderSquareFrame = squareFrame 3 . renderTrail