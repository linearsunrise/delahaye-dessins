module Dessins.Types.Units where

deg :: (Eq a, Floating a, Num a) => a -> a
deg 90 = pi / 2
deg (-90) = -(pi / 2)
deg angle = angle * pi / 180
