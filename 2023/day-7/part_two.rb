p File.readlines("#{__dir__}/input.txt").map { |line|
  line.strip.split
}.sort_by { |hand, _|
  cards = hand.chars
  score = cards.tally

  if score["J"] && score["J"] < 5
    best = score.sort_by { |_, amount| -amount }.reject { |card, _| card == "J" }.first.first
    score[best] += score["J"]
    score["J"] -= score["J"]
  end

  combinations = score.values.sort

  [combinations[-1], combinations[-2].to_i, *cards.map { "J23456789TQKA".index(_1) }]
}.each_with_index.sum { |(_, bid), j|
  bid.to_i * (j + 1)
}

# 249631254
