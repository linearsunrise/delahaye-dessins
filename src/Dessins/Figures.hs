{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures (polygonesReguliers, etoilesRegulieres, composition) where

import Dessins.Figures.Composition
import Dessins.Figures.EtoilesRegulieres
import Dessins.Figures.PolygonesReguliers
import Dessins.Types (ConstraintRender, TDiagram)
import Dessins.Utils.Grid (group)

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
    [figure13]
