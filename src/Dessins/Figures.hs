{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures where

import qualified Dessins.Utils as U

import qualified Dessins.Const as Const

import qualified Dessins.Types as T

import qualified Dessins.Build.Registry as R

polygonesReguliers :: (T.Render n b) => T.TDiagram n b
polygonesReguliers =
  U.group
    "POLYGONES RÉGULIERS"
    [ R.getFigureById (R.FigureId "001")
    , R.getFigureById (R.FigureId "002")
    , R.getFigureById (R.FigureId "003")
    , R.getFigureById (R.FigureId "004")
    , R.getFigureById (R.FigureId "005")
    , R.getFigureById (R.FigureId "006")
    ]

etoilesRegulieres :: (T.Render n b) => T.TDiagram n b
etoilesRegulieres =
  U.group
    "ÉTOILES RÉGULIÈRES"
    [ R.getFigureById (R.FigureId "007")
    , R.getFigureById (R.FigureId "008")
    , R.getFigureById (R.FigureId "009")
    , R.getFigureById (R.FigureId "010")
    , R.getFigureById (R.FigureId "011")
    , R.getFigureById (R.FigureId "012")
    ]

composition1 :: (T.Render n b) => T.TDiagram n b
composition1 =
  U.group
    "COMPOSITION 1"
    [ U.ver
        (Const.getRemSizeDiv (/ 2))
        [ row13to18
        , R.getFigureById (R.FigureId "019")
        ]
    ]
  where
    row13to18 =
      U.hor
        (Const.getRemSizeDiv (/ 2))
        [ R.getFigureById (R.FigureId "013")
        , R.getFigureById (R.FigureId "014")
        , R.getFigureById (R.FigureId "015")
        , R.getFigureById (R.FigureId "016")
        , R.getFigureById (R.FigureId "017")
        , R.getFigureById (R.FigureId "018")
        ]

composition2 :: (T.Render n b) => T.TDiagram n b
composition2 =
  U.group
    "COMPOSITION 2"
    [ R.getFigureById (R.FigureId "020")
    , R.getFigureById (R.FigureId "021")
    , R.getFigureById (R.FigureId "022")
    , R.getFigureById (R.FigureId "023")
    , R.getFigureById (R.FigureId "024")
    , R.getFigureById (R.FigureId "025")
    ]

joligones :: (T.Render n b) => T.TDiagram n b
joligones =
  U.group
    "JOLIGONES"
    [ U.ver
        (Const.getRemSizeDiv (/ 2))
        [ row1
        , row2
        ]
    ]
  where
    row1 =
      U.hor
        (Const.getRemSizeDiv (/ 2))
        [ R.getFigureById (R.FigureId "026")
        , R.getFigureById (R.FigureId "027")
        , R.getFigureById (R.FigureId "028")
        , R.getFigureById (R.FigureId "029")
        , R.getFigureById (R.FigureId "030")
        , R.getFigureById (R.FigureId "031")
        ]
    row2 =
      U.hor
        (Const.getRemSizeDiv (/ 2))
        [ R.getFigureById (R.FigureId "032")
        , R.getFigureById (R.FigureId "033")
        ]

cheval :: (T.Render n b) => T.TDiagram n b
cheval =
  U.group
    "CHEVAL"
    [ U.ver
        (Const.getRemSizeDiv (/ 2))
        [ row1
        , row2
        ]
    ]
  where
    row1 =
      U.hor
        (Const.getRemSizeDiv (/ 2))
        [ R.getFigureById (R.FigureId "034")
        , R.getFigureById (R.FigureId "035")
        , R.getFigureById (R.FigureId "036")
        , R.getFigureById (R.FigureId "037")
        , R.getFigureById (R.FigureId "038")
        , R.getFigureById (R.FigureId "039")
        ]
    row2 =
      U.hor
        (Const.getRemSizeDiv (/ 2))
        [ R.getFigureById (R.FigureId "040")
        , R.getFigureById (R.FigureId "041")
        , R.getFigureById (R.FigureId "042")
        , R.getFigureById (R.FigureId "043")
        ]

lion :: (T.Render n b) => T.TDiagram n b
lion =
  U.group
    "LION"
    [ R.getFigureById (R.FigureId "044")
    , R.getFigureById (R.FigureId "045")
    ]

oiseauxPoissons :: (T.Render n b) => T.TDiagram n b
oiseauxPoissons =
  U.group
    "OISEAUX-POISSONS"
    [ R.getFigureById (R.FigureId "046")
    , R.getFigureById (R.FigureId "047")
    ]

smurf :: (T.Render n b) => T.TDiagram n b
smurf =
  U.group
    "SMURF"
    [ R.getFigureById (R.FigureId "048")
    ]

bonus :: (T.Render n b) => T.TDiagram n b
bonus =
  U.group
    "OISEAUX-POISSONS"
    [ R.getFigureById (R.FigureId "II")
    , R.getFigureById (R.FigureId "III")
    , R.getFigureById (R.FigureId "IV")
    , R.getFigureById (R.FigureId "I")
    ]
