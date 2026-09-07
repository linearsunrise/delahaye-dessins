{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}

module Dessins.Figures.Dragon.Common where

import qualified Dessins.Types.Geometry as G

import Dessins.Types.Geometry.Vector
  ( Additive ((~+))
  , Concat ((^++))
  , Scalable ((~*))
  )

import Diagrams.Prelude ((#))

dragonInitCurve :: (Floating a) => G.Path a
dragonInitCurve =
  G.Path
    [ G.Point (-4) 0 1
    , G.Point 0 0 1
    ]

dragon :: (Floating n) => G.Path n -> Integer -> G.Path n
dragon xs 0 = xs
dragon xs n =
  xs
    # (\ls -> ls ^++ G.rotateZ90AroundOrigin newOrigin ls)
    # (\ls -> dragon ls (n - 1))
  where
    lastPoint = G.lastPt xs
    dir = G.vectorByLastTwoPoints xs ~* 2
    newOrigin = lastPoint ~+ dir
