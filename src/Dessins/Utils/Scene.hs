{-# LANGUAGE FlexibleContexts #-}

module Dessins.Utils.Scene (renderTrail, squareFrame, renderSquareFrame) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Types (ConstraintRender, TDiagram)

import Diagrams.Prelude
  ( Path (Path)
  , Point
  , V2
  , closeTrail
  , fc
  , fromVertices
  , located
  , lw
  , none
  , over
  , sRGB24read
  , square
  , strokePath
  , ultraThin
  , (#)
  )

closePath :: Path v n -> Path v n
closePath (Path ts) = Path (map (over located closeTrail) ts)

renderTrail :: (ConstraintRender n b) => [Point V2 n] -> TDiagram n b
renderTrail v =
    fromVertices v
    # closePath
    # strokePath
    # lw ultraThin

squareFrame ::
  (ConstraintRender n b) => n -> TDiagram n b -> TDiagram n b
squareFrame s content =
  content
    <> square s # fc (sRGB24read "#d0d0d0") # lw none

renderSquareFrame ::
  (ConstraintRender n b) => [Point V2 n] -> TDiagram n b
renderSquareFrame = squareFrame (getRemSizeDiv (* 4)) . renderTrail
