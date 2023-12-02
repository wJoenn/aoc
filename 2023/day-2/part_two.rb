sum = File.readlines("#{__dir__}/input.txt").sum do |line|
  cubes = Hash.new(0)
  results = line.split(": ").last.split("; ").each do |result|
    result.split(", ").each do |cube|
      amount, colour = cube.split
      cubes[colour] = amount.to_i if cubes[colour] < amount.to_i
    end
  end

  cubes.values.reduce { |power, amount| power *= amount }
end

p sum
# 65371
