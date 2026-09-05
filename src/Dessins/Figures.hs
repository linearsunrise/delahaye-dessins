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
    [ R.getFigureById R.Figure001
    , R.getFigureById R.Figure002
    , R.getFigureById R.Figure003
    , R.getFigureById R.Figure004
    , R.getFigureById R.Figure005
    , R.getFigureById R.Figure006
    ]

etoilesRegulieres :: (T.Render n b) => T.TDiagram n b
etoilesRegulieres =
  U.group
    "ÉTOILES RÉGULIÈRES"
    [ R.getFigureById R.Figure007
    , R.getFigureById R.Figure008
    , R.getFigureById R.Figure009
    , R.getFigureById R.Figure010
    , R.getFigureById R.Figure011
    , R.getFigureById R.Figure012
    ]

composition1 :: (T.Render n b) => T.TDiagram n b
composition1 =
  U.group
    "COMPOSITION 1"
    [ U.ver
        (Const.getRemSizeDiv (/ 2))
        [ row13to18
        , R.getFigureById R.Figure019
        ]
    ]
  where
    row13to18 =
      U.hor
        (Const.getRemSizeDiv (/ 2))
        [ R.getFigureById R.Figure013
        , R.getFigureById R.Figure014
        , R.getFigureById R.Figure015
        , R.getFigureById R.Figure016
        , R.getFigureById R.Figure017
        , R.getFigureById R.Figure018
        ]

composition2 :: (T.Render n b) => T.TDiagram n b
composition2 =
  U.group
    "COMPOSITION 2"
    [ R.getFigureById R.Figure020
    , R.getFigureById R.Figure021
    , R.getFigureById R.Figure022
    , R.getFigureById R.Figure023
    , R.getFigureById R.Figure024
    , R.getFigureById R.Figure025
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
        [ R.getFigureById R.Figure026
        , R.getFigureById R.Figure027
        , R.getFigureById R.Figure028
        , R.getFigureById R.Figure029
        , R.getFigureById R.Figure030
        , R.getFigureById R.Figure031
        ]
    row2 =
      U.hor
        (Const.getRemSizeDiv (/ 2))
        [ R.getFigureById R.Figure032
        , R.getFigureById R.Figure033
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
        [ R.getFigureById R.Figure034
        , R.getFigureById R.Figure035
        , R.getFigureById R.Figure036
        , R.getFigureById R.Figure037
        , R.getFigureById R.Figure038
        , R.getFigureById R.Figure039
        ]
    row2 =
      U.hor
        (Const.getRemSizeDiv (/ 2))
        [ R.getFigureById R.Figure040
        , R.getFigureById R.Figure041
        , R.getFigureById R.Figure042
        , R.getFigureById R.Figure043
        ]

lion :: (T.Render n b) => T.TDiagram n b
lion =
  U.group
    "LION"
    [ R.getFigureById R.Figure044
    , R.getFigureById R.Figure045
    ]

oiseauxPoissons :: (T.Render n b) => T.TDiagram n b
oiseauxPoissons =
  U.group
    "OISEAUX-POISSONS"
    [ R.getFigureById R.Figure046
    , R.getFigureById R.Figure047
    ]

smurf :: (T.Render n b) => T.TDiagram n b
smurf =
  U.group
    "SMURF"
    [ R.getFigureById R.Figure048
    ]

bonus :: (T.Render n b) => T.TDiagram n b
bonus =
  U.group
    "OISEAUX-POISSONS"
    [ R.getFigureById R.BonusII
    , R.getFigureById R.BonusIII
    , R.getFigureById R.BonusIV
    , R.getFigureById R.BonusI
    ]
