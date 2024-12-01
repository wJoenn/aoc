left, right = File.readlines("#{__dir__}/input.txt").map { _1.split.map(&:to_i) }.transpose.map(&:sort)
p left.each.with_index.sum { |n, i| (n - right[i]).abs }
