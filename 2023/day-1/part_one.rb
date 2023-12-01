p File.readlines("#{__dir__}/input.txt").sum { "#{_1.scan(/\d/)[0]}#{_1.scan(/\d/)[-1]}".to_i }
# 54667
