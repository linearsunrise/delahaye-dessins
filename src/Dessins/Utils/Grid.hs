{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeOperators #-}

module Dessins.Utils.Grid (hor, ver, group) where

import           Diagrams.Prelude (V2, HasOrigin, Juxtaposable, N, V, (&), local
                                 , sep, alignTR, hcat', vcat', fontSize, text
                                 , ( # ), with, (.~))
import           Dessins.Const (getRemSizeDiv)
import           Dessins.Types (TDiagram, ConstraintRender)

hor :: (V a ~ V2, Floating (N a), Juxtaposable a, HasOrigin a, Monoid a)
    => N a
    -> [a]
    -> a
hor gapss = hcat' (with & sep .~ gapss)

ver :: (V a ~ V2, Floating (N a), Juxtaposable a, HasOrigin a, Monoid a)
    => N a
    -> [a]
    -> a
ver gapss = vcat' (with & sep .~ gapss)

group :: ConstraintRender n b => String -> [TDiagram n b] -> TDiagram n b
group title ct = ver
  (getRemSizeDiv (/ 2))
  [ text title # fontSize (local (getRemSizeDiv (/ 4))) # alignTR
  , hor (getRemSizeDiv (/ 2)) ct]
  # alignTR