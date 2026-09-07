{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Bonus.BonusII (figure) where

import qualified Dessins.Utils as U

import Dessins.Const (getRemSizeDiv)

import qualified Dessins.Types as T

import qualified Dessins.Types.Convertable as Convertable
import qualified Dessins.Types.Geometry as G

import qualified Diagrams as D
import Diagrams.Prelude as DP ((#))

dragonInitCurve :: (Floating a) => G.Path a
dragonInitCurve = G.Path [G.Point 0 0 1, G.Point 0 1 1]

figure :: (T.Render n b) => T.TDiagram n b
figure =
  let rotate90 = G.rotateByZ (pi / 2)

      lastPoint (G.Path xs) = last xs # (\(G.Point px py _) -> (px, py))
      dragon xs n =
        if n <= 0 then
          xs
        else
          rotate90 xs
            # G.setOrigin (lastPoint xs)
            # (\(G.Path ls) -> reverse (G.getPoints xs) ++ drop 1 ls)
            # (\ls -> dragon (G.Path ls) (n - 1))

      dr = dragon dragonInitCurve (12 :: Int)
   in dr
        # Convertable.toDessinFrame
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
