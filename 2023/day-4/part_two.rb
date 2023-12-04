COPIES = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

sum = File.readlines("#{__dir__}/input.txt").sum do |line|
  numbers = line.split(": ").last.split(" | ").map { _1.split.map(&:to_i) }
  matching_numbers = numbers.first & numbers.last

  doubles = COPIES[0]
  COPIES.shift
  COPIES << 1
  matching_numbers.length.times { COPIES[_1] += doubles }

  doubles
end

puts sum
# 6857330
