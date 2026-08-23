{-# LANGUAGE FlexibleContexts #-}

module Dessins.Utils.Scene (renderTrail, squareFrame, renderSquareFrame) where

import           Diagrams.Prelude (V2, Point, sRGB24read, lw, none, ultraThin
                                 , closeTrail, fromVertices, centerXY, fc
                                 , strokeTrail, square, ( # ))
import           Dessins.Const (remSize)
import           Dessins.Types (ConstraintRender, TDiagram)

renderTrail :: ConstraintRender n b => [Point V2 n] -> TDiagram n b
renderTrail v =
  strokeTrail (closeTrail (fromVertices v)) # lw ultraThin # centerXY

squareFrame :: ConstraintRender n b => n -> TDiagram n b -> TDiagram n b
squareFrame s content = content
  <> square s # fc (sRGB24read "#d0d0d0") # lw none

renderSquareFrame :: ConstraintRender n b => [Point V2 n] -> TDiagram n b
renderSquareFrame = squareFrame (4 * fromInteger remSize) . renderTrail