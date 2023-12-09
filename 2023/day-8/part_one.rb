sequence, nodes = File.read("#{__dir__}/input.txt").split("\n\n")

nodes = nodes.split("\n").map { |node|
  data = node.split(" = ")
  directions = data[1].gsub(/[()]/, "").split(", ")

  next [data[0], directions]
}.to_h

step = 0
current = "AAA"
until current == "ZZZ"
  sequence += sequence if step == sequence.length

  direction = sequence[step] == "L" ? 0 : 1
  current = nodes[current][direction]

  step += 1
end

p step
# 19099
