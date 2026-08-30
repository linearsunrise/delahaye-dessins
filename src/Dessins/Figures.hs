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
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

polygonesReguliers :: (T.Render n b) => T.TDiagram n b
polygonesReguliers =
  U.group
    "POLYGONES RÉGULIERS"
    [ PolygonesReguliers.figure01
    , PolygonesReguliers.figure02
    , PolygonesReguliers.figure03
    , PolygonesReguliers.figure04
    , PolygonesReguliers.figure05
    , PolygonesReguliers.figure06
    ]

etoilesRegulieres :: (T.Render n b) => T.TDiagram n b
etoilesRegulieres =
  U.group
    "ÉTOILES RÉGULIÈRES"
    [ EtoilesRegulieres.figure07
    , EtoilesRegulieres.figure08
    , EtoilesRegulieres.figure09
    , EtoilesRegulieres.figure10
    , EtoilesRegulieres.figure11
    , EtoilesRegulieres.figure12
    ]

composition1 :: (T.Render n b) => T.TDiagram n b
composition1 =
  U.group
    "COMPOSITION 1"
    [ U.ver
        (Const.getRemSizeDiv (/ 2))
        [ row13to18
        , Composition1.figure19
        ]
    ]
  where
    row13to18 =
      U.hor
        (Const.getRemSizeDiv (/ 2))
        [ Composition1.figure13
        , Composition1.figure14
        , Composition1.figure15
        , Composition1.figure16
        , Composition1.figure17
        , Composition1.figure18
        ]

composition2 :: (T.Render n b) => T.TDiagram n b
composition2 =
  U.group
    "COMPOSITION 2"
    [ Composition2.figure20
    , Composition2.figure21
    , Composition2.figure22
    , Composition2.figure23
    , Composition2.figure24
    , Composition2.figure25
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
        [ Joligones.figure26
        , Joligones.figure27
        , Joligones.figure28
        , Joligones.figure29
        , Joligones.figure30
        , Joligones.figure31
        ]
    row2 =
      U.hor
        (Const.getRemSizeDiv (/ 2))
        [ Joligones.figure32
        , Joligones.figure33
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
        [ Cheval.figure34
        , Cheval.figure35
        , Cheval.figure36
        , Cheval.figure37
        , Cheval.figure38
        , Cheval.figure39
        ]
    row2 =
      U.hor
        (Const.getRemSizeDiv (/ 2))
        [ Cheval.figure40
        , Cheval.figure41
        , Cheval.figure42
        , Cheval.figure43
        ]

lion :: (T.Render n b) => T.TDiagram n b
lion =
  U.group
    "LION"
    [ Lion.figure44
    , Lion.figure45
    ]

oiseauxPoissons :: (T.Render n b) => T.TDiagram n b
oiseauxPoissons =
  U.group
    "OISEAUX-POISSONS"
    [ OiseauxPoissons.figure46
    , OiseauxPoissons.figure47
    , OiseauxPoissons.figureDragon
    ]
