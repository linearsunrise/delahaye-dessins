{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeOperators #-}

module Dessins.Utils.Scene (renderTrail, squareFrame, renderSquareFrame) where

import qualified Dessins.Const as Const
import qualified Dessins.Types as T

import qualified Data.Data as Data
import Diagrams.Prelude ((#))
import qualified Diagrams.Prelude as DP

closePath :: DP.Path v n -> DP.Path v n
closePath (DP.Path ts) = DP.Path (map (DP.over DP.located DP.closeTrail) ts)

renderTrail :: (T.Render n b) => [DP.Point DP.V2 n] -> T.TDiagram n b
renderTrail v =
  DP.fromVertices v
    # closePath
    # DP.strokePath
    # DP.lw (DP.global 0.045)

squareFrame ::
  ( DP.HasStyle a
  , DP.TrailLike a
  , DP.V a ~ DP.V2
  , Data.Typeable (DP.N a)
  , Semigroup a
  ) =>
  DP.N a -> a -> a
squareFrame s content =
  content
    <> DP.square s # DP.fc (DP.sRGB24read "#d0d0d0") # DP.lw DP.none

renderSquareFrame ::
  (T.Render n b) => [DP.Point DP.V2 n] -> T.TDiagram n b
renderSquareFrame = squareFrame (Const.getRemSizeDiv (* 4)) . renderTrail
