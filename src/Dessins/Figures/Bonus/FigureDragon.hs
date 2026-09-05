{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Bonus.FigureDragon (figureDragon) where

import Dessins.Const (getRemSizeDiv)
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import qualified Diagrams as D
import Diagrams.Prelude as DP ((#))

dragonInitCurve :: (Floating a) => U.Path a
dragonInitCurve = U.Path [U.Point 0 0 0, U.Point 0 1 0]

figureDragon :: (T.Render n b) => T.TDiagram n b
figureDragon =
  let rotate90 = U.rotateByZ (pi / 2)

      lastPoint (U.Path xs) = last xs # (\(U.Point px py _) -> (px, py))
      dragon xs n =
        if n <= 0 then
          xs
        else
          rotate90 xs
            # U.setOrigin (lastPoint xs)
            # (\(U.Path ls) -> reverse (U.getPoints xs) ++ drop 1 ls)
            # (\ls -> dragon (U.Path ls) (n - 1))

      dr = dragon dragonInitCurve (12 :: Int)
   in dr
        # U.toDessinFrame
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
