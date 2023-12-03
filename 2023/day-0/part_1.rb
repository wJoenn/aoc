PRIMES = Set.new
CIRCULAR_PRIMES = Set.new

def prime?(number)
  return true if PRIMES.include?(number)

  return false unless PRIMES.to_a.all? { |prime| number % prime != 0 }

  PRIMES.add(number)
end

(2...231_116).each do |n|
  p n
  next unless prime?(n)

  (0...n.digits.length).each do |i|
    x = n.digits.reverse.rotate(i).join.to_i
    break unless prime?(x)

    CIRCULAR_PRIMES.add(n) if i == n.digits.length - 1
  end
end

p CIRCULAR_PRIMES.count
