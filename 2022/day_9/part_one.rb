input = File.read("#{__dir__}/input.txt").split("\n")

positions = []
hp = [0, 0]
tp = [0, 0]

input.each do |e|
  instruction = e.split

  instruction[1].to_i.times do
    positions << [tp[0], tp[1]]

    hp[0] -= 1 if instruction[0] == "L"
    hp[0] += 1 if instruction[0] == "R"
    hp[1] -= 1 if instruction[0] == "D"
    hp[1] += 1 if instruction[0] == "U"

    tp[0] -= 1 if hp[0] < tp[0] - 1 && hp[1] == tp[1]
    tp[0] += 1 if hp[0] > tp[0] + 1 && hp[1] == tp[1]
    tp[1] -= 1 if hp[1] < tp[1] - 1 && hp[0] == tp[0]
    tp[1] += 1 if hp[1] > tp[1] + 1 && hp[0] == tp[0]

    (tp[0] -= 1) && (tp[1] -= 1) if (hp[0] < tp[0] - 1 && hp[1] < tp[1]) || (hp[0] < tp[0] && hp[1] < tp[1] - 1)
    (tp[0] += 1) && (tp[1] += 1) if (hp[0] > tp[0] + 1 && hp[1] > tp[1]) || (hp[0] > tp[0] && hp[1] > tp[1] + 1)
    (tp[0] += 1) && (tp[1] -= 1) if (hp[0] > tp[0] + 1 && hp[1] < tp[1]) || (hp[0] > tp[0] && hp[1] < tp[1] - 1)
    (tp[0] -= 1) && (tp[1] += 1) if (hp[0] < tp[0] - 1 && hp[1] > tp[1]) || (hp[0] < tp[0] && hp[1] > tp[1] + 1)
  end
end

positions << [tp[0], tp[1]]
p positions.uniq.count

# 5874
