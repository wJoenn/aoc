p File.readlines("#{__dir__}/input.txt").map { _1.split.map(&:to_i) }.count {
  p _1
  dir = nil
  counter = 0
  res = _1.each_cons(2) do |a, b|
    p "counter, #{counter}, dir: #{dir}"
    p "a: #{a}, b: #{b}, same: #{a == b}, big: #{(a - b).abs > 3}, asc: #{dir == "asc" && a > b}, desc: #{dir == "desc" && a < b}"
    next counter += 1 if a == b
    next counter += 1 if (a - b).abs > 3
    next counter += 1 if dir == "asc" && a > b
    next counter += 1 if dir == "desc" && a < b
    break false if counter > 1

    dir = (a < b ? 'asc' : 'desc')
  end

  p "res: #{res}"
  puts
  res
}
