import fs from "fs"
import path from "path"

const NUMBERS = { one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9 }

fs.readFile(path.resolve(__dirname, "input.txt"), "utf8", (_, lines: string) => {
  const numbers = lines.split("\n").map(line => {
    const digits = [...line.matchAll(/(?=(one|two|three|four|five|six|seven|eight|nine|\d))/g)]
    if (digits.length === 0) return 0

    let firstDigit = digits[0][1]
    firstDigit = firstDigit.length > 1 ? NUMBERS[firstDigit] : firstDigit
    let lastDigit = digits.at(-1)![1]
    lastDigit = lastDigit.length > 1 ? NUMBERS[lastDigit] : lastDigit

    return +`${firstDigit}${lastDigit}`
  })

  const sum = numbers.reduce((acc, sum) => sum + acc)

  console.log(sum)
  // 54203
})
