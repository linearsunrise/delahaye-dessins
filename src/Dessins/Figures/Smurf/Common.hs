{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.Smurf.Common
  ( smurfWidth
  , smurfHeight
  , smurfData
  )
where

import qualified Dessins.Types.Geometry.Figure as G
import qualified Dessins.Types.Geometry.Path as G
import qualified Dessins.Types.Geometry.Point as G

smurfData :: (Floating n) => G.Figure n
smurfData =
  G.Figure
    [ G.Path
        [ G.Point 12 12 0
        , G.Point 14 8 0
        , G.Point 14 4 0
        , G.Point 12 2 0
        , G.Point 8 2 0
        , G.Point 4 4 0
        , G.Point 0 10 0
        , G.Point 0 20 0
        , G.Point 4 26 0
        , G.Point 6 28 0
        , G.Point 12 28 0
        , G.Point 14 26 0
        , G.Point 14 22 0
        , G.Point 12 16 0
        , G.Point 12 12 0
        , G.Point 20 14 0
        , G.Point 24 14 0
        , G.Point 28 12 0
        , G.Point 28 10 0
        , G.Point 26 4 0
        , G.Point 28 0 0
        , G.Point 36 0 0
        , G.Point 38 2 0
        , G.Point 40 10 0
        , G.Point 40 22 0
        , G.Point 36 26 0
        , G.Point 28 26 0
        , G.Point 26 22 0
        , G.Point 28 14 0
        , G.Point 28 12 0
        , G.Point 28 14 0
        , G.Point 27 18 0
        , G.Point 18 18 0
        , G.Point 16 20 0
        , G.Point 16 18 0
        , G.Point 20 14 0
        , G.Point 16 18 0
        , G.Point 12 16 0
        ]
    , G.Path
        [ G.Point 16 20 0
        , G.Point 16 24 0
        , G.Point 20 32 0
        , G.Point 20 34 0
        , G.Point 20 32 0
        , G.Point 12 34 0
        , G.Point 12 32 0
        , G.Point 10 28 0
        ]
    , G.Path
        [ G.Point 4 26 0
        , G.Point 2 28 0
        , G.Point 4 30 0
        , G.Point 8 30 0
        , G.Point 6 32 0
        , G.Point 6 34 0
        , G.Point 6 32 0
        , G.Point 4 32 0
        , G.Point 2 30 0
        , G.Point 2 28 0
        ]
    , G.Path [G.Point 8 30 0, G.Point 8 36 0, G.Point 10 38 0]
    , G.Path
        [ G.Point 4 32 0
        , G.Point 4 34 0
        , G.Point 8 38 0
        , G.Point 6 40 0
        , G.Point 6 42 0
        , G.Point 8 44 0
        , G.Point 10 44 0
        , G.Point 10 42 0
        , G.Point 12 42 0
        , G.Point 12 38 0
        , G.Point 16 36 0
        , G.Point 32 36 0
        , G.Point 38 40 0
        , G.Point 40 44 0
        , G.Point 38 42 0
        , G.Point 36 46 0
        , G.Point 30 48 0
        , G.Point 36 48 0
        , G.Point 40 44 0
        , G.Point 40 56 0
        , G.Point 36 62 0
        , G.Point 32 64 0
        , G.Point 24 64 0
        , G.Point 18 62 0
        , G.Point 16 60 0
        , G.Point 16 58 0
        , G.Point 18 56 0
        , G.Point 24 56 0
        , G.Point 22 56 0
        , G.Point 20 53 0
        , G.Point 28 56 0
        , G.Point 22 54 0
        , G.Point 28 54 0
        , G.Point 32 52 0
        , G.Point 34 48 0
        , G.Point 32 52 0
        , G.Point 28 48 0
        , G.Point 30 46 0
        , G.Point 28 44 0
        ]
    , G.Path
        [ G.Point 28 48 0
        , G.Point 22 48 0
        , G.Point 24 48 0
        , G.Point 24 52 0
        , G.Point 22 54 0
        , G.Point 18 52 0
        , G.Point 18 50 0
        , G.Point 20 48 0
        , G.Point 12 48 0
        , G.Point 16 48 0
        , G.Point 18 50 0
        , G.Point 16 48 0
        , G.Point 16 50 0
        , G.Point 18 52 0
        , G.Point 16 50 0
        , G.Point 16 48 0
        , G.Point 14 46 0
        , G.Point 16 44 0
        ]
    , G.Path [G.Point 12 48 0, G.Point 10 44 0]
    , G.Path [G.Point 16 46 0, G.Point 18 44 0]
    , G.Path
        [ G.Point 18 46 0
        , G.Point 26 46 0
        , G.Point 24 46 0
        , G.Point 24 44 0
        , G.Point 22 42 0
        , G.Point 20 44 0
        , G.Point 20 46 0
        ]
    , G.Path [G.Point 22 42 0, G.Point 22 44 0, G.Point 24 44 0]
    , G.Path [G.Point 28 46 0, G.Point 26 44 0]
    , G.Path [G.Point 24 54 0, G.Point 25 52 0]
    , G.Path [G.Point 27 52 0, G.Point 28 54 0, G.Point 30 52 0]
    , G.Path [G.Point 25 49 0, G.Point 26 50 0, G.Point 27 49 0]
    , G.Path
        [ G.Point 36 38 0
        , G.Point 40 38 0
        , G.Point 42 40 0
        , G.Point 48 40 0
        , G.Point 48 42 0
        , G.Point 50 42 0
        , G.Point 52 40 0
        , G.Point 50 36 0
        , G.Point 48 36 0
        , G.Point 48 38 0
        , G.Point 48 38 0
        , G.Point 48 36 0
        , G.Point 46 34 0
        , G.Point 48 36 0
        , G.Point 48 26 0
        , G.Point 46 24 0
        , G.Point 46 32 0
        , G.Point 46 30 0
        , G.Point 42 30 0
        , G.Point 44 28 0
        , G.Point 44 26 0
        , G.Point 42 24 0
        , G.Point 40 26 0
        , G.Point 40 32 0
        , G.Point 42 32 0
        , G.Point 28 32 0
        , G.Point 30 32 0
        , G.Point 32 26 0
        ]
    , G.Path [G.Point 44 26 0, G.Point 44 24 0, G.Point 46 24 0]
    , G.Path [G.Point 42 38 0, G.Point 44 36 0, G.Point 44 32 0]
    ]

smurfWidth :: (RealFloat n) => n
smurfWidth = 11

smurfHeight :: (RealFloat n) => n
smurfHeight = 9
