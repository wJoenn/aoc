p File.readlines("#{__dir__}/input.txt").map { _1.split.map(&:to_i) }.count do |report|
  [report.sort, report.sort.reverse].include?(report) && report.each_cons(2) do |a, b|
    break false if (a - b).abs > 3 || a == b
  end
end
