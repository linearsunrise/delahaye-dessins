# delahaye-dessins

Окружение для воспроизведения геометрических построений из книг Delahaye
кодом на Haskell.

## Стек

- **GHC + cabal** (через ghcup) — тулчейн.
- **diagrams-lib** — декларативное описание картинки: примитивы
  (`circle`, `square`, `arc`, произвольные `Trail`) и комбинаторы
  (`atop`, `beside`, `hcat`, `rotate`, `translate`, `scale`, ...).
  Сам по себе backend-агностичен — не рендерит ничего, пока не выбран
  backend.
- **diagrams-rasterific** — backend, рендерящий диаграмму в растр
  (PNG). Чистый Haskell, без внешних C-библиотек — на Windows ставится
  без проблем. Используется по умолчанию, чтобы удобно сравнивать
  результат со сканами страниц книги.

### diagrams-svg (подключён, executable `example-svg`)

Рендер в SVG вместо PNG. Тоже чистый Haskell. Отличие от Rasterific-варианта
только в импорте (`Diagrams.Backend.SVG.CmdLine` вместо
`Diagrams.Backend.Rasterific.CmdLine`) — см. [app/ExampleSvg.hs](app/ExampleSvg.hs)
рядом с [app/Example.hs](app/Example.hs).

```bash
cabal run example-svg -- -o output/example.svg -w 800 -h 300
```

### Другие backend'ы (не подключены, но совместимы)

- **diagrams-canvas** (поверх `blank-canvas`) — вместо файла открывает
  окно: поднимает локальный сервер и рисует на настоящем HTML5
  `<canvas>` в браузере через WebSocket, с live-обновлением. Ближе
  всего к ощущению JS Canvas. Тоже чистый Haskell/JS, без нативных
  зависимостей — можно добавить отдельным executable, когда
  понадобится интерактивность/анимация, не трогая остальной код.
- **diagrams-cairo** — тоже умеет окно (через GTK), но тянет
  Cairo/GTK C-библиотеки — на Windows это боль, поэтому сознательно не
  используется.

## Структура

```
dessins.cabal      -- один executable на задачу, объявляется здесь
cabal.project
app/
  Example.hs       -- абстрактный пример workflow, НЕ решение задачи из книги
output/             -- сюда рендерятся PNG (в git не попадает)
```

Каждая задача — отдельный `.hs`-файл в `app/` с `main = mainWith diagram`
и отдельный executable-стэнза в `dessins.cabal`, по образцу `example`.

## Использование

Сборка:

```bash
cabal build
```

`output/` не в git (см. `.gitignore`) — создать один раз перед первым
запуском, backend сам папку не создаёт:

```bash
mkdir output
```

Рендер `Example.hs` в PNG (backend Rasterific даёт CLI-флаги `-o`/`-w`/`-h`
через `mainWith`):

```bash
cabal run example -- -o output/example.png -w 800 -h 300
```

Добавление новой задачи:

1. Скопировать `app/Example.hs` в `app/TaskNN.hs`, заменить содержимое
   диаграммы.
2. Добавить в `dessins.cabal` executable-стэнзу по образцу `example`
   (поменять `main-is` и имя executable).
3. `cabal run taskNN -- -o output/taskNN.png -w <W> -h <H>`.
