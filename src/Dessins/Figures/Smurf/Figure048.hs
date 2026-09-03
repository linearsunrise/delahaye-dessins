{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Smurf.Figure048 (figure048) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Figures.Smurf.Common
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import qualified Diagrams as D
import Diagrams.Prelude as DP ((#))

figure048 :: (T.Render n b) => T.TDiagram n b
figure048 =
  smurfData
    # getPathsList
    # D.centerXY
    # D.scaleUToY (getRemSizeDiv (* 3))
    # U.squareFrame (getRemSizeDiv (* 4))

-- figure048 :: (T.Render n b) => T.TDiagram n b
-- figure048 =
--   let rows = 4 :: Int
--       cols = 4 :: Int

--       oiseauxPoissons =
--         mconcat
--           [ f x y
--           | x <- [0 .. (cols - 1)]
--           , y <- [0 .. (rows - 1)]
--           ]
--         where
--           transformPipe i j point =
--             let w = fishBirdWidth
--                 h = fishBirdHeight
--                 a = fromIntegral i
--                 b = fromIntegral j
--              in point
--                   # U.flipX
--                   # U.translate
--                     ( (w - 6) * b - (w - 2) * a
--                     , (h - 5) * (a + b)
--                     )

--           f i j = map (map (transformPipe i j)) lionData
--    in oiseauxPoissons
--         # getPathsList
--         # D.centerXY
--         # D.scaleUToX (getRemSizeDiv (* 3))
--         # U.squareFrame (getRemSizeDiv (* 4))
