{-# LANGUAGE FlexibleContexts #-}

module Dessins.Utils.Scene (renderTrail) where

import           Data.Typeable    (Typeable)
import           Diagrams.Prelude

renderTrail :: (Typeable n, RealFloat n, Renderable (Path V2 n) b)
            => [Point V2 n]
            -> QDiagram b V2 n Any
renderTrail v = strokeTrail (closeTrail (fromVertices v)) # lw thick # centerXY
