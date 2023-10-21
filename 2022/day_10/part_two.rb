input = File.read("#{__dir__}/input.txt").split("\n")

i = crt_step = 0
x = 1
crt = []

input.each do |e|
  i += 1
  [x - 1, x, x + 1].include?(crt_step) ? crt << "#" : crt << "."
  [40, 80, 120, 160, 200].include?(crt.length) ? crt_step = 0 : crt_step += 1
  next if e.match?(/noop/)

  i += 1
  [x - 1, x, x + 1].include?(crt_step) ? crt << "#" : crt << "."
  x += e.split[1].to_i
  [40, 80, 120, 160, 200].include?(crt.length) ? crt_step = 0 : crt_step += 1
end

crt.each_slice(40).to_a.each { p _1.join }

# EHPZPJGL
