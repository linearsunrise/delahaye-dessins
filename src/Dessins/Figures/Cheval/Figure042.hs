{-# LANGUAGE FlexibleContexts #-}

module Dessins.Figures.Cheval.Figure042 (figure) where

import qualified Dessins.Utils as U

import qualified Dessins.Const as Const

import qualified Dessins.Types as T

import qualified Dessins.Types.Convertable as Convertable

import Dessins.Figures.Cheval.Common

import qualified Dessins.Types.Geometry.Transformable as G
import qualified Dessins.Types.Geometry.Vector as G

import Diagrams ((#))
import qualified Diagrams as D

figure :: (T.Render n b) => T.TDiagram n b
figure =
  let iCount = 4 :: Integer
      chevals =
        [ f x y
        | x <- [-iCount .. iCount]
        , y <- [-iCount .. iCount]
        ]
        where
          warp (x, y, _) =
            let an =
                  if x == 0 then
                    pi / 2 * signum y
                  else
                    atan (y / x) + pi * (1 - signum x) / 2

                di =
                  sqrt (x ** 2 + y ** 2)
                    # \t -> t / (1 + t) * 0.65
             in (di * cos an, di * sin an, 0)

          by t = (fromIntegral t - 1) * 20
          aspect = 2 / 80

          f j i =
            chevalData
              # G.translate (G.Vector (by i) (by j) 0)
              # G.scaleBy (aspect, aspect)
              # G.warp warp
   in chevals
        # Convertable.combineFigures
        # Convertable.toDessinFrame
        # D.centerXY
        # D.scaleUToY (Const.getRemSizeDiv (* 3))
        # U.squareFrame (Const.getRemSizeDiv (* 4))
