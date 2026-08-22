module Dessins.Figures (polygonesReguliers, etoilesRegulieres) where

import           Dessins.Figures.PolygonesReguliers
import           Dessins.Figures.EtoilesRegulieres
import           Dessins.Utils.Grid (group)
import           Diagrams.Prelude (Diagram)
import           Diagrams.Backend.SVG.CmdLine (B) -- TODO: заменить на что-то более универсальное, не зависящее конкретно от SVG

polygonesReguliers :: Diagram B
polygonesReguliers = group
  "POLYGONES RÉGULIERS"
  [figure01, figure02, figure03, figure04, figure05, figure06]

etoilesRegulieres :: Diagram B
etoilesRegulieres = group
  "ÉTOILES RÉGULIÈRES"
  [figure07, figure08, figure09, figure10, figure11, figure12]