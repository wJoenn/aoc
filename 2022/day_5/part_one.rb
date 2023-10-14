data = [["P", "F", "M", "Q", "W", "G", "R", "T"],
        ["H", "F", "R"],
        ["P", "Z", "R", "V", "G", "H", "S", "D"],
        ["Q", "H", "P", "B", "F", "W", "G"],
        ["P", "S", "M", "J", "H"],
        ["M", "Z", "T", "H", "S", "R", "P", "L"],
        ["P", "T", "H", "N", "M", "L"],
        ["F", "D", "Q", "R"],
        ["D", "S", "C", "N", "L", "P", "H"]]

p(File.read("#{__dir__}/input.txt").split("\n").map do |e|
  m, f, t = e.split("from").map { _1.scan(/\d+/).map(&:to_i) }.flatten
  m.times { data[t - 1].push(data[f - 1].pop) }
  data
end.last.map(&:last).join)

# TPGVQPFDH
