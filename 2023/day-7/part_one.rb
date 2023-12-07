p File.readlines("#{__dir__}/input.txt").map { |line|
  line.strip.split
}.sort_by { |hand, _|
  cards = hand.chars
  combinations = cards.tally.values.sort

  [combinations[-1], combinations[-2], *cards.map { "23456789TJQKA".index(_1) }]
}.each_with_index.sum { |(_, bid), i|
  bid.to_i * (i + 1)
}

# 248559379
