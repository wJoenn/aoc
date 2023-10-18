score = {
  "A X" => [3],
  "A Y" => [4],
  "A Z" => [8],
  "B X" => [1],
  "B Y" => [5],
  "B Z" => [9],
  "C X" => [2],
  "C Y" => [6],
  "C Z" => [7]
}

p(File.read("#{__dir__}/input.txt").lines.sum { score[_1.strip][0] })

# 11618
