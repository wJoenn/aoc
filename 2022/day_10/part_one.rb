input = File.read("#{__dir__}/input.txt").split("\n")

i = 0
x = 1
sum = 0
input.each do |e|
  i += 1
  sum += i * x if [20, 60, 100, 140, 180, 220].include?(i)
  next if e.match?(/noop/)

  i += 1
  sum += i * x if [20, 60, 100, 140, 180, 220].include?(i)
  x += e.split[1].to_i
end

p sum

# 12520
