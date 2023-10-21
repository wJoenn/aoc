input = File.read("#{__dir__}/input.txt").split("\n")

positions = []
hp = [0, 0]
np = [0, 0]
tps = [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]

input.each do |e|
  instruction = e.split

  instruction[1].to_i.times do
    positions << [tps.last[0], tps.last[1]]

    hp[0] -= 1 if instruction[0] == "L"
    hp[0] += 1 if instruction[0] == "R"
    hp[1] -= 1 if instruction[0] == "D"
    hp[1] += 1 if instruction[0] == "U"

    np = hp
    i = 1
    tps.each do |tp|
      tp[0] -= 1 if np[0] < tp[0] - 1 && np[1] == tp[1]
      tp[0] += 1 if np[0] > tp[0] + 1 && np[1] == tp[1]
      tp[1] -= 1 if np[1] < tp[1] - 1 && np[0] == tp[0]
      tp[1] += 1 if np[1] > tp[1] + 1 && np[0] == tp[0]

      (tp[0] -= 1) && (tp[1] -= 1) if (np[0] < tp[0] - 1 && np[1] < tp[1]) || (np[0] < tp[0] && np[1] < tp[1] - 1)
      (tp[0] += 1) && (tp[1] += 1) if (np[0] > tp[0] + 1 && np[1] > tp[1]) || (np[0] > tp[0] && np[1] > tp[1] + 1)
      (tp[0] += 1) && (tp[1] -= 1) if (np[0] > tp[0] + 1 && np[1] < tp[1]) || (np[0] > tp[0] && np[1] < tp[1] - 1)
      (tp[0] -= 1) && (tp[1] += 1) if (np[0] < tp[0] - 1 && np[1] > tp[1]) || (np[0] < tp[0] && np[1] > tp[1] + 1)

      i += 1
      np = tp
    end
  end
end

positions << [tps.last[0], tps.last[1]]
p positions.uniq.count

# 2467
