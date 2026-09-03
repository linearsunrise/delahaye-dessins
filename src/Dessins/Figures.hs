{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures
  ( polygonesReguliers
  , etoilesRegulieres
  , composition1
  , composition2
  , joligones
  , cheval
  , lion
  , oiseauxPoissons
  , smurf
  )
where

import qualified Dessins.Const as Const
import qualified Dessins.Figures.Cheval as Cheval
import qualified Dessins.Figures.Composition1 as Composition1
import qualified Dessins.Figures.Composition2 as Composition2
import qualified Dessins.Figures.EtoilesRegulieres as EtoilesRegulieres
import qualified Dessins.Figures.Joligones as Joligones
import qualified Dessins.Figures.Lion as Lion
import qualified Dessins.Figures.OiseauxPoissons as OiseauxPoissons
import qualified Dessins.Figures.PolygonesReguliers as PolygonesReguliers
import qualified Dessins.Figures.Smurf as Smurf
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

polygonesReguliers :: (T.Render n b) => T.TDiagram n b
polygonesReguliers =
  U.group
    "POLYGONES RÉGULIERS"
    [ PolygonesReguliers.Figure001.figure
    , PolygonesReguliers.Figure002.figure
    , PolygonesReguliers.Figure003.figure
    , PolygonesReguliers.Figure004.figure
    , PolygonesReguliers.Figure005.figure
    , PolygonesReguliers.Figure006.figure
    ]

etoilesRegulieres :: (T.Render n b) => T.TDiagram n b
etoilesRegulieres =
  U.group
    "ÉTOILES RÉGULIÈRES"
    [ EtoilesRegulieres.Figure007.figure
    , EtoilesRegulieres.Figure008.figure
    , EtoilesRegulieres.Figure009.figure
    , EtoilesRegulieres.Figure010.figure
    , EtoilesRegulieres.Figure011.figure
    , EtoilesRegulieres.Figure012.figure
    ]

composition1 :: (T.Render n b) => T.TDiagram n b
composition1 =
  U.group
    "COMPOSITION 1"
    [ U.ver
        (Const.getRemSizeDiv (/ 2))
        [ row13to18
        , Composition1.Figure019.figure
        ]
    ]
  where
    row13to18 =
      U.hor
        (Const.getRemSizeDiv (/ 2))
        [ Composition1.Figure013.figure
        , Composition1.Figure014.figure
        , Composition1.Figure015.figure
        , Composition1.Figure016.figure
        , Composition1.Figure017.figure
        , Composition1.Figure018.figure
        ]

composition2 :: (T.Render n b) => T.TDiagram n b
composition2 =
  U.group
    "COMPOSITION 2"
    [ Composition2.Figure020.figure
    , Composition2.Figure021.figure
    , Composition2.Figure022.figure
    , Composition2.Figure023.figure
    , Composition2.Figure024.figure
    , Composition2.Figure025.figure
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
        [ Joligones.Figure026.figure
        , Joligones.Figure027.figure
        , Joligones.Figure028.figure
        , Joligones.Figure029.figure
        , Joligones.Figure030.figure
        , Joligones.Figure031.figure
        ]
    row2 =
      U.hor
        (Const.getRemSizeDiv (/ 2))
        [ Joligones.Figure032.figure
        , Joligones.Figure033.figure
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
        [ Cheval.Figure034.figure
        , Cheval.Figure035.figure
        , Cheval.Figure036.figure
        , Cheval.Figure037.figure
        , Cheval.Figure038.figure
        , Cheval.Figure039.figure
        ]
    row2 =
      U.hor
        (Const.getRemSizeDiv (/ 2))
        [ Cheval.Figure040.figure
        , Cheval.Figure041.figure
        , Cheval.Figure042.figure
        , Cheval.Figure043.figure
        ]

lion :: (T.Render n b) => T.TDiagram n b
lion =
  U.group
    "LION"
    [ Lion.Figure044.figure
    , Lion.Figure045.figure
    ]

oiseauxPoissons :: (T.Render n b) => T.TDiagram n b
oiseauxPoissons =
  U.group
    "OISEAUX-POISSONS"
    [ OiseauxPoissons.Figure046.figure
    , OiseauxPoissons.Figure047.figure
    , OiseauxPoissons.figureDragon
    , OiseauxPoissons.triangleFigure
    ]

smurf :: (T.Render n b) => T.TDiagram n b
smurf =
  U.group
    "SMURF"
    [ Smurf.Figure048.figure
    ]
