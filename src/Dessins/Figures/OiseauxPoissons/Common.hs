{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.OiseauxPoissons.Common
  ( lionData
  , fishBirdWidth
  , fishBirdHeight
  )
where

import qualified Dessins.Utils as U

import Diagrams.Prelude as DP ((#))

lionData :: (Floating n) => U.Figure n
lionData =
  U.Figure
    [ U.Path
        [ U.Point 11 5 0
        , U.Point 9 6 0
        , U.Point 7 6 0
        , U.Point 3 4 0
        , U.Point 2 4 0
        , U.Point 2.7 3.3 0
        , U.Point 2.7 3.2 0
        , U.Point 3 3.2 0
        , U.Point 3 3.5 0
        , U.Point 2.7 3.5 0
        , U.Point 2.7 3.2 0
        , U.Point 2.8 3.2 0
        , U.Point 3 3 0
        , U.Point 4 3 0
        , U.Point 5 4 0
        , U.Point 6 4 0
        , U.Point 5 3 0
        , U.Point 6 1 0
        , U.Point 9 0 0
        , U.Point 9 1 0
        , U.Point 7 2 0
        , U.Point 7 4 0
        , U.Point 7 2 0
        , U.Point 11 0 0
        , U.Point 11 1 0
        , U.Point 9 3 0
        , U.Point 10 4 0
        , U.Point 11 4 0
        , U.Point 11 5 0
        , U.Point 10 7 0
        , U.Point 11 8 0
        , U.Point 10 8 0
        , U.Point 9 7 0
        , U.Point 8 7 0
        , U.Point 7 8 0
        , U.Point 5 9 0
        , U.Point 5 8 0
        , U.Point 2 9 0
        , U.Point 2 8 0
        , U.Point 1 8 0
        , U.Point 0 7 0
        , U.Point 1 7 0
        , U.Point 0 7 0
        , U.Point 1.5 5.5 0
        , U.Point 2 5.5 0
        , U.Point 2 6 0
        , U.Point 1.5 6 0
        , U.Point 1.5 5.5 0
        , U.Point 2 5 0
        , U.Point 3 7 0
        , U.Point 4 6 0
        , U.Point 4 7 0
        , U.Point 3 7 0
        , U.Point 2 8 0
        , U.Point 7 8 0
        , U.Point 2 8 0
        , U.Point 3 7 0
        , U.Point 2 5 0
        , U.Point 5 5 0
        , U.Point 2 5 0
        , U.Point 2 4 0
        , U.Point 3 4 0
        , U.Point 7 6 0
        , U.Point 9 6 0
        , U.Point 11 5 0
        ]
        # U.flipY
        # U.translate -- находим origin для симметрии
          ( -((fishBirdWidth + 2.5) / 2)
          , -((fishBirdHeight + 1.5) / 2)
          )
    ]

fishBirdWidth :: (Floating n) => n
fishBirdWidth = 11

fishBirdHeight :: (Floating n) => n
fishBirdHeight = 9
