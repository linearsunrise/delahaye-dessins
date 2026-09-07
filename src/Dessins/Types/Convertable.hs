{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeFamilies #-}

module Dessins.Types.Convertable where

import qualified Dessins.Types as T

import Dessins.Types.Geometry (Point (Point))

import Dessins.Types.Geometry.Figure
import Dessins.Types.Geometry.Path

import Data.Function ((&))
import qualified Diagrams as D
import qualified Diagrams.Prelude as DP

class Convertable a where
  type UpperType a

  toDessinFrame ::
    (T.Render (UpperType a) b) => a -> T.TDiagram (UpperType a) b

instance Convertable (Path a) where
  type UpperType (Path a) = a

  toDessinFrame d =
    toVertices d
      D.# D.fromVertices
      D.# D.strokePath
      D.# D.lw (D.global 0.045)
      D.# D.fc DP.red
      D.# D.lineJoin D.LineJoinBevel

instance Convertable (Figure a) where
  type UpperType (Figure a) = a

  toDessinFrame (Figure ps) = combineFrames ps
    where
      combineFrames :: (T.Render n b) => [Path n] -> T.TDiagram n b
      combineFrames = mconcat . map toDessinFrame

toVertices :: Path n -> [D.Point D.V2 n]
toVertices (Path pts) =
  map
    (\(Point x y _) -> D.p2 (x, y))
    pts

combineFigures :: [Figure n] -> Figure n
combineFigures figures =
  concatMap (\(Figure ps) -> ps) figures
    & Figure
