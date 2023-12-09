sequence, nodes = File.read("#{__dir__}/input.txt").split("\n\n")

nodes = nodes.split("\n").map { |node|
  data = node.split(" = ")
  directions = data[1].gsub(/[()]/, "").split(", ")

  next [data[0], directions]
}.to_h

result = nodes.reduce(1) do |res, (key, _)|
  next res unless key.end_with?("A")

  step = 0
  current = key
  until current.end_with?("Z") do
    sequence += sequence if step == sequence.length

    direction = sequence[step] == "L" ? 0 : 1
    current = nodes[current][direction]

    step += 1
  end

  res.lcm(step)
end

p result
# 17099847107071
