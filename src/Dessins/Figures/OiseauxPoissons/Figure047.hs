{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.OiseauxPoissons.Figure047 (figure) where

import qualified Dessins.Utils as U

import Dessins.Const (getRemSizeDiv)

import qualified Dessins.Types as T

import qualified Dessins.Types.Convertable as Convertable
import qualified Dessins.Types.Geometry as G

import Dessins.Figures.OiseauxPoissons.Common as C
  ( fishBirdHeight
  , fishBirdWidth
  , lionData
  )

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
          f i j =
            lionData
              # G.flipX
              # G.translate
                ( (C.fishBirdWidth - 6) * j - (C.fishBirdWidth - 2) * i
                , (C.fishBirdHeight - 5) * (i + j)
                )
   in oiseauxPoissons
        # Convertable.combineFigures
        # Convertable.toDessinFrame
        # D.centerXY
        # D.scaleUToX (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
