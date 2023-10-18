f = "#{__dir__}/input.txt"

p(File.read(f).lines.sum { [*'a'..'z', *'A'..'Z'].index(_1.strip.chars.each_slice(_1.size / 2).reduce(&:&)[0]) + 1 })

# 8202
