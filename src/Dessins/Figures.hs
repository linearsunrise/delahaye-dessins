{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures
  ( polygonesReguliers
  , etoilesRegulieres
  , composition1
  , composition2
  , joligones
  )
where

import Dessins.Const (getRemSizeDiv)
import Dessins.Figures.Composition1
import Dessins.Figures.Composition2
import Dessins.Figures.EtoilesRegulieres
import Dessins.Figures.Joligones
import Dessins.Figures.PolygonesReguliers
import Dessins.Types (ConstraintRender, TDiagram)
import Dessins.Utils.Grid (group, hor, ver)

polygonesReguliers :: (ConstraintRender n b) => TDiagram n b
polygonesReguliers =
  group
    "POLYGONES RÉGULIERS"
    [figure01, figure02, figure03, figure04, figure05, figure06]

etoilesRegulieres :: (ConstraintRender n b) => TDiagram n b
etoilesRegulieres =
  group
    "ÉTOILES RÉGULIÈRES"
    [figure07, figure08, figure09, figure10, figure11, figure12]

composition1 :: (ConstraintRender n b) => TDiagram n b
composition1 =
  group
    "COMPOSITION 1"
    [ ver
        (getRemSizeDiv (/ 2))
        [ row13to18
        , figure19
        ]
    ]
  where
    row13to18 =
      hor
        (getRemSizeDiv (/ 2))
        [figure13, figure14, figure15, figure16, figure17, figure18]

composition2 :: (ConstraintRender n b) => TDiagram n b
composition2 =
  group
    "COMPOSITION 2"
    [figure20, figure21, figure22, figure23, figure24, figure25]

joligones :: (ConstraintRender n b) => TDiagram n b
joligones =
  group
    "JOLIGONES"
    [ ver
        (getRemSizeDiv (/ 2))
        [ row1
        , row2
        ]
    ]
  where
    row1 =
      hor
        (getRemSizeDiv (/ 2))
        [ figure26
        , figure27
        , figure28
        , figure29
        , figure30
        , figure31
        ]
    row2 =
      hor
        (getRemSizeDiv (/ 2))
        [ figure32
        ]
