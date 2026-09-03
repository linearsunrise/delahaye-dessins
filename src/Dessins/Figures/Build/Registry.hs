{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.Build.Registry
  ( figures
  , lookupFigure
  , FigureSpec (FigureSpec)
  , FigureId (FigureId)
  , FigureNum (FigureNum)
  )
where

import qualified Dessins.Figures.Bonus.Bonus as Bonus
import qualified Dessins.Figures.Bonus.FigureDragon as Bonus
import qualified Dessins.Figures.Bonus.TriangleFigure as Bonus
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
import qualified Dessins.Figures.EtoilesRegulieres.Figure007 as F007
import qualified Dessins.Figures.EtoilesRegulieres.Figure008 as F008
import qualified Dessins.Figures.EtoilesRegulieres.Figure009 as F009
import qualified Dessins.Figures.EtoilesRegulieres.Figure010 as F010
import qualified Dessins.Figures.EtoilesRegulieres.Figure011 as F011
import qualified Dessins.Figures.EtoilesRegulieres.Figure012 as F012
import qualified Dessins.Figures.Joligones.Figure026 as F026
import qualified Dessins.Figures.Joligones.Figure027 as F027
import qualified Dessins.Figures.Joligones.Figure028 as F028
import qualified Dessins.Figures.Joligones.Figure029 as F029
import qualified Dessins.Figures.Joligones.Figure030 as F030
import qualified Dessins.Figures.Joligones.Figure031 as F031
import qualified Dessins.Figures.Joligones.Figure032 as F032
import qualified Dessins.Figures.Joligones.Figure033 as F033
import qualified Dessins.Figures.Lion.Figure044 as F044
import qualified Dessins.Figures.Lion.Figure045 as F045
import qualified Dessins.Figures.OiseauxPoissons.Figure046 as F046
import qualified Dessins.Figures.OiseauxPoissons.Figure047 as F047
import qualified Dessins.Figures.PolygonesReguliers.Figure001 as F001
import qualified Dessins.Figures.PolygonesReguliers.Figure002 as F002
import qualified Dessins.Figures.PolygonesReguliers.Figure003 as F003
import qualified Dessins.Figures.PolygonesReguliers.Figure004 as F004
import qualified Dessins.Figures.PolygonesReguliers.Figure005 as F005
import qualified Dessins.Figures.PolygonesReguliers.Figure006 as F006
import qualified Dessins.Figures.Smurf.Figure048 as F048

import qualified Data.Map.Strict as Map
import Diagrams.Backend.SVG (SVG)
import Diagrams (Diagram)

data FigureSpec = FigureSpec
  { figureId :: FigureId
  , figureNum :: FigureNum
  , figurePath :: FilePath
  , figure :: Diagram SVG
  }

newtype FigureId
  = FigureId {unFigureId :: String}
  deriving (Eq, Ord, Show)

newtype FigureNum
  = FigureNum {numFigure :: String}
  deriving (Eq, Ord, Show)


figures :: [FigureSpec]
figures =
  [ FigureSpec
      { figureId = FigureId "figure001"
      , figureNum = FigureNum "001"
      , figurePath = "build/figure001.svg"
      , figure = F001.figure001
      }
  , FigureSpec
      { figureId = FigureId "figure002"
      , figureNum = FigureNum "002"
      , figurePath = "build/figure002.svg"
      , figure = F002.figure002
      }
  , FigureSpec
      { figureId = FigureId "figure003"
      , figureNum = FigureNum "003"
      , figurePath = "build/figure003.svg"
      , figure = F003.figure003
      }
  , FigureSpec
      { figureId = FigureId "figure004"
      , figureNum = FigureNum "004"
      , figurePath = "build/figure004.svg"
      , figure = F004.figure004
      }
  , FigureSpec
      { figureId = FigureId "figure005"
      , figureNum = FigureNum "005"
      , figurePath = "build/figure005.svg"
      , figure = F005.figure005
      }
  , FigureSpec
      { figureId = FigureId "figure006"
      , figureNum = FigureNum "006"
      , figurePath = "build/figure006.svg"
      , figure = F006.figure006
      }
  , FigureSpec
      { figureId = FigureId "figure007"
      , figureNum = FigureNum "007"
      , figurePath = "build/figure007.svg"
      , figure = F007.figure007
      }
  , FigureSpec
      { figureId = FigureId "figure008"
      , figureNum = FigureNum "008"
      , figurePath = "build/figure008.svg"
      , figure = F008.figure008
      }
  , FigureSpec
      { figureId = FigureId "figure009"
      , figureNum = FigureNum "009"
      , figurePath = "build/figure009.svg"
      , figure = F009.figure009
      }
  , FigureSpec
      { figureId = FigureId "figure010"
      , figureNum = FigureNum "010"
      , figurePath = "build/figure010.svg"
      , figure = F010.figure010
      }
  , FigureSpec
      { figureId = FigureId "figure011"
      , figureNum = FigureNum "011"
      , figurePath = "build/figure011.svg"
      , figure = F011.figure011
      }
  , FigureSpec
      { figureId = FigureId "figure012"
      , figureNum = FigureNum "012"
      , figurePath = "build/figure012.svg"
      , figure = F012.figure012
      }
  , FigureSpec
      { figureId = FigureId "figure013"
      , figureNum = FigureNum "013"
      , figurePath = "build/figure013.svg"
      , figure = F013.figure013
      }
  , FigureSpec
      { figureId = FigureId "figure014"
      , figureNum = FigureNum "014"
      , figurePath = "build/figure014.svg"
      , figure = F014.figure014
      }
  , FigureSpec
      { figureId = FigureId "figure015"
      , figureNum = FigureNum "015"
      , figurePath = "build/figure015.svg"
      , figure = F015.figure015
      }
  , FigureSpec
      { figureId = FigureId "figure016"
      , figureNum = FigureNum "016"
      , figurePath = "build/figure016.svg"
      , figure = F016.figure016
      }
  , FigureSpec
      { figureId = FigureId "figure017"
      , figureNum = FigureNum "017"
      , figurePath = "build/figure017.svg"
      , figure = F017.figure017
      }
  , FigureSpec
      { figureId = FigureId "figure018"
      , figureNum = FigureNum "018"
      , figurePath = "build/figure018.svg"
      , figure = F018.figure018
      }
  , FigureSpec
      { figureId = FigureId "figure019"
      , figureNum = FigureNum "019"
      , figurePath = "build/figure019.svg"
      , figure = F019.figure019
      }
  , FigureSpec
      { figureId = FigureId "figure020"
      , figureNum = FigureNum "020"
      , figurePath = "build/figure020.svg"
      , figure = F020.figure020
      }
  , FigureSpec
      { figureId = FigureId "figure021"
      , figureNum = FigureNum "021"
      , figurePath = "build/figure021.svg"
      , figure = F021.figure021
      }
  , FigureSpec
      { figureId = FigureId "figure022"
      , figureNum = FigureNum "022"
      , figurePath = "build/figure022.svg"
      , figure = F022.figure022
      }
  , FigureSpec
      { figureId = FigureId "figure023"
      , figureNum = FigureNum "023"
      , figurePath = "build/figure023.svg"
      , figure = F023.figure023
      }
  , FigureSpec
      { figureId = FigureId "figure024"
      , figureNum = FigureNum "024"
      , figurePath = "build/figure024.svg"
      , figure = F024.figure024
      }
  , FigureSpec
      { figureId = FigureId "figure025"
      , figureNum = FigureNum "025"
      , figurePath = "build/figure025.svg"
      , figure = F025.figure025
      }
  , FigureSpec
      { figureId = FigureId "figure026"
      , figureNum = FigureNum "026"
      , figurePath = "build/figure026.svg"
      , figure = F026.figure026
      }
  , FigureSpec
      { figureId = FigureId "figure027"
      , figureNum = FigureNum "027"
      , figurePath = "build/figure027.svg"
      , figure = F027.figure027
      }
  , FigureSpec
      { figureId = FigureId "figure028"
      , figureNum = FigureNum "028"
      , figurePath = "build/figure028.svg"
      , figure = F028.figure028
      }
  , FigureSpec
      { figureId = FigureId "figure029"
      , figureNum = FigureNum "029"
      , figurePath = "build/figure029.svg"
      , figure = F029.figure029
      }
  , FigureSpec
      { figureId = FigureId "figure030"
      , figureNum = FigureNum "030"
      , figurePath = "build/figure030.svg"
      , figure = F030.figure030
      }
  , FigureSpec
      { figureId = FigureId "figure031"
      , figureNum = FigureNum "031"
      , figurePath = "build/figure031.svg"
      , figure = F031.figure031
      }
  , FigureSpec
      { figureId = FigureId "figure032"
      , figureNum = FigureNum "032"
      , figurePath = "build/figure032.svg"
      , figure = F032.figure032
      }
  , FigureSpec
      { figureId = FigureId "figure033"
      , figureNum = FigureNum "033"
      , figurePath = "build/figure033.svg"
      , figure = F033.figure033
      }
  , FigureSpec
      { figureId = FigureId "figure034"
      , figureNum = FigureNum "034"
      , figurePath = "build/figure034.svg"
      , figure = F034.figure034
      }
  , FigureSpec
      { figureId = FigureId "figure035"
      , figureNum = FigureNum "035"
      , figurePath = "build/figure035.svg"
      , figure = F035.figure035
      }
  , FigureSpec
      { figureId = FigureId "figure036"
      , figureNum = FigureNum "036"
      , figurePath = "build/figure036.svg"
      , figure = F036.figure036
      }
  , FigureSpec
      { figureId = FigureId "figure037"
      , figureNum = FigureNum "037"
      , figurePath = "build/figure037.svg"
      , figure = F037.figure037
      }
  , FigureSpec
      { figureId = FigureId "figure038"
      , figureNum = FigureNum "038"
      , figurePath = "build/figure038.svg"
      , figure = F038.figure038
      }
  , FigureSpec
      { figureId = FigureId "figure039"
      , figureNum = FigureNum "039"
      , figurePath = "build/figure039.svg"
      , figure = F039.figure039
      }
  , FigureSpec
      { figureId = FigureId "figure040"
      , figureNum = FigureNum "040"
      , figurePath = "build/figure040.svg"
      , figure = F040.figure040
      }
  , FigureSpec
      { figureId = FigureId "figure041"
      , figureNum = FigureNum "041"
      , figurePath = "build/figure041.svg"
      , figure = F041.figure041
      }
  , FigureSpec
      { figureId = FigureId "figure042"
      , figureNum = FigureNum "042"
      , figurePath = "build/figure042.svg"
      , figure = F042.figure042
      }
  , FigureSpec
      { figureId = FigureId "figure043"
      , figureNum = FigureNum "043"
      , figurePath = "build/figure043.svg"
      , figure = F043.figure043
      }
  , FigureSpec
      { figureId = FigureId "figure044"
      , figureNum = FigureNum "044"
      , figurePath = "build/figure044.svg"
      , figure = F044.figure044
      }
  , FigureSpec
      { figureId = FigureId "figure045"
      , figureNum = FigureNum "045"
      , figurePath = "build/figure045.svg"
      , figure = F045.figure045
      }
  , FigureSpec
      { figureId = FigureId "figure046"
      , figureNum = FigureNum "046"
      , figurePath = "build/figure046.svg"
      , figure = F046.figure046
      }
  , FigureSpec
      { figureId = FigureId "figure047"
      , figureNum = FigureNum "047"
      , figurePath = "build/figure047.svg"
      , figure = F047.figure047
      }
  , FigureSpec
      { figureId = FigureId "figure048"
      , figureNum = FigureNum "048"
      , figurePath = "build/figure048.svg"
      , figure = F048.figure048
      }
  , FigureSpec
      { figureId = FigureId "figure049"
      , figureNum = FigureNum "049"
      , figurePath = "build/bonusSmear.svg"
      , figure = Bonus.bonus
      }
  , FigureSpec
      { figureId = FigureId "figure050"
      , figureNum = FigureNum "050"
      , figurePath = "build/bonusTriangleFigure.svg"
      , figure = Bonus.triangleFigure
      }
  , FigureSpec
      { figureId = FigureId "bonusDragon"
      , figureNum = FigureNum "051"
      , figurePath = "build/bonusDragon.svg"
      , figure = Bonus.figureDragon
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
