{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Common where

import qualified Dessins.Utils as U

chevalData :: (Floating n) => U.Figure n
chevalData =
  U.Figure
    [ U.Path
        [ U.Point 10 10 0
        , U.Point 8 12 0
        , U.Point 9 16 0
        , U.Point 12 17 0
        , U.Point 13 18 0
        , U.Point 14 20 0
        ]
    , U.Path
        [ U.Point 13 18 0
        , U.Point 12 19 0
        , U.Point 9 21 0
        , U.Point 9 20 0
        , U.Point 10 19 0
        , U.Point 9 17 0
        , U.Point 7 20 0
        , U.Point 8 22 0
        , U.Point 12 22 0
        ]
    , U.Path
        [ U.Point 12 20 0
        , U.Point 12 22 0
        , U.Point 13 26 0
        , U.Point 16 31 0
        , U.Point 18 31 0
        , U.Point 19 32 0
        ]
    , U.Path [U.Point 16 31 0, U.Point 14 31 0, U.Point 14 32 0]
    , U.Path
        [ U.Point 14 31 0
        , U.Point 10 30 0
        , U.Point 12 31 0
        , U.Point 10 32 0
        , U.Point 10 34 0
        , U.Point 11 34 0
        , U.Point 11 33 0
        , U.Point 10 33 0
        ]
    , U.Path [U.Point 12 32 0, U.Point 13 31 0]
    , U.Path [U.Point 10 34 0, U.Point 16 36 0]
    , U.Path
        [U.Point 16 35 0, U.Point 16 37 0, U.Point 18 35 0, U.Point 17 34 0]
    , U.Path
        [U.Point 17 36 0, U.Point 20 36 0, U.Point 22 32 0, U.Point 19 26 0]
    , U.Path
        [ U.Point 20 36 0
        , U.Point 22 36 0
        , U.Point 22 34 0
        , U.Point 24 32 0
        , U.Point 24 30 0
        , U.Point 19 26 0
        , U.Point 18 23 0
        , U.Point 21 22 0
        , U.Point 21 24 0
        , U.Point 30 30 0
        , U.Point 34 31 0
        , U.Point 36 31 0
        , U.Point 33 26 0
        , U.Point 32 22 0
        , U.Point 28 22 0
        , U.Point 27 20 0
        , U.Point 29 17 0
        , U.Point 30 19 0
        , U.Point 29 20 0
        , U.Point 29 21 0
        , U.Point 32 19 0
        , U.Point 33 18 0
        , U.Point 32 17 0
        , U.Point 29 16 0
        , U.Point 28 12 0
        , U.Point 30 10 0
        , U.Point 21 4 0
        , U.Point 21 2 0
        , U.Point 18 3 0
        , U.Point 19 6 0
        , U.Point 24 10 0
        , U.Point 24 12 0
        , U.Point 22 14 0
        , U.Point 22 16 0
        , U.Point 23 17 0
        ]
    , U.Path
        [U.Point 22 16 0, U.Point 17 16 0, U.Point 16 17 0, U.Point 17 18 0]
    , U.Path
        [ U.Point 16 17 0
        , U.Point 16 16 0
        , U.Point 10 14 0
        , U.Point 10 12 0
        , U.Point 12 11 0
        , U.Point 10 10 0
        ]
    , U.Path [U.Point 21 21 0, U.Point 22 24 0, U.Point 30 30 0]
    , U.Path [U.Point 24 24 0, U.Point 34 28 0]
    , U.Path [U.Point 25 23 0, U.Point 33 26 0]
    , U.Path [U.Point 25 21 0, U.Point 27 20 0]
    , U.Path [U.Point 23 21 0, U.Point 24 19 0]
    , U.Path [U.Point 27 20 0, U.Point 22 19 0, U.Point 22 21 0]
    , U.Path [U.Point 22 19 0, U.Point 21 20 0]
    , U.Path
        [U.Point 13 34 0, U.Point 15 35 0, U.Point 16 34 0, U.Point 16 33 0]
    , U.Path
        [ U.Point 15 35 0
        , U.Point 15 34 0
        , U.Point 16 34 0
        , U.Point 15 34 0
        , U.Point 15 35 0
        ]
    , U.Path
        [U.Point 24 12 0, U.Point 26 10 0, U.Point 19 5 0, U.Point 19 3 0]
    , U.Path [U.Point 28 22 0, U.Point 25 22 0]
    ]
