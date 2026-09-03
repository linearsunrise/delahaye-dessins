{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Bonus.FigureDragon (figureDragon) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Figures.OiseauxPoissons.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils as D
import qualified Dessins.Utils as U

import qualified Diagrams as D
import Diagrams.Prelude as DP (Bifunctor (bimap), (#))

figureDragon :: (T.Render n b) => T.TDiagram n b
figureDragon =
  let setOrigin :: (Num b) => (b, b) -> (b, b) -> (b, b)
      setOrigin (ox, oy) = U.translate (-ox, -oy)

      rotate90 :: (Num b) => (b, b) -> (b, b)
      rotate90 (x, y) = (-y, x)

      dragon :: (Num b, Num t, Ord t) => [(b, b)] -> t -> [(b, b)]
      dragon xs n =
        if n <= 0 then
          xs
        else
          map (setOrigin (last xs) . rotate90) xs
            # (\ls -> reverse xs ++ tail ls)
            # (\ls -> dragon ls (n - 1))

      dr = dragon dragonInitCurve 12
   in [dr]
        # getPathsList
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
