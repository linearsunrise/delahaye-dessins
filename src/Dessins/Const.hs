{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Redundant bracket" #-}
module Dessins.Const (remSize, getRemSizeDiv) where

remSize :: Integer
remSize = 12

getRemSizeDiv :: (Num t1) => (t1 -> t2) -> t2
getRemSizeDiv fn = fn $ fromInteger remSize
