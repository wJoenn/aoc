sum = File.readlines("#{__dir__}/input.txt").sum do |line|
  possible = line.split(": ").last.split("; ").all? do |result|
    cubes = result.split(", ").map(&:split).map(&:reverse).to_h
    cubes["blue"].to_i <= 14 && cubes["green"].to_i <= 13 && cubes["red"].to_i <= 12
  end

  possible ? line.match(/(?<id>\d+):/)[:id].to_i : 0
end

p sum
# 3059
