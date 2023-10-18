require "csv"

arr = []
num = 0

CSV.foreach("#{__dir__}/input.csv") do |e|
  num += e[0].to_i unless e[0].nil?
  if e[0].nil?
    arr.push(num)
    num = 0
  end
end

p arr.max

# 64929
