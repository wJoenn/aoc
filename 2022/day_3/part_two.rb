f = "#{__dir__}/input.txt"

p(File.read(f).lines.map { _1.chars }.each_slice(3).sum { [*'a'..'z', *'A'..'Z'].index(_1.reduce(&:&)[0]) + 1 })

# 2864
