{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.OiseauxPoissons.Figure047 (figure) where

import qualified Dessins.Utils as U

import Dessins.Const (getRemSizeDiv)

import qualified Dessins.Types as T

import qualified Dessins.Types.Convertable as Convertable

import Dessins.Figures.OiseauxPoissons.Common as C
  ( fishBirdHeight
  , fishBirdWidth
  , lionData
  )

import qualified Dessins.Types.Geometry.Transformable as G
import qualified Dessins.Types.Geometry.Vector as G

import qualified Diagrams as D
import Diagrams.Prelude as DP ((#))

figure :: (T.Render n b) => T.TDiagram n b
figure =
  let rows = 4
      cols = 4

      oiseauxPoissons =
        [ f x y
        | x <- [0 .. (cols - 1)]
        , y <- [0 .. (rows - 1)]
        ]
        where
          getVec i j =
            G.Vector
              ((C.fishBirdWidth - 6) * j - (C.fishBirdWidth - 2) * i)
              ((C.fishBirdHeight - 5) * (i + j))
              0
          f i j =
            lionData
              # G.flipX
              # G.translate (getVec i j)
   in oiseauxPoissons
        # Convertable.combineFigures
        # Convertable.toDessinFrame
        # D.centerXY
        # D.scaleUToX (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
