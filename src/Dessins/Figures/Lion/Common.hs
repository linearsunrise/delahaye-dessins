{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Lion.Common
  ( lionWidth
  , lionHeight
  , lionData
  )
where

import qualified Dessins.Utils as U

import Diagrams.Prelude as DP ((#))

lionData :: (Floating n) => U.Figure n
lionData =
  U.Figure
    [ U.Path
        [ U.Point 5 5 0
        , U.Point 5 3 0
        , U.Point 6 0.5 0
        , U.Point 6.5 1 0
        , U.Point 5.5 3 0
        , U.Point 5.5 5 0
        , U.Point 5.5 3 0
        , U.Point 6.5 1 0
        , U.Point 7.5 2 0
        , U.Point 6 3 0
        , U.Point 6 5 0
        , U.Point 6 3 0
        , U.Point 7.5 2 0
        , U.Point 7.5 3 0
        , U.Point 6.5 4 0
        , U.Point 6.5 5 0
        , U.Point 10.5 5 0
        , U.Point 9.5 3 0
        , U.Point 10 2 0
        , U.Point 11 2 0
        , U.Point 11 2.5 0
        , U.Point 11 2 0
        , U.Point 10 2 0
        , U.Point 10.5 1 0
        , U.Point 12.5 0 0
        , U.Point 14.5 1 0
        , U.Point 14.5 2 0
        , U.Point 13.5 2.5 0
        , U.Point 14.5 2 0
        , U.Point 15 2 0
        , U.Point 14.5 2 0
        , U.Point 14.5 1.5 0
        , U.Point 14 1.5 0
        , U.Point 13 1 0
        , U.Point 12.5 1 0
        , U.Point 12.5 0.5 0
        , U.Point 13 0.5 0
        , U.Point 13 1 0
        , U.Point 14 1.5 0
        , U.Point 14.5 1.5 0
        , U.Point 14.5 1 0
        , U.Point 15.5 3 0
        , U.Point 14.5 3 0
        , U.Point 12.5 3.5 0
        , U.Point 11.5 3.5 0
        , U.Point 12.5 3.5 0
        , U.Point 14.5 3 0
        , U.Point 13.5 4 0
        , U.Point 14.5 6 0
        , U.Point 15.5 7 0
        , U.Point 16.5 12 0
        , U.Point 17.5 12 0
        , U.Point 18.5 13 0
        , U.Point 18.5 14 0
        , U.Point 14.5 14 0
        , U.Point 14.5 12 0
        , U.Point 13.5 9 0
        , U.Point 14 8 0
        , U.Point 13.5 9 0
        , U.Point 11.5 11 0
        , U.Point 11.5 12 0
        , U.Point 12.5 13 0
        , U.Point 12.5 14 0
        , U.Point 8.5 14 0
        , U.Point 9.5 12 0
        , U.Point 10.5 8 0
        , U.Point 9.5 12 0
        , U.Point 8.5 10 0
        , U.Point 10 10.5 0
        , U.Point 8.5 10 0
        , U.Point 6.5 9 0
        , U.Point 7.5 7 0
        , U.Point 6.5 6 0
        , U.Point 7.5 7 0
        , U.Point 6.5 9 0
        , U.Point 4.5 10 0
        , U.Point 3.5 12 0
        , U.Point 4.5 12 0
        , U.Point 5.5 13 0
        , U.Point 5 14 0
        , U.Point 0 14 0
        , U.Point 0.5 13 0
        , U.Point 1.5 12 0
        , U.Point 2.5 7 0
        , U.Point 3.5 7 0
        , U.Point 4.5 6 0
        , U.Point 4.5 3 0
        , U.Point 5.5 0 0
        , U.Point 6 0.5 0
        , U.Point 5 3 0
        , U.Point 5 5 0
        ]
    ]
    # U.setOrigin -- находим origin для симметрии
      ( (lionWidth + 0.5) / 2
      , (lionHeight + 5) / 2
      )
    # U.flipY

lionWidth :: (Floating n) => n
lionWidth = 18.5

lionHeight :: (Floating n) => n
lionHeight = 14
