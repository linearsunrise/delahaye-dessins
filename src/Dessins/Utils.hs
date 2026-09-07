{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeFamilies #-}

module Dessins.Utils
  ( module U
  )
where

import Dessins.Utils.Grid as U (group, hor, ver)
import Dessins.Utils.Polygon as U
  ( axis
  , polygonEtoile
  , polygonRegulier
  , xAxis
  , yAxis
  )
import Dessins.Utils.Scene as U
  ( renderSquareFrame
  , renderTrail
  , squareFrame
  )
