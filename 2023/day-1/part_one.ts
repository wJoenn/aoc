import fs from "fs"
import path from "path"

fs.readFile(path.resolve(__dirname, "input.txt"), "utf8", (_, lines: string) => {
  const numbers = lines.split("\n").map(line => {
    const digits = [...line.matchAll(/\d/g)]
    if (digits.length === 0) return 0

    return +`${digits[0]}${digits.at(-1)}`
  })

  const sum = numbers.reduce((acc, sum) => sum + acc)

  console.log(sum)
  // 54667
})
