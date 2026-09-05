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
import qualified Dessins.Figures.Bonus as Bonus
import qualified Dessins.Figures.Bonus.TriangleFigureA as TriangleFigureA
import qualified Dessins.Figures.Bonus.TriangleFigureB as TriangleFigureB
import Dessins.Figures.Cheval as Cheval
import Dessins.Figures.Composition1 as Composition1
import Dessins.Figures.Composition2 as Composition2
import Dessins.Figures.EtoilesRegulieres as EtoilesRegulieres
import Dessins.Figures.Joligones as Joligones
import Dessins.Figures.Lion as Lion
import Dessins.Figures.OiseauxPoissons as OiseauxPoissons
import Dessins.Figures.PolygonesReguliers as PolygonesReguliers
import qualified Dessins.Figures.Smurf as Smurf
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

polygonesReguliers :: (T.Render n b) => T.TDiagram n b
polygonesReguliers =
  U.group
    "POLYGONES RÉGULIERS"
    [ PolygonesReguliers.figure001
    , PolygonesReguliers.figure002
    , PolygonesReguliers.figure003
    , PolygonesReguliers.figure004
    , PolygonesReguliers.figure005
    , PolygonesReguliers.figure006
    ]

etoilesRegulieres :: (T.Render n b) => T.TDiagram n b
etoilesRegulieres =
  U.group
    "ÉTOILES RÉGULIÈRES"
    [ EtoilesRegulieres.figure007
    , EtoilesRegulieres.figure008
    , EtoilesRegulieres.figure009
    , EtoilesRegulieres.figure010
    , EtoilesRegulieres.figure011
    , EtoilesRegulieres.figure012
    ]

composition1 :: (T.Render n b) => T.TDiagram n b
composition1 =
  U.group
    "COMPOSITION 1"
    [ U.ver
        (Const.getRemSizeDiv (/ 2))
        [ row13to18
        , figure019
        ]
    ]
  where
    row13to18 =
      U.hor
        (Const.getRemSizeDiv (/ 2))
        [ Composition1.figure013
        , Composition1.figure014
        , Composition1.figure015
        , Composition1.figure016
        , Composition1.figure017
        , Composition1.figure018
        ]

composition2 :: (T.Render n b) => T.TDiagram n b
composition2 =
  U.group
    "COMPOSITION 2"
    [ Composition2.figure020
    , Composition2.figure021
    , Composition2.figure022
    , Composition2.figure023
    , Composition2.figure024
    , Composition2.figure025
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
        [ Joligones.figure026
        , Joligones.figure027
        , Joligones.figure028
        , Joligones.figure029
        , Joligones.figure030
        , Joligones.figure031
        ]
    row2 =
      U.hor
        (Const.getRemSizeDiv (/ 2))
        [ figure032
        , figure033
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
        [ Cheval.figure034
        , Cheval.figure035
        , Cheval.figure036
        , Cheval.figure037
        , Cheval.figure038
        , Cheval.figure039
        ]
    row2 =
      U.hor
        (Const.getRemSizeDiv (/ 2))
        [ Cheval.figure040
        , Cheval.figure041
        , Cheval.figure042
        , Cheval.figure043
        ]

lion :: (T.Render n b) => T.TDiagram n b
lion =
  U.group
    "LION"
    [ figure044
    , figure045
    ]

oiseauxPoissons :: (T.Render n b) => T.TDiagram n b
oiseauxPoissons =
  U.group
    "OISEAUX-POISSONS"
    [ OiseauxPoissons.figure046
    , OiseauxPoissons.figure047
    , Bonus.figureDragon
    , TriangleFigureA.triangleFigure
    , TriangleFigureB.triangleFigure
    ]

smurf :: (T.Render n b) => T.TDiagram n b
smurf =
  U.group
    "SMURF"
    [ Smurf.figure048
    ]
