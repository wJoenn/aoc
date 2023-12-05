import fs from "fs"
import path from "path"

fs.readFile(path.resolve(__dirname, "input.txt"), "utf8", (_, lines: string) => {
  const sum = lines.trim().split("\n").reduce((acc, line) => {
    console.log(line)
    const numbers = line.split(": ").at(-1)!.split(" | ").map(set => set.split(/\s+/).map(number => +number))
    const myNumbers = numbers.at(-1)!

    const matchingNumbers = numbers[0].filter(n => {
      const matchingNumberIndex = myNumbers.findIndex(m => m === n)
      if (matchingNumberIndex === -1) { return false }

      myNumbers.splice(matchingNumberIndex, 1)
      return true
    })

    return acc + (matchingNumbers.length === 0 ? 0 : 2 ** (matchingNumbers.length - 1))
  }, 0)

  console.log(sum)
  // 27518
})
