input = File.read("#{__dir__}/input.txt").split("\n")

mks = {}
monkey = nil

input.each do |e|
  if e.match?(/Monkey/)
    monkey = e.gsub(":", "")
    mks[monkey] = {} if monkey
    mks[monkey][:inspected] = 0
  end
  mks[monkey][:items] = e.scan(/\d+/).map(&:to_i) if e.match?(/Starting items/)
  mks[monkey][:ope] = e.match(/([+*] .+)/)[1] if e.match?(/Operation/)
  mks[monkey][:div] = e.match(/(\d+)/)[1].to_i if e.match?(/Test/)
  mks[monkey][:tru] = e.match(/(monkey \d)/)[1].capitalize if e.match?(/If true/)
  mks[monkey][:fal] = e.match(/(monkey \d)/)[1].capitalize if e.match?(/If false/)
end

20.times do
  mks.each do |_k, v|
    length = v[:items].length
    v[:inspected] += length
    v[:items].each do |item|
      operator, number = v[:ope].split
      wor = (number == "old" ? item.send(operator, item) : item.send(operator, number.to_i))
      ((wor / 3) % v[:div]).zero? ? mks[v[:tru]][:items] << (wor / 3) : mks[v[:fal]][:items] << (wor / 3)
    end
    v[:items].shift(length)
  end
end

p mks.map { |_, v| v[:inspected] }.max(2).reduce(:*)

# 99852
