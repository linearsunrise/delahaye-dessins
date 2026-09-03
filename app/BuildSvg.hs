module Main (main) where

import Dessins.Figures.Build.Registry
  ( FigureSpec (FigureSpec)
  , figures
  )

import Control.Monad (forM_)
import Diagrams (mkWidth, V2, SizeSpec)
import Diagrams.Backend.SVG (renderSVG)

width :: SizeSpec V2 Double
width = mkWidth 480

renderFigure :: FigureSpec -> IO ()
renderFigure (FigureSpec _ _  path figure) = renderSVG path width figure

main :: IO ()
main = forM_ figures renderFigure
