{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}

module Dessins.Types (ConstraintRender, TDiagram) where

import Data.Typeable (Typeable)
import Diagrams.Prelude (Any, Path, QDiagram, Renderable, V2)
import Diagrams.TwoD.Text (Text)

type ConstraintRender n b =
  ( Typeable n
  , RealFloat n
  , Enum n
  , Num n
  , Renderable (Path V2 n) b
  , Renderable (Text n) b
  )

type TDiagram n b = QDiagram b V2 n Any
