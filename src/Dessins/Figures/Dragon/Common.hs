{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}

module Dessins.Figures.Dragon.Common where

import qualified Dessins.Types.Units as T

import qualified Dessins.Types.Geometry.Path as G
import qualified Dessins.Types.Geometry.Point as G
import qualified Dessins.Types.Geometry.Transformable as G
import Dessins.Types.Geometry.Vector
  ( Additive ((~+))
  , Concat ((^++))
  , Scalable ((~*))
  )
import qualified Dessins.Types.Geometry.Vector as G

import Diagrams.Prelude ((#))

dragonInitCurve :: (Floating a) => G.Path a
dragonInitCurve =
  G.Path
    [ G.Point (-4) 0 1
    , G.Point 0 0 1
    ]

dragon ::
  (Eq n, Floating n) =>
  G.Path n -> Integer -> (Integer -> Integer) -> G.Path n
dragon xs 0 _ =
  xs
    # (\(G.Path ps) -> take (length ps - 1) ps)
    # G.Path
dragon xs n rotationRule =
  let sign = (-1) ^ rotationRule n
   in xs
        # ( \ls ->
              ls
                ^++ G.rotateZAround (T.deg ((-90) * sign)) (G.fromPoint newOrigin) ls
          )
        # (\ls -> dragon ls (n - 1) rotationRule)
  where
    lastPoint = G.lastPt xs
    dir = G.vectorByLastTwoPoints xs ~* 2
    newOrigin = lastPoint ~+ dir
