module Main (main) where

import qualified Dessins.Build.Registry as R

import Control.Monad (forM_)
import Diagrams (SizeSpec, V2, mkWidth)
import Diagrams.Backend.SVG (renderSVG)

width :: SizeSpec V2 Double
width = mkWidth 480

createPath :: R.FigureId -> FilePath
createPath (R.FigureId unId) = "build/figure" ++ unId ++ ".svg"

renderFigure :: R.FigureSpec -> IO ()
renderFigure (R.FigureSpec unId fig) = renderSVG (createPath unId) width fig

main :: IO ()
main = forM_ R.figures renderFigure
