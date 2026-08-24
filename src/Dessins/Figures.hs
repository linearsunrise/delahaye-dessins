{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures (polygonesReguliers, etoilesRegulieres, composition) where

import Dessins.Const (getRemSizeDiv)
import Dessins.Figures.Composition
import Dessins.Figures.EtoilesRegulieres
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

composition :: (ConstraintRender n b) => TDiagram n b
composition =
  group
    "COMPOSITION"
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
