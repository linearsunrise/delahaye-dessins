{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Lion.Figure045 (figure) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Figures.Lion.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import qualified Diagrams as D
import Diagrams.Prelude as DP

figure :: (T.Render n b) => T.TDiagram n b
figure =
  let rows = 5 :: Int
      cols = 3 :: Int

      lions =
        mconcat
          [ f x y
          | x <- [0 .. (cols - 1)]
          , y <- [0 .. (rows - 1)]
          ]
        where
          transformPipe i j point =
            let w = lionWidth
                h = lionHeight
                a = fromIntegral i
                b = fromIntegral j
                signA = (-1) ** a
                signB = (-1) ** b
             in point
                  # U.scaleBy (signB, signA)
                  # U.translate
                    ( (w - 4.5) * a
                    , (h - 5) * b
                    )

          f i j = map (map (transformPipe i j)) lionData
   in lions
        # getTrailsList
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
