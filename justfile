format:
  fourmolu -i app src

format-check:
  fourmolu --mode check app src test

build:
  cabal build all

build-lib:
  cabal build lib:dessins

test:
  cabal test all

check:
  cabal build all
  fourmolu --mode check app src test