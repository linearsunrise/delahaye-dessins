{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeOperators #-}

module Dessins.Utils.Grid (hor, ver, group) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Types (ConstraintRender, TDiagram)

import Diagrams.Prelude
  ( HasOrigin
  , Juxtaposable
  , N
  , V
  , V2
  , fontSize
  , hcat'
  , local
  , sep
  , text
  , vcat'
  , with
  , (#)
  , (&)
  , (.~)
  )

hor ::
  (Floating (N a), HasOrigin a, Juxtaposable a, Monoid a, V a ~ V2) =>
  N a
  -> [a]
  -> a
hor gapss = hcat' (with & sep .~ gapss)

ver ::
  (Floating (N a), HasOrigin a, Juxtaposable a, Monoid a, V a ~ V2) =>
  N a
  -> [a]
  -> a
ver gapss = vcat' (with & sep .~ gapss)

group ::
  (ConstraintRender n b) => String -> [TDiagram n b] -> TDiagram n b
group title ct =
  ver
    (getRemSizeDiv (/ 2))
    [ text title # fontSize (local (getRemSizeDiv (/ 4)))
    , hor (getRemSizeDiv (/ 2)) ct
    ]
