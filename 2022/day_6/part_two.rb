arr = []
i = 0

File.read("#{__dir__}/input.txt").chars.each do |e|
  break puts i if arr.length == 14
  arr = arr.pop(arr.length - arr.index(e) - 1) if arr.include?(e)
  arr.push(e)
  i += 1
end

# 3051
