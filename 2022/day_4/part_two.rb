f = "#{__dir__}/input.txt"

p(File.read(f).lines.count { |e| e.split(",").map { _1.split "-" }.map { [*_1[0].to_i.._1[1].to_i] }.reduce(:&) != [] })

# 872
