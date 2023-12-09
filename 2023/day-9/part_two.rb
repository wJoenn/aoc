result = File.readlines("#{__dir__}/input.txt").map { _1.split.map(&:to_i)}.sum do |history|
  sequences = [history]

  until sequences.first.all?(&:zero?)
    sequences.unshift([])
    sequences[1].each_cons(2) { |a, b| sequences.first << b - a }
  end

  for i in (1...sequences.length)
    x = sequences[i].first - sequences[i - 1].first
    sequences[i].unshift(x)
  end

  sequences.last.first
end

p result
# 928
