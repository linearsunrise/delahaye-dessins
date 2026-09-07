{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures where

import qualified Dessins.Utils.Grid as U

import qualified Dessins.Types as T

import qualified Dessins.Figures.PolygonesReguliers.Figure001 as F001
import qualified Dessins.Figures.PolygonesReguliers.Figure002 as F002
import qualified Dessins.Figures.PolygonesReguliers.Figure003 as F003
import qualified Dessins.Figures.PolygonesReguliers.Figure004 as F004
import qualified Dessins.Figures.PolygonesReguliers.Figure005 as F005
import qualified Dessins.Figures.PolygonesReguliers.Figure006 as F006

import qualified Dessins.Figures.EtoilesRegulieres.Figure007 as F007
import qualified Dessins.Figures.EtoilesRegulieres.Figure008 as F008
import qualified Dessins.Figures.EtoilesRegulieres.Figure009 as F009
import qualified Dessins.Figures.EtoilesRegulieres.Figure010 as F010
import qualified Dessins.Figures.EtoilesRegulieres.Figure011 as F011
import qualified Dessins.Figures.EtoilesRegulieres.Figure012 as F012

import qualified Dessins.Figures.Composition1.Figure013 as F013
import qualified Dessins.Figures.Composition1.Figure014 as F014
import qualified Dessins.Figures.Composition1.Figure015 as F015
import qualified Dessins.Figures.Composition1.Figure016 as F016
import qualified Dessins.Figures.Composition1.Figure017 as F017
import qualified Dessins.Figures.Composition1.Figure018 as F018
import qualified Dessins.Figures.Composition1.Figure019 as F019

import qualified Dessins.Figures.Composition2.Figure020 as F020
import qualified Dessins.Figures.Composition2.Figure021 as F021
import qualified Dessins.Figures.Composition2.Figure022 as F022
import qualified Dessins.Figures.Composition2.Figure023 as F023
import qualified Dessins.Figures.Composition2.Figure024 as F024
import qualified Dessins.Figures.Composition2.Figure025 as F025

import qualified Dessins.Figures.Joligones.Figure026 as F026
import qualified Dessins.Figures.Joligones.Figure027 as F027
import qualified Dessins.Figures.Joligones.Figure028 as F028
import qualified Dessins.Figures.Joligones.Figure029 as F029
import qualified Dessins.Figures.Joligones.Figure030 as F030
import qualified Dessins.Figures.Joligones.Figure031 as F031
import qualified Dessins.Figures.Joligones.Figure032 as F032
import qualified Dessins.Figures.Joligones.Figure033 as F033

import qualified Dessins.Figures.Cheval.Figure034 as F034
import qualified Dessins.Figures.Cheval.Figure035 as F035
import qualified Dessins.Figures.Cheval.Figure036 as F036
import qualified Dessins.Figures.Cheval.Figure037 as F037
import qualified Dessins.Figures.Cheval.Figure038 as F038
import qualified Dessins.Figures.Cheval.Figure039 as F039
import qualified Dessins.Figures.Cheval.Figure040 as F040
import qualified Dessins.Figures.Cheval.Figure041 as F041
import qualified Dessins.Figures.Cheval.Figure042 as F042
import qualified Dessins.Figures.Cheval.Figure043 as F043

import qualified Dessins.Figures.Lion.Figure044 as F044
import qualified Dessins.Figures.Lion.Figure045 as F045

import qualified Dessins.Figures.OiseauxPoissons.Figure046 as F046
import qualified Dessins.Figures.OiseauxPoissons.Figure047 as F047

import qualified Dessins.Figures.Smurf.Figure048 as F048
import qualified Dessins.Figures.Smurf.Figure049 as F049

import qualified Dessins.Figures.Dragon.Figure050 as F050
import qualified Dessins.Figures.Dragon.Figure051 as F051
import qualified Dessins.Figures.Dragon.Figure052 as F052
import qualified Dessins.Figures.Dragon.Figure053 as F053
import qualified Dessins.Figures.Dragon.Figure054 as F054

import qualified Dessins.Figures.Bonus.BonusI as BI
import qualified Dessins.Figures.Bonus.BonusII as BII
import qualified Dessins.Figures.Bonus.BonusIII as BIII
import qualified Dessins.Figures.Bonus.BonusIV as BIV
import qualified Dessins.Figures.Bonus.BonusV as BV

import qualified Diagrams as D
import Diagrams.Prelude ((#))

renderText ::
  (T.Render n b) => String -> T.TDiagram n b -> T.TDiagram n b
renderText str diag = text <> base
  where
    padding = 12
    base = diag # D.alignBR
    text =
      D.alignedText 1 0 str
        # D.fontSize 12
        # D.font "IBM Plex Mono"
        # D.translate (D.r2 (-padding, padding))

polygonesReguliers :: (T.Render n b) => T.TDiagram n b
polygonesReguliers =
  U.group
    "POLYGONES RÉGULIERS"
    [ D.alignL $
        U.ver
          0
          [ U.hor
              0
              [ F001.figure # D.scale 4 # renderText "F001"
              , F002.figure # D.scale 4 # renderText "F002"
              , F003.figure # D.scale 4 # renderText "F003"
              ]
          , U.hor
              0
              [ F004.figure # D.scale 4 # renderText "F004"
              , F005.figure # D.scale 4 # renderText "F005"
              , F006.figure # D.scale 4 # renderText "F006"
              ]
          ]
    ]

etoilesRegulieres :: (T.Render n b) => T.TDiagram n b
etoilesRegulieres =
  U.group
    "ÉTOILES RÉGULIÈRES"
    [ D.alignL $
        U.ver
          0
          [ U.hor
              0
              [ F007.figure # D.scale 4 # renderText "F007"
              , F008.figure # D.scale 4 # renderText "F008"
              , F009.figure # D.scale 4 # renderText "F009"
              ]
          , U.hor
              0
              [ F010.figure # D.scale 4 # renderText "F010"
              , F011.figure # D.scale 4 # renderText "F011"
              , F012.figure # D.scale 4 # renderText "F012"
              ]
          ]
    ]

composition1 :: (T.Render n b) => T.TDiagram n b
composition1 =
  U.group
    "COMPOSITION 1"
    [ D.alignL $
        U.ver
          0
          [ r1 # D.alignL
          , r2 # D.alignL
          ]
    ]
  where
    r1 =
      U.hor
        0
        [ F013.figure # D.scale 3 # renderText "F013"
        , F014.figure # D.scale 3 # renderText "F014"
        , F015.figure # D.scale 3 # renderText "F015"
        , F016.figure # D.scale 3 # renderText "F016"
        ]
    r2 =
      U.hor
        0
        [ F017.figure # D.scale 4 # renderText "F017"
        , F018.figure # D.scale 4 # renderText "F018"
        , F019.figure # D.scale 4 # renderText "F019"
        ]

composition2 :: (T.Render n b) => T.TDiagram n b
composition2 =
  U.group
    "COMPOSITION 2"
    [ D.alignL $
        U.ver
          0
          [ U.hor
              0
              [ F020.figure # D.scale 4 # renderText "F020"
              , F021.figure # D.scale 4 # renderText "F021"
              , F022.figure # D.scale 4 # renderText "F022"
              ]
          , U.hor
              0
              [ F023.figure # D.scale 4 # renderText "F023"
              , F024.figure # D.scale 4 # renderText "F024"
              , F025.figure # D.scale 4 # renderText "F025"
              ]
          ]
    ]

joligones :: (T.Render n b) => T.TDiagram n b
joligones =
  U.group
    "JOLIGONES"
    [ D.alignL $
        U.ver
          0
          [ row1
          , row2
          ]
    ]
  where
    row1 =
      U.hor
        0
        [ F026.figure # D.scale 3 # renderText "F026"
        , F027.figure # D.scale 3 # renderText "F027"
        , F028.figure # D.scale 3 # renderText "F028"
        , F029.figure # D.scale 3 # renderText "F029"
        ]
    row2 =
      U.hor
        0
        [ F030.figure # D.scale 3 # renderText "F030"
        , F031.figure # D.scale 3 # renderText "F031"
        , F032.figure # D.scale 3 # renderText "F032"
        , F033.figure # D.scale 3 # renderText "F033"
        ]

cheval :: (T.Render n b) => T.TDiagram n b
cheval =
  U.group
    "CHEVAL"
    [ D.alignL $
        U.ver
          0
          [ row1 # D.alignBL
          , row2 # D.alignBL
          , row3 # D.alignBL
          ]
    ]
  where
    row1 =
      U.hor
        0
        [ F034.figure # D.scale 4 # renderText "F034"
        , F035.figure # D.scale 4 # renderText "F035"
        , F036.figure # D.scale 4 # renderText "F036"
        ]
    row2 =
      U.hor
        0
        [ U.ver
            0
            [ F037.figure # D.scale 4 # renderText "F037"
            , F038.figure # D.scale 4 # renderText "F038"
            ]
            # D.alignBL
        , F039.figure # D.scale 8 # renderText "F039" # D.alignBL
        ]
    row3 =
      U.hor
        0
        [ D.alignBL $ F042.figure # D.scale 9 # renderText "F042"
        , D.alignBL $
            U.ver
              0
              [ F040.figure # D.scale 3 # renderText "F040"
              , F041.figure # D.scale 3 # renderText "F041"
              , F043.figure # D.scale 3 # renderText "F043"
              ]
        ]

lion :: (T.Render n b) => T.TDiagram n b
lion =
  D.alignL $
    U.group
      "LION"
      [ F044.figure # D.scale 6 # renderText "F044"
      , F045.figure # D.scale 6 # renderText "F045"
      ]

oiseauxPoissons :: (T.Render n b) => T.TDiagram n b
oiseauxPoissons =
  D.alignL $
    U.group
      "OISEAUX-POISSONS"
      [ F046.figure # D.scale 6 # renderText "F046"
      , F047.figure # D.scale 6 # renderText "F047"
      ]

smurf :: (T.Render n b) => T.TDiagram n b
smurf =
  D.alignL $
    U.group
      "SMURF"
      [ F048.figure # D.scale 6 # renderText "F048"
      , F049.figure # D.scale 6 # renderText "F049"
      ]

dragons :: (T.Render n b) => T.TDiagram n b
dragons =
  D.alignL $
    U.group
      "DRAGONS"
      [ U.ver
          0
          [ U.hor
              0
              [ F050.figure # D.scale 6 # renderText "F050"
              , F051.figure # D.scale 6 # renderText "F051"
              ]
              # D.alignBL
          , F052.figure # D.scale 12 # renderText "F052" # D.alignBL
          , U.hor
              0
              [ F053.figure # D.scale 6 # renderText "F053"
              , F054.figure # D.scale 6 # renderText "F054"
              ]
              # D.alignBL
          ]
      ]

bonus :: (T.Render n b) => T.TDiagram n b
bonus =
  D.alignL $
    U.group
      "Bonus"
      [ U.ver
          0
          [ BI.figure # D.scale 12 # renderText "BI"
          , BII.figure # D.scale 12 # renderText "BII"
          , BIII.figure # D.scale 12 # renderText "BIII"
          , BIV.figure # D.scale 12 # renderText "BIV"
          , BV.figure # D.scale 12 # renderText "BV"
          ]
      ]
