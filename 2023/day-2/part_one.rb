sum = File.readlines("#{__dir__}/input.txt").sum do |line|
  possible = line.split(": ").last.split("; ").all? do |result|
    cubes = result.split(", ").to_h { _1.split.reverse }
    cubes["blue"].to_i <= 14 && cubes["green"].to_i <= 13 && cubes["red"].to_i <= 12
  end

  possible ? line.match(/(?<id>\d+):/)[:id].to_i : 0
end

p sum
# 3059
