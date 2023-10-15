input = File.read("#{__dir__}/input.txt").split("\n").map { _1.chars.map(&:to_i) }

fx2 = input.map do |e|
  e.map.with_index do |f, i|
    left = right = 0
    e.first(i).reverse.each { |num| num < f ? left += 1 : (left += 1) && break }
    e.last(e.length - i - 1).each { |num| num < f ? right += 1 : (right += 1) && break }
    left * right
  end
end

fy2 = input.transpose.map do |e|
  e.map.with_index do |f, i|
    left = right = 0
    e.first(i).reverse.each { |num| num < f ? left += 1 : (left += 1) && break }
    e.last(e.length - i - 1).each { |num| num < f ? right += 1 : (right += 1) && break }
    left * right
  end
end.transpose

p(input.map.with_index { |e, i| e.map.with_index { |_, j| fx2[i][j] * fy2[i][j] } }.flatten.max)

# 199272
