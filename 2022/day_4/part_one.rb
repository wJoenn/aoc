f = "#{__dir__}/input.txt"

p(File.readlines(f).count do |e|
  e.split(?,).map { _1.split(?-) }.map { [*_1[0].to_i.._1[1].to_i] }.then { _1.include? _1.reduce(:&) }
end)

# 540
