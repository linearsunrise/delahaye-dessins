{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Cheval.Common where

import qualified Dessins.Types.Geometry.Figure as G
import qualified Dessins.Types.Geometry.Path as G
import qualified Dessins.Types.Geometry.Point as G

chevalData :: (Floating n) => G.Figure n
chevalData =
  G.Figure
    [ G.Path
        [ G.Point 10 10 0
        , G.Point 8 12 0
        , G.Point 9 16 0
        , G.Point 12 17 0
        , G.Point 13 18 0
        , G.Point 14 20 0
        ]
    , G.Path
        [ G.Point 13 18 0
        , G.Point 12 19 0
        , G.Point 9 21 0
        , G.Point 9 20 0
        , G.Point 10 19 0
        , G.Point 9 17 0
        , G.Point 7 20 0
        , G.Point 8 22 0
        , G.Point 12 22 0
        ]
    , G.Path
        [ G.Point 12 20 0
        , G.Point 12 22 0
        , G.Point 13 26 0
        , G.Point 16 31 0
        , G.Point 18 31 0
        , G.Point 19 32 0
        ]
    , G.Path [G.Point 16 31 0, G.Point 14 31 0, G.Point 14 32 0]
    , G.Path
        [ G.Point 14 31 0
        , G.Point 10 30 0
        , G.Point 12 31 0
        , G.Point 10 32 0
        , G.Point 10 34 0
        , G.Point 11 34 0
        , G.Point 11 33 0
        , G.Point 10 33 0
        ]
    , G.Path [G.Point 12 32 0, G.Point 13 31 0]
    , G.Path [G.Point 10 34 0, G.Point 16 36 0]
    , G.Path
        [G.Point 16 35 0, G.Point 16 37 0, G.Point 18 35 0, G.Point 17 34 0]
    , G.Path
        [G.Point 17 36 0, G.Point 20 36 0, G.Point 22 32 0, G.Point 19 26 0]
    , G.Path
        [ G.Point 20 36 0
        , G.Point 22 36 0
        , G.Point 22 34 0
        , G.Point 24 32 0
        , G.Point 24 30 0
        , G.Point 19 26 0
        , G.Point 18 23 0
        , G.Point 21 22 0
        , G.Point 21 24 0
        , G.Point 30 30 0
        , G.Point 34 31 0
        , G.Point 36 31 0
        , G.Point 33 26 0
        , G.Point 32 22 0
        , G.Point 28 22 0
        , G.Point 27 20 0
        , G.Point 29 17 0
        , G.Point 30 19 0
        , G.Point 29 20 0
        , G.Point 29 21 0
        , G.Point 32 19 0
        , G.Point 33 18 0
        , G.Point 32 17 0
        , G.Point 29 16 0
        , G.Point 28 12 0
        , G.Point 30 10 0
        , G.Point 21 4 0
        , G.Point 21 2 0
        , G.Point 18 3 0
        , G.Point 19 6 0
        , G.Point 24 10 0
        , G.Point 24 12 0
        , G.Point 22 14 0
        , G.Point 22 16 0
        , G.Point 23 17 0
        ]
    , G.Path
        [G.Point 22 16 0, G.Point 17 16 0, G.Point 16 17 0, G.Point 17 18 0]
    , G.Path
        [ G.Point 16 17 0
        , G.Point 16 16 0
        , G.Point 10 14 0
        , G.Point 10 12 0
        , G.Point 12 11 0
        , G.Point 10 10 0
        ]
    , G.Path [G.Point 21 21 0, G.Point 22 24 0, G.Point 30 30 0]
    , G.Path [G.Point 24 24 0, G.Point 34 28 0]
    , G.Path [G.Point 25 23 0, G.Point 33 26 0]
    , G.Path [G.Point 25 21 0, G.Point 27 20 0]
    , G.Path [G.Point 23 21 0, G.Point 24 19 0]
    , G.Path [G.Point 27 20 0, G.Point 22 19 0, G.Point 22 21 0]
    , G.Path [G.Point 22 19 0, G.Point 21 20 0]
    , G.Path
        [G.Point 13 34 0, G.Point 15 35 0, G.Point 16 34 0, G.Point 16 33 0]
    , G.Path
        [ G.Point 15 35 0
        , G.Point 15 34 0
        , G.Point 16 34 0
        , G.Point 15 34 0
        , G.Point 15 35 0
        ]
    , G.Path
        [G.Point 24 12 0, G.Point 26 10 0, G.Point 19 5 0, G.Point 19 3 0]
    , G.Path [G.Point 28 22 0, G.Point 25 22 0]
    ]
