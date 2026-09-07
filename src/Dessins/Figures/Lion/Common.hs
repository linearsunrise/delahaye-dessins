{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Lion.Common where

import qualified Dessins.Types.Geometry as G

import Diagrams.Prelude as DP ((#))

lionData :: (Floating n) => G.Figure n
lionData =
  G.Figure
    [ G.Path
        [ G.Point 5 5 0
        , G.Point 5 3 0
        , G.Point 6 0.5 0
        , G.Point 6.5 1 0
        , G.Point 5.5 3 0
        , G.Point 5.5 5 0
        , G.Point 5.5 3 0
        , G.Point 6.5 1 0
        , G.Point 7.5 2 0
        , G.Point 6 3 0
        , G.Point 6 5 0
        , G.Point 6 3 0
        , G.Point 7.5 2 0
        , G.Point 7.5 3 0
        , G.Point 6.5 4 0
        , G.Point 6.5 5 0
        , G.Point 10.5 5 0
        , G.Point 9.5 3 0
        , G.Point 10 2 0
        , G.Point 11 2 0
        , G.Point 11 2.5 0
        , G.Point 11 2 0
        , G.Point 10 2 0
        , G.Point 10.5 1 0
        , G.Point 12.5 0 0
        , G.Point 14.5 1 0
        , G.Point 14.5 2 0
        , G.Point 13.5 2.5 0
        , G.Point 14.5 2 0
        , G.Point 15 2 0
        , G.Point 14.5 2 0
        , G.Point 14.5 1.5 0
        , G.Point 14 1.5 0
        , G.Point 13 1 0
        , G.Point 12.5 1 0
        , G.Point 12.5 0.5 0
        , G.Point 13 0.5 0
        , G.Point 13 1 0
        , G.Point 14 1.5 0
        , G.Point 14.5 1.5 0
        , G.Point 14.5 1 0
        , G.Point 15.5 3 0
        , G.Point 14.5 3 0
        , G.Point 12.5 3.5 0
        , G.Point 11.5 3.5 0
        , G.Point 12.5 3.5 0
        , G.Point 14.5 3 0
        , G.Point 13.5 4 0
        , G.Point 14.5 6 0
        , G.Point 15.5 7 0
        , G.Point 16.5 12 0
        , G.Point 17.5 12 0
        , G.Point 18.5 13 0
        , G.Point 18.5 14 0
        , G.Point 14.5 14 0
        , G.Point 14.5 12 0
        , G.Point 13.5 9 0
        , G.Point 14 8 0
        , G.Point 13.5 9 0
        , G.Point 11.5 11 0
        , G.Point 11.5 12 0
        , G.Point 12.5 13 0
        , G.Point 12.5 14 0
        , G.Point 8.5 14 0
        , G.Point 9.5 12 0
        , G.Point 10.5 8 0
        , G.Point 9.5 12 0
        , G.Point 8.5 10 0
        , G.Point 10 10.5 0
        , G.Point 8.5 10 0
        , G.Point 6.5 9 0
        , G.Point 7.5 7 0
        , G.Point 6.5 6 0
        , G.Point 7.5 7 0
        , G.Point 6.5 9 0
        , G.Point 4.5 10 0
        , G.Point 3.5 12 0
        , G.Point 4.5 12 0
        , G.Point 5.5 13 0
        , G.Point 5 14 0
        , G.Point 0 14 0
        , G.Point 0.5 13 0
        , G.Point 1.5 12 0
        , G.Point 2.5 7 0
        , G.Point 3.5 7 0
        , G.Point 4.5 6 0
        , G.Point 4.5 3 0
        , G.Point 5.5 0 0
        , G.Point 6 0.5 0
        , G.Point 5 3 0
        , G.Point 5 5 0
        ]
    ]
    # G.setOrigin -- находим origin для симметрии
      ( (lionWidth + 0.5) / 2
      , (lionHeight + 5) / 2
      )
    # G.flipY

lionWidth :: (Floating n) => n
lionWidth = 18.5

lionHeight :: (Floating n) => n
lionHeight = 14
