import fs from 'node:fs'
import path from 'node:path'

const diagnosticsPath =
  process.argv[2] ?? 'output/diagnostics.jsonl'

const diagnostics = fs
  .readFileSync(diagnosticsPath, 'utf8')
  .split(/\r?\n/)
  .filter(Boolean)
  .flatMap(line => {
    try {
      return [JSON.parse(line)]
    } catch {
      return []
    }
  })

const redundantImports = diagnostics.filter(
  d => d.severity === 'Warning' && d.code === 66111
)

const byFile = Map.groupBy(
  redundantImports,
  d => d.span.file
)

let removed = 0

for (const [fileName, warnings] of byFile) {
  const filePath = path.resolve(fileName)

  if (!fs.existsSync(filePath)) {
    console.warn(`File not found: ${fileName}`)
    continue
  }

  const source = fs.readFileSync(filePath, 'utf8')

  const eol = source.includes('\r\n') ? '\r\n' : '\n'
  const lines = source.split(/\r?\n/)

  // Очень важно идти снизу вверх,
  // иначе после первого удаления source spans съедут.
  const sorted = [...warnings].sort((a, b) => {
    if (a.span.start.line !== b.span.start.line) {
      return b.span.start.line - a.span.start.line
    }

    return b.span.start.column - a.span.start.column
  })

  for (const warning of sorted) {
    const { start, end } = warning.span

    // GHC-66111 указывает на всю import declaration.
    //
    // Поэтому удаляем строки от start.line до end.line
    // включительно.
    //
    // В твоих diagnostics start.column всегда 1
    // для GHC-66111.
    const from = start.line - 1
    const count = end.line - start.line + 1

    const removedText = lines
      .slice(from, from + count)
      .join(eol)

    console.log(
      `remove ${fileName}:${start.line}-${end.line}`
    )
    console.log(`  ${removedText.split(eol)[0].trim()}`)

    lines.splice(from, count)

    removed++
  }

  fs.writeFileSync(
    filePath,
    lines.join(eol),
    'utf8'
  )
}

console.log()
console.log(`Removed ${removed} redundant imports.`)