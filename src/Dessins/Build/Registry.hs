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

import qualified Dessins.Figures.Bonus.BonusI as BI
import qualified Dessins.Figures.Bonus.BonusII as BII
import qualified Dessins.Figures.Bonus.BonusIII as BIII
import qualified Dessins.Figures.Bonus.BonusIV as BIV

import qualified Data.Map.Strict as Map

data FigureId
  = Figure001
  | Figure002
  | Figure003
  | Figure004
  | Figure005
  | Figure006
  | Figure007
  | Figure008
  | Figure009
  | Figure010
  | Figure011
  | Figure012
  | Figure013
  | Figure014
  | Figure015
  | Figure016
  | Figure017
  | Figure018
  | Figure019
  | Figure020
  | Figure021
  | Figure022
  | Figure023
  | Figure024
  | Figure025
  | Figure026
  | Figure027
  | Figure028
  | Figure029
  | Figure030
  | Figure031
  | Figure032
  | Figure033
  | Figure034
  | Figure035
  | Figure036
  | Figure037
  | Figure038
  | Figure039
  | Figure040
  | Figure041
  | Figure042
  | Figure043
  | Figure044
  | Figure045
  | Figure046
  | Figure047
  | Figure048
  | BonusI
  | BonusII
  | BonusIII
  | BonusIV
  deriving (Eq, Ord, Show)

data FigureSpec = FigureSpec
  { figureId :: FigureId
  , figureNum :: FigureNum
  , figurePath :: FilePath
  , figure :: forall n b. (T.Render n b) => T.TDiagram n b
  }

newtype FigureNum
  = FigureNum {numFigure :: String}
  deriving (Eq, Ord, Show)

getFigure :: (T.Render n b) => Maybe FigureSpec -> T.TDiagram n b
getFigure = maybe mempty figure

getFigureById :: (T.Render n b) => FigureId -> T.TDiagram n b
getFigureById unId = getFigure (lookupFigure unId)

figures :: [FigureSpec]
figures =
  [ FigureSpec
      { figureId = Figure001
      , figureNum = FigureNum "001"
      , figurePath = "build/figure001.svg"
      , figure = F001.figure
      }
  , FigureSpec
      { figureId = Figure002
      , figureNum = FigureNum "002"
      , figurePath = "build/figure002.svg"
      , figure = F002.figure
      }
  , FigureSpec
      { figureId = Figure003
      , figureNum = FigureNum "003"
      , figurePath = "build/figure003.svg"
      , figure = F003.figure
      }
  , FigureSpec
      { figureId = Figure004
      , figureNum = FigureNum "004"
      , figurePath = "build/figure004.svg"
      , figure = F004.figure
      }
  , FigureSpec
      { figureId = Figure005
      , figureNum = FigureNum "005"
      , figurePath = "build/figure005.svg"
      , figure = F005.figure
      }
  , FigureSpec
      { figureId = Figure006
      , figureNum = FigureNum "006"
      , figurePath = "build/figure006.svg"
      , figure = F006.figure
      }
  , FigureSpec
      { figureId = Figure007
      , figureNum = FigureNum "007"
      , figurePath = "build/figure007.svg"
      , figure = F007.figure
      }
  , FigureSpec
      { figureId = Figure008
      , figureNum = FigureNum "008"
      , figurePath = "build/figure008.svg"
      , figure = F008.figure
      }
  , FigureSpec
      { figureId = Figure009
      , figureNum = FigureNum "009"
      , figurePath = "build/figure009.svg"
      , figure = F009.figure
      }
  , FigureSpec
      { figureId = Figure010
      , figureNum = FigureNum "010"
      , figurePath = "build/figure010.svg"
      , figure = F010.figure
      }
  , FigureSpec
      { figureId = Figure011
      , figureNum = FigureNum "011"
      , figurePath = "build/figure011.svg"
      , figure = F011.figure
      }
  , FigureSpec
      { figureId = Figure012
      , figureNum = FigureNum "012"
      , figurePath = "build/figure012.svg"
      , figure = F012.figure
      }
  , FigureSpec
      { figureId = Figure013
      , figureNum = FigureNum "013"
      , figurePath = "build/figure013.svg"
      , figure = F013.figure
      }
  , FigureSpec
      { figureId = Figure014
      , figureNum = FigureNum "014"
      , figurePath = "build/figure014.svg"
      , figure = F014.figure
      }
  , FigureSpec
      { figureId = Figure015
      , figureNum = FigureNum "015"
      , figurePath = "build/figure015.svg"
      , figure = F015.figure
      }
  , FigureSpec
      { figureId = Figure016
      , figureNum = FigureNum "016"
      , figurePath = "build/figure016.svg"
      , figure = F016.figure
      }
  , FigureSpec
      { figureId = Figure017
      , figureNum = FigureNum "017"
      , figurePath = "build/figure017.svg"
      , figure = F017.figure
      }
  , FigureSpec
      { figureId = Figure018
      , figureNum = FigureNum "018"
      , figurePath = "build/figure018.svg"
      , figure = F018.figure
      }
  , FigureSpec
      { figureId = Figure019
      , figureNum = FigureNum "019"
      , figurePath = "build/figure019.svg"
      , figure = F019.figure
      }
  , FigureSpec
      { figureId = Figure020
      , figureNum = FigureNum "020"
      , figurePath = "build/figure020.svg"
      , figure = F020.figure
      }
  , FigureSpec
      { figureId = Figure021
      , figureNum = FigureNum "021"
      , figurePath = "build/figure021.svg"
      , figure = F021.figure
      }
  , FigureSpec
      { figureId = Figure022
      , figureNum = FigureNum "022"
      , figurePath = "build/figure022.svg"
      , figure = F022.figure
      }
  , FigureSpec
      { figureId = Figure023
      , figureNum = FigureNum "023"
      , figurePath = "build/figure023.svg"
      , figure = F023.figure
      }
  , FigureSpec
      { figureId = Figure024
      , figureNum = FigureNum "024"
      , figurePath = "build/figure024.svg"
      , figure = F024.figure
      }
  , FigureSpec
      { figureId = Figure025
      , figureNum = FigureNum "025"
      , figurePath = "build/figure025.svg"
      , figure = F025.figure
      }
  , FigureSpec
      { figureId = Figure026
      , figureNum = FigureNum "026"
      , figurePath = "build/figure026.svg"
      , figure = F026.figure
      }
  , FigureSpec
      { figureId = Figure027
      , figureNum = FigureNum "027"
      , figurePath = "build/figure027.svg"
      , figure = F027.figure
      }
  , FigureSpec
      { figureId = Figure028
      , figureNum = FigureNum "028"
      , figurePath = "build/figure028.svg"
      , figure = F028.figure
      }
  , FigureSpec
      { figureId = Figure029
      , figureNum = FigureNum "029"
      , figurePath = "build/figure029.svg"
      , figure = F029.figure
      }
  , FigureSpec
      { figureId = Figure030
      , figureNum = FigureNum "030"
      , figurePath = "build/figure030.svg"
      , figure = F030.figure
      }
  , FigureSpec
      { figureId = Figure031
      , figureNum = FigureNum "031"
      , figurePath = "build/figure031.svg"
      , figure = F031.figure
      }
  , FigureSpec
      { figureId = Figure032
      , figureNum = FigureNum "032"
      , figurePath = "build/figure032.svg"
      , figure = F032.figure
      }
  , FigureSpec
      { figureId = Figure033
      , figureNum = FigureNum "033"
      , figurePath = "build/figure033.svg"
      , figure = F033.figure
      }
  , FigureSpec
      { figureId = Figure034
      , figureNum = FigureNum "034"
      , figurePath = "build/figure034.svg"
      , figure = F034.figure
      }
  , FigureSpec
      { figureId = Figure035
      , figureNum = FigureNum "035"
      , figurePath = "build/figure035.svg"
      , figure = F035.figure
      }
  , FigureSpec
      { figureId = Figure036
      , figureNum = FigureNum "036"
      , figurePath = "build/figure036.svg"
      , figure = F036.figure
      }
  , FigureSpec
      { figureId = Figure037
      , figureNum = FigureNum "037"
      , figurePath = "build/figure037.svg"
      , figure = F037.figure
      }
  , FigureSpec
      { figureId = Figure038
      , figureNum = FigureNum "038"
      , figurePath = "build/figure038.svg"
      , figure = F038.figure
      }
  , FigureSpec
      { figureId = Figure039
      , figureNum = FigureNum "039"
      , figurePath = "build/figure039.svg"
      , figure = F039.figure
      }
  , FigureSpec
      { figureId = Figure040
      , figureNum = FigureNum "040"
      , figurePath = "build/figure040.svg"
      , figure = F040.figure
      }
  , FigureSpec
      { figureId = Figure041
      , figureNum = FigureNum "041"
      , figurePath = "build/figure041.svg"
      , figure = F041.figure
      }
  , FigureSpec
      { figureId = Figure042
      , figureNum = FigureNum "042"
      , figurePath = "build/figure042.svg"
      , figure = F042.figure
      }
  , FigureSpec
      { figureId = Figure043
      , figureNum = FigureNum "043"
      , figurePath = "build/figure043.svg"
      , figure = F043.figure
      }
  , FigureSpec
      { figureId = Figure044
      , figureNum = FigureNum "044"
      , figurePath = "build/figure044.svg"
      , figure = F044.figure
      }
  , FigureSpec
      { figureId = Figure045
      , figureNum = FigureNum "045"
      , figurePath = "build/figure045.svg"
      , figure = F045.figure
      }
  , FigureSpec
      { figureId = Figure046
      , figureNum = FigureNum "046"
      , figurePath = "build/figure046.svg"
      , figure = F046.figure
      }
  , FigureSpec
      { figureId = Figure047
      , figureNum = FigureNum "047"
      , figurePath = "build/figure047.svg"
      , figure = F047.figure
      }
  , FigureSpec
      { figureId = Figure048
      , figureNum = FigureNum "048"
      , figurePath = "build/figure048.svg"
      , figure = F048.figure
      }
  , FigureSpec
      { figureId = BonusI
      , figureNum = FigureNum "I"
      , figurePath = "build/bonusSmear.svg"
      , figure = BI.figure
      }
  , FigureSpec
      { figureId = BonusII
      , figureNum = FigureNum "II"
      , figurePath = "build/bonusTriangleFigureA.svg"
      , figure = BII.figure
      }
  , FigureSpec
      { figureId = BonusIII
      , figureNum = FigureNum "III"
      , figurePath = "build/bonusTriangleFigureB.svg"
      , figure = BIII.figure
      }
  , FigureSpec
      { figureId = BonusIV
      , figureNum = FigureNum "IV"
      , figurePath = "build/bonusDragon.svg"
      , figure = BIV.figure
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
