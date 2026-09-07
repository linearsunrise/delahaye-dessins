{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE RankNTypes #-}

module Dessins.Build.Registry where

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

import qualified Dessins.Figures.Bonus.BonusI as BI
import qualified Dessins.Figures.Bonus.BonusII as BII
import qualified Dessins.Figures.Bonus.BonusIII as BIII
import qualified Dessins.Figures.Bonus.BonusIV as BIV
import qualified Dessins.Figures.Bonus.BonusV as BV

import qualified Data.Map.Strict as Map

data FigureSpec = FigureSpec
  { figureId :: FigureId
  , figure :: forall n b. (T.Render n b) => T.TDiagram n b
  }

newtype FigureId
  = FigureId {uniqFigureId :: String}
  deriving (Eq, Ord, Show)

getFigure :: (T.Render n b) => Maybe FigureSpec -> T.TDiagram n b
getFigure = maybe mempty figure

getFigureById :: (T.Render n b) => FigureId -> T.TDiagram n b
getFigureById unId = getFigure (lookupFigure unId)

figures :: [FigureSpec]
figures =
  [ FigureSpec
      { figureId = FigureId "001"
      , figure = F001.figure
      }
  , FigureSpec
      { figureId = FigureId "002"
      , figure = F002.figure
      }
  , FigureSpec
      { figureId = FigureId "003"
      , figure = F003.figure
      }
  , FigureSpec
      { figureId = FigureId "004"
      , figure = F004.figure
      }
  , FigureSpec
      { figureId = FigureId "005"
      , figure = F005.figure
      }
  , FigureSpec
      { figureId = FigureId "006"
      , figure = F006.figure
      }
  , FigureSpec
      { figureId = FigureId "007"
      , figure = F007.figure
      }
  , FigureSpec
      { figureId = FigureId "008"
      , figure = F008.figure
      }
  , FigureSpec
      { figureId = FigureId "009"
      , figure = F009.figure
      }
  , FigureSpec
      { figureId = FigureId "010"
      , figure = F010.figure
      }
  , FigureSpec
      { figureId = FigureId "011"
      , figure = F011.figure
      }
  , FigureSpec
      { figureId = FigureId "012"
      , figure = F012.figure
      }
  , FigureSpec
      { figureId = FigureId "013"
      , figure = F013.figure
      }
  , FigureSpec
      { figureId = FigureId "014"
      , figure = F014.figure
      }
  , FigureSpec
      { figureId = FigureId "015"
      , figure = F015.figure
      }
  , FigureSpec
      { figureId = FigureId "016"
      , figure = F016.figure
      }
  , FigureSpec
      { figureId = FigureId "017"
      , figure = F017.figure
      }
  , FigureSpec
      { figureId = FigureId "018"
      , figure = F018.figure
      }
  , FigureSpec
      { figureId = FigureId "019"
      , figure = F019.figure
      }
  , FigureSpec
      { figureId = FigureId "020"
      , figure = F020.figure
      }
  , FigureSpec
      { figureId = FigureId "021"
      , figure = F021.figure
      }
  , FigureSpec
      { figureId = FigureId "022"
      , figure = F022.figure
      }
  , FigureSpec
      { figureId = FigureId "023"
      , figure = F023.figure
      }
  , FigureSpec
      { figureId = FigureId "024"
      , figure = F024.figure
      }
  , FigureSpec
      { figureId = FigureId "025"
      , figure = F025.figure
      }
  , FigureSpec
      { figureId = FigureId "026"
      , figure = F026.figure
      }
  , FigureSpec
      { figureId = FigureId "027"
      , figure = F027.figure
      }
  , FigureSpec
      { figureId = FigureId "028"
      , figure = F028.figure
      }
  , FigureSpec
      { figureId = FigureId "029"
      , figure = F029.figure
      }
  , FigureSpec
      { figureId = FigureId "030"
      , figure = F030.figure
      }
  , FigureSpec
      { figureId = FigureId "031"
      , figure = F031.figure
      }
  , FigureSpec
      { figureId = FigureId "032"
      , figure = F032.figure
      }
  , FigureSpec
      { figureId = FigureId "033"
      , figure = F033.figure
      }
  , FigureSpec
      { figureId = FigureId "034"
      , figure = F034.figure
      }
  , FigureSpec
      { figureId = FigureId "035"
      , figure = F035.figure
      }
  , FigureSpec
      { figureId = FigureId "036"
      , figure = F036.figure
      }
  , FigureSpec
      { figureId = FigureId "037"
      , figure = F037.figure
      }
  , FigureSpec
      { figureId = FigureId "038"
      , figure = F038.figure
      }
  , FigureSpec
      { figureId = FigureId "039"
      , figure = F039.figure
      }
  , FigureSpec
      { figureId = FigureId "040"
      , figure = F040.figure
      }
  , FigureSpec
      { figureId = FigureId "041"
      , figure = F041.figure
      }
  , FigureSpec
      { figureId = FigureId "042"
      , figure = F042.figure
      }
  , FigureSpec
      { figureId = FigureId "043"
      , figure = F043.figure
      }
  , FigureSpec
      { figureId = FigureId "044"
      , figure = F044.figure
      }
  , FigureSpec
      { figureId = FigureId "045"
      , figure = F045.figure
      }
  , FigureSpec
      { figureId = FigureId "046"
      , figure = F046.figure
      }
  , FigureSpec
      { figureId = FigureId "047"
      , figure = F047.figure
      }
  , FigureSpec
      { figureId = FigureId "048"
      , figure = F048.figure
      }
  , FigureSpec
      { figureId = FigureId "049"
      , figure = F049.figure
      }
  , FigureSpec
      { figureId = FigureId "050"
      , figure = F050.figure
      }
  , FigureSpec
      { figureId = FigureId "051"
      , figure = F051.figure
      }
  , FigureSpec
      { figureId = FigureId "052"
      , figure = F052.figure
      }
  , FigureSpec
      { figureId = FigureId "I"
      , figure = BI.figure
      }
  , FigureSpec
      { figureId = FigureId "II"
      , figure = BII.figure
      }
  , FigureSpec
      { figureId = FigureId "III"
      , figure = BIII.figure
      }
  , FigureSpec
      { figureId = FigureId "IV"
      , figure = BIV.figure
      }
  , FigureSpec
      { figureId = FigureId "V"
      , figure = BV.figure
      }
  ]

lookupFigure :: FigureId -> Maybe FigureSpec
lookupFigure target =
  Map.lookup target registry
  where
    registry =
      Map.fromList
        [ (figureId spec, spec)
        | spec <- figures
        ]
