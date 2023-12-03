import fs from "fs"
import path from "path"

const NUMBERS: { [key: string]: string } = {}

const appendNumber = (chars: string[][], x: number, y: number) => {
  if (!/\d/.test(chars[x][y])) return

  const digits = [chars[x][y]]

  let i = 1
  let keepGoing = true
  while (keepGoing && y - i >= 0) {
    if (/\d/.test(chars[x][y - i])) {
      digits.unshift(chars[x][y - i])
      i++
    } else {
      keepGoing = false
    }
  }

  let j = 1
  keepGoing = true
  while (keepGoing && y + j < chars[x].length) {
    if (/\d/.test(chars[x][y + j])) {
      digits.push(chars[x][y + j])
      j++
    } else {
      keepGoing = false
    }
  }

  const position = `${x}${y - i - 1}${y + j - 1}`
  NUMBERS[position] = digits.join("")
}

const findAndAppendNumbers = (chars: string[][], x: number, y: number) => {
  const xPositions: [number, boolean][] = [[x - 1, x > 0], [x, x >= 0], [x + 1, x < chars.length - 1]]
  xPositions.forEach(([xPosition, xCondition]) => {
    if (xCondition) {
      const yPositions: [number, boolean][] = [[y - 1, y > 0], [y, y >= 0], [y + 1, y < chars.length - 1]]
      yPositions.forEach(([yPosition, yCondition]) => {
        if (yCondition) {
          appendNumber(chars, xPosition, yPosition)
        }
      })
    }
  })
}

fs.readFile(path.resolve(__dirname, "input.txt"), "utf8", (_, lines: string) => {
  const linesOfChars = lines.trim().split("\n").map(line => line.split(""))

  linesOfChars.forEach((line, x) => {
    line.forEach((char, y) => {
      if (/[^.\d]/.test(char)) {
        findAndAppendNumbers(linesOfChars, x, y)
      }
    })
  })

  const sum = Object.values(NUMBERS).reduce((sum, number) => sum + +number, 0)
  console.log(sum)
  // 535078
})
