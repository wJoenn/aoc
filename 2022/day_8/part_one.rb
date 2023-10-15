input = File.read("#{__dir__}/input.txt").split("\n").map { _1.chars.map(&:to_i) }

fx = input.map do |e|
  e.map.with_index do |f, i|
    first = e.first(i + 1)
    last = e.last(e.length - i)
    (f == first.max && first.count(f) == 1) || (f == last.max && last.count(f) == 1) ? "v" : "x"
  end
end


fy = input.transpose.map do |e|
  e.map.with_index do |f, i|
    first = e.first(i + 1)
    last = e.last(e.length - i)
    (f == first.max && first.count(f) == 1) || (f == last.max && last.count(f) == 1) ? "v" : "x"
  end
end.transpose

p(input.map.with_index do |e, i|
  e.map.with_index { |_, j| fx[i][j] == "v" || fy[i][j] == "v" ? "v" : "x" }
end.flatten.count("v"))

# 1794
