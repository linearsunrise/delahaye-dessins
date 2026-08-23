{-# LANGUAGE FlexibleContexts #-}

module Dessins.Utils.Scene (renderTrail, squareFrame, renderSquareFrame) where

import Dessins.Const (remSize)
import Dessins.Types (ConstraintRender, TDiagram)

import Diagrams.Prelude
  ( Point
  , V2
  , centerXY
  , closeTrail
  , fc
  , fromVertices
  , lw
  , none
  , sRGB24read
  , square
  , strokeTrail
  , ultraThin
  , (#)
  )

renderTrail :: (ConstraintRender n b) => [Point V2 n] -> TDiagram n b
renderTrail v =
  strokeTrail (closeTrail (fromVertices v)) # lw ultraThin # centerXY

squareFrame ::
  (ConstraintRender n b) => n -> TDiagram n b -> TDiagram n b
squareFrame s content =
  content
    <> square s # fc (sRGB24read "#d0d0d0") # lw none

renderSquareFrame ::
  (ConstraintRender n b) => [Point V2 n] -> TDiagram n b
renderSquareFrame = squareFrame (4 * fromInteger remSize) . renderTrail
