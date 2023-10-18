score = {
  "A X" => [4],
  "A Y" => [8],
  "A Z" => [3],
  "B X" => [1],
  "B Y" => [5],
  "B Z" => [9],
  "C X" => [7],
  "C Y" => [2],
  "C Z" => [6]
}

p(File.read("#{__dir__}/input.txt").lines.sum { score[_1.strip][0] })

# 12772
