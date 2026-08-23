{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures (polygonesReguliers, etoilesRegulieres) where

import           Dessins.Types (ConstraintRender, TDiagram)
import           Dessins.Utils.Grid (group)
import           Dessins.Figures.PolygonesReguliers (figure01, figure02
                                                   , figure03, figure04
                                                   , figure05, figure06)
import           Dessins.Figures.EtoilesRegulieres (figure07, figure08, figure09
                                                  , figure10, figure11
                                                  , figure12)

polygonesReguliers :: ConstraintRender n b => TDiagram n b
polygonesReguliers = group
  "POLYGONES RÉGULIERS"
  [figure01, figure02, figure03, figure04, figure05, figure06]

etoilesRegulieres :: ConstraintRender n b => TDiagram n b
etoilesRegulieres = group
  "ÉTOILES RÉGULIÈRES"
  [figure07, figure08, figure09, figure10, figure11, figure12]