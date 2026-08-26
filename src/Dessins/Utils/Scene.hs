{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeOperators #-}

module Dessins.Utils.Scene (renderTrail, squareFrame, renderSquareFrame) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Types (ConstraintRender, TDiagram)

import Data.Data (Typeable)
import Diagrams.Prelude
  ( HasStyle
  , N
  , Path (Path)
  , Point
  , TrailLike
  , V
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
  (HasStyle a, Semigroup a, TrailLike a, Typeable (N a), V a ~ V2) =>
  N a -> a -> a
squareFrame s content =
  content
    <> square s # fc (sRGB24read "#d0d0d0") # lw none

renderSquareFrame ::
  (ConstraintRender n b) => [Point V2 n] -> TDiagram n b
renderSquareFrame = squareFrame (getRemSizeDiv (* 4)) . renderTrail
