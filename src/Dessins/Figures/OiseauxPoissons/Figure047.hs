{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.OiseauxPoissons.Figure047 (figure047) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Figures.OiseauxPoissons.Common as C
  ( fishBirdHeight
  , fishBirdWidth
  , lionData
  )
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import qualified Diagrams as D
import Diagrams.Prelude as DP ((#))

figure047 :: (T.Render n b) => T.TDiagram n b
figure047 =
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
              # U.flipX
              # U.translate
                ( (C.fishBirdWidth - 6) * j - (C.fishBirdWidth - 2) * i
                , (C.fishBirdHeight - 5) * (i + j)
                )
   in oiseauxPoissons
        # U.combineFigures
        # U.toDessinFrame
        # D.centerXY
        # D.scaleUToX (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
