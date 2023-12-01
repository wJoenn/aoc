NUMBERS = { "one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5, "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9 }

sum = File.readlines("#{__dir__}/input.txt").sum do |line|
  numbers = line.scan(/(?=(one|two|three|four|five|six|seven|eight|nine|\d))/).flatten
  first_digit = numbers[0].length > 1 ? NUMBERS[numbers[0]] : numbers[0]
  last_digit = numbers[-1].length > 1 ? NUMBERS[numbers[-1]] : numbers[-1]

  "#{first_digit}#{last_digit}".to_i
end

p sum
# 54667
