{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wno-simplifiable-class-constraints #-}

module Dessins.Figures.Composition2.Common where

import Dessins.Const (getRemSizeDiv)
import qualified Dessins.Types as T
import qualified Dessins.Utils.Polygon as U
import qualified Dessins.Utils.Scene as U

import Data.Function ((&))
import Diagrams
  ( centerXY
  , r2
  , scale
  , scaleUToX
  , translate
  , (#)
  )
import Diagrams.Prelude (Bifunctor (bimap))

data FigureParams n = FigureParams
  { figureRadius :: n
  , compositionRadius :: n
  , innerVertices :: n
  , innerStep :: n
  , pointsCount :: n
  , mult :: n
  , starsPerCycle :: n
  }

renderFigure ::
  forall n b.
  (Enum n, T.Render n b) =>
  FigureParams n -> T.TDiagram n b
renderFigure params =
  let star :: (T.Render n b) => T.TDiagram n b
      star =
        U.polygonEtoile
          (params & innerVertices)
          (params & innerStep)
          # U.renderTrail

      vertices = [0 .. ((params & pointsCount) - 1)]

      calcVectors vert =
        let pCount = (params & starsPerCycle)
            rr = (params & compositionRadius) * (params & mult) ** vert
            t = vert
         in (U.yAxis t pCount 0, U.xAxis t pCount 0)
              # bimap (rr *) (rr *)
              # r2

      figures =
        map
          ( \x ->
              let vtx = calcVectors x
                  rr = (params & figureRadius) * (params & mult) ** x
                  figure =
                    star
                      # scale rr
                      # translate vtx
               in figure
          )
          vertices
   in mconcat figures
        # centerXY
        # scaleUToX (getRemSizeDiv (* 3))
        # U.squareFrame (getRemSizeDiv (* 4))
