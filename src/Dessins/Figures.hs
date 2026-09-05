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
  , bonus
  )
where

import qualified Dessins.Utils as U

import qualified Dessins.Const as Const

import qualified Dessins.Types as T

import qualified Dessins.Figures.Bonus.Bonus as BI
import qualified Dessins.Figures.Bonus.FigureDragon as BII
import qualified Dessins.Figures.Bonus.TriangleFigureA as BIII
import qualified Dessins.Figures.Bonus.TriangleFigureB as BIV

import qualified Dessins.Figures.Build.Registry as R

polygonesReguliers :: (T.Render n b) => T.TDiagram n b
polygonesReguliers =
  U.group
    "POLYGONES RÉGULIERS"
    [ R.getFigure (R.lookupFigure (R.FigureId "figure001"))
    , R.getFigure (R.lookupFigure (R.FigureId "figure002"))
    , R.getFigure (R.lookupFigure (R.FigureId "figure003"))
    , R.getFigure (R.lookupFigure (R.FigureId "figure004"))
    , R.getFigure (R.lookupFigure (R.FigureId "figure005"))
    , R.getFigure (R.lookupFigure (R.FigureId "figure006"))
    ]

etoilesRegulieres :: (T.Render n b) => T.TDiagram n b
etoilesRegulieres =
  U.group
    "ÉTOILES RÉGULIÈRES"
    [ R.getFigure (R.lookupFigure (R.FigureId "figure007"))
    , R.getFigure (R.lookupFigure (R.FigureId "figure008"))
    , R.getFigure (R.lookupFigure (R.FigureId "figure009"))
    , R.getFigure (R.lookupFigure (R.FigureId "figure010"))
    , R.getFigure (R.lookupFigure (R.FigureId "figure011"))
    , R.getFigure (R.lookupFigure (R.FigureId "figure012"))
    ]

composition1 :: (T.Render n b) => T.TDiagram n b
composition1 =
  U.group
    "COMPOSITION 1"
    [ U.ver
        (Const.getRemSizeDiv (/ 2))
        [ row13to18
        , R.getFigure (R.lookupFigure (R.FigureId "figure019"))
        ]
    ]
  where
    row13to18 =
      U.hor
        (Const.getRemSizeDiv (/ 2))
        [ R.getFigure (R.lookupFigure (R.FigureId "figure013"))
        , R.getFigure (R.lookupFigure (R.FigureId "figure014"))
        , R.getFigure (R.lookupFigure (R.FigureId "figure015"))
        , R.getFigure (R.lookupFigure (R.FigureId "figure016"))
        , R.getFigure (R.lookupFigure (R.FigureId "figure017"))
        , R.getFigure (R.lookupFigure (R.FigureId "figure018"))
        ]

composition2 :: (T.Render n b) => T.TDiagram n b
composition2 =
  U.group
    "COMPOSITION 2"
    [ R.getFigure (R.lookupFigure (R.FigureId "figure020"))
    , R.getFigure (R.lookupFigure (R.FigureId "figure021"))
    , R.getFigure (R.lookupFigure (R.FigureId "figure022"))
    , R.getFigure (R.lookupFigure (R.FigureId "figure023"))
    , R.getFigure (R.lookupFigure (R.FigureId "figure024"))
    , R.getFigure (R.lookupFigure (R.FigureId "figure025"))
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
        [ R.getFigure (R.lookupFigure (R.FigureId "figure026"))
        , R.getFigure (R.lookupFigure (R.FigureId "figure027"))
        , R.getFigure (R.lookupFigure (R.FigureId "figure028"))
        , R.getFigure (R.lookupFigure (R.FigureId "figure029"))
        , R.getFigure (R.lookupFigure (R.FigureId "figure030"))
        , R.getFigure (R.lookupFigure (R.FigureId "figure031"))
        ]
    row2 =
      U.hor
        (Const.getRemSizeDiv (/ 2))
        [ R.getFigure (R.lookupFigure (R.FigureId "figure032"))
        , R.getFigure (R.lookupFigure (R.FigureId "figure033"))
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
        [ R.getFigure (R.lookupFigure (R.FigureId "figure034"))
        , R.getFigure (R.lookupFigure (R.FigureId "figure035"))
        , R.getFigure (R.lookupFigure (R.FigureId "figure036"))
        , R.getFigure (R.lookupFigure (R.FigureId "figure037"))
        , R.getFigure (R.lookupFigure (R.FigureId "figure038"))
        , R.getFigure (R.lookupFigure (R.FigureId "figure039"))
        ]
    row2 =
      U.hor
        (Const.getRemSizeDiv (/ 2))
        [ R.getFigure (R.lookupFigure (R.FigureId "figure040"))
        , R.getFigure (R.lookupFigure (R.FigureId "figure041"))
        , R.getFigure (R.lookupFigure (R.FigureId "figure042"))
        , R.getFigure (R.lookupFigure (R.FigureId "figure043"))
        ]

lion :: (T.Render n b) => T.TDiagram n b
lion =
  U.group
    "LION"
    [ R.getFigure (R.lookupFigure (R.FigureId "figure044"))
    , R.getFigure (R.lookupFigure (R.FigureId "figure045"))
    ]

oiseauxPoissons :: (T.Render n b) => T.TDiagram n b
oiseauxPoissons =
  U.group
    "OISEAUX-POISSONS"
    [ R.getFigure (R.lookupFigure (R.FigureId "figure046"))
    , R.getFigure (R.lookupFigure (R.FigureId "figure047"))
    ]

smurf :: (T.Render n b) => T.TDiagram n b
smurf =
  U.group
    "SMURF"
    [ R.getFigure (R.lookupFigure (R.FigureId "figure048"))
    ]

bonus :: (T.Render n b) => T.TDiagram n b
bonus =
  U.group
    "OISEAUX-POISSONS"
    [ BII.figureDragon
    , BIII.triangleFigure
    , BIV.triangleFigure
    , BI.bonus
    ]
