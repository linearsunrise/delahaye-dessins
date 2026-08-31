{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Dessins.Figures.OiseauxPoissons
  ( figure46
  , figure47
  , figureDragon
  , triangleFigure
  )
where

import Dessins.Const (getRemSizeDiv)
import qualified Dessins.Types as T
import qualified Dessins.Utils as U

import qualified Diagrams as D
import Diagrams.Prelude as DP ((#), Bifunctor (bimap))
import qualified Dessins.Utils as D

lionData :: (RealFloat n) => [[(n, n)]]
lionData =
  [ [ (11, 5)
    , (9, 6)
    , (7, 6)
    , (3, 4)
    , (2, 4)
    , (2.7, 3.3)
    , (2.7, 3.2)
    , (3, 3.2)
    , (3, 3.5)
    , (2.7, 3.5)
    , (2.7, 3.2)
    , (2.8, 3.2)
    , (3, 3)
    , (4, 3)
    , (5, 4)
    , (6, 4)
    , (5, 3)
    , (6, 1)
    , (9, 0)
    , (9, 1)
    , (7, 2)
    , (7, 4)
    , (7, 2)
    , (11, 0)
    , (11, 1)
    , (9, 3)
    , (10, 4)
    , (11, 4)
    , (11, 5)
    , (10, 7)
    , (11, 8)
    , (10, 8)
    , (9, 7)
    , (8, 7)
    , (7, 8)
    , (5, 9)
    , (5, 8)
    , (2, 9)
    , (2, 8)
    , (1, 8)
    , (0, 7)
    , (1, 7)
    , (0, 7)
    , (1.5, 5.5)
    , (2, 5.5)
    , (2, 6)
    , (1.5, 6)
    , (1.5, 5.5)
    , (2, 5)
    , (3, 7)
    , (4, 6)
    , (4, 7)
    , (3, 7)
    , (2, 8)
    , (7, 8)
    , (2, 8)
    , (3, 7)
    , (2, 5)
    , (5, 5)
    , (2, 5)
    , (2, 4)
    , (3, 4)
    , (7, 6)
    , (9, 6)
    , (11, 5)
    ]
      # map
        ( U.translate -- находим origin для симметрии
            ( -((fishBirdWidth + 2.5) / 2)
            , -((fishBirdHeight + 1.5) / 2)
            )
            . U.flipY
        )
  ]

fishBirdWidth :: (RealFloat n) => n
fishBirdWidth = 11

fishBirdHeight :: (RealFloat n) => n
fishBirdHeight = 9

createPath :: (T.Render n b) => [(n, n)] -> T.TDiagram n b
createPath x =
  getPointsList x
    # D.fromVertices
    # D.strokePath
    # D.fillRule D.EvenOdd
    # D.lw (D.global 0.045)
    # D.lineJoin D.LineJoinBevel

getPathsList ::
  (T.Render n b) =>
  [[(n, n)]] -> T.TDiagram n b
getPathsList =
  mconcat
    . map createPath

getPointsList :: [(n, n)] -> [D.Point D.V2 n]
getPointsList = map D.p2

figure46 :: (T.Render n b) => T.TDiagram n b
figure46 =
  lionData
    # getPathsList
    # D.centerXY
    # D.scaleUToX (getRemSizeDiv (* 3))
    # U.squareFrame (getRemSizeDiv (* 4))

figure47 :: (T.Render n b) => T.TDiagram n b
figure47 =
  let rows = 4 :: Int
      cols = 4 :: Int

      oiseauxPoissons =
        mconcat
          [ f x y
          | x <- [0 .. (cols - 1)]
          , y <- [0 .. (rows - 1)]
          ]
        where
          transformPipe i j point =
            let w = fishBirdWidth
                h = fishBirdHeight
                a = fromIntegral i
                b = fromIntegral j
             in point
                  # U.flipX
                  # U.translate
                    ( (w - 6) * b - (w - 2) * a
                    , (h - 5) * (a + b)
                    )

          f i j = map (map (transformPipe i j)) lionData
   in oiseauxPoissons
        # getPathsList
        # D.centerXY
        # D.scaleUToX (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))

dragonInitCurve :: (Floating b) => [(b, b)]
dragonInitCurve = [(0, 0), (1, 0)]

figureDragon :: (T.Render n b) => T.TDiagram n b
figureDragon =
  let setOrigin :: Num b => (b, b) -> (b, b) -> (b, b)
      setOrigin (ox, oy) = U.translate (-ox, -oy)
    
      rotate90 :: (Num b) => (b, b) -> (b, b)
      rotate90 (x, y) = (-y, x)
    
      dragon :: (Num b, Num t, Ord t) => [(b, b)] -> t -> [(b, b)]
      dragon xs n =
        if n <= 0 then
          xs
        else
          map (setOrigin (last xs) . rotate90) xs
            # (\ls -> reverse xs ++ tail ls)
            # (\ls -> dragon ls (n - 1))

      dr = dragon dragonInitCurve 12
   in [dr]
        # getPathsList
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))

triangleFigure :: (T.Render n b) => T.TDiagram n b
triangleFigure =
  let vector = (0,10) # U.rotateBy (pi / 2)
      n = 200
      g phi = 1 / (2 * cos phi)

      f 0 _ _ figureData           = figureData
      f m phi lastPoint figureData =
        f (m - 1) phi lp d
          where
            scaleFactor = g phi ** m * ((-1) ** (m + 1))
            rotateAngle = phi * m
            vec = vector
              # U.scaleBy (scaleFactor, scaleFactor)
              # U.rotateBy rotateAngle

            lp = lastPoint
              # U.translate vec
            d = lp : figureData

      angle = (59.5 * (pi / 180))
      initData = []
      comprehensionBy x = f x angle (0, 1) initData

      list = comprehensionBy n
   in list
        # createPath
        # D.centerXY
        # D.scaleUToY (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))

