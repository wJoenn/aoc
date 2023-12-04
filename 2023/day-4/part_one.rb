sum = File.readlines("#{__dir__}/input.txt").sum do |line|
  numbers = line.split(": ").last.split(" | ").map { _1.split.map(&:to_i) }
  matching_numbers = numbers.first & numbers.last
  matching_numbers.empty? ? 0 : 2**(matching_numbers.length - 1)
end

puts sum
# 27454
