dirs = []
directories = []
hash = Hash.new(0)
i = -1

File.read("#{__dir__}/input.txt").split("\n").each do |e|
  dirs.pop if e.match?(/\$ cd /) && e.scan(/\$ cd (.+)/).flatten[0] == ".."

  if e.match?(/\$ cd /) && e.scan(/\$ cd (.+)/).flatten[0] != ".."
    directory = e.scan(/\$ cd (.+)/).flatten[0]
    i = -1
    directories << directory
    dirs << directories.join("/")
  end

  if e.match?(/(\d+) w*/)
    size = e.scan(/(\d+) w*/).flatten[0].to_i
    dirs.each { |f| hash[f] += size }
  end
end

p(hash.sort_by { |_k, v| v }.map { _1[1] }.select { |e| e <= 100000 }.sum)

# 1770595
