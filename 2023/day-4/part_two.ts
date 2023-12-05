import fs from "fs"
import path from "path"

const COPIES = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

fs.readFile(path.resolve(__dirname, "input.txt"), "utf8", (_, lines: string) => {
  const sum = lines.trim().split("\n").reduce((acc, line) => {
    const numbers = line.split(": ").at(-1)!.split(" | ").map(set => set.trim().split(/\s+/).map(number => +number))
    const myNumbers = numbers.at(-1)!

    const matchingNumbers = numbers[0].filter(n => {
      const matchingNumberIndex = myNumbers.findIndex(m => m === n)
      if (matchingNumberIndex === -1) { return false }

      myNumbers.splice(matchingNumberIndex, 1)
      return true
    })

    const doubles = COPIES[0]
    COPIES.splice(0, 1)
    COPIES.push(1)
    matchingNumbers.forEach((_, index) => { COPIES[index] += doubles })

    return acc + doubles
  }, 0)

  console.log(sum)
  // 6857330
})
