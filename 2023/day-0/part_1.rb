PRIMES = Set.new
CIRCULAR_PRIMES = Set.new

def prime?(n)
  return true if PRIMES.include?(n)

  return false unless PRIMES.to_a.all? { |prime| n % prime != 0 }

  PRIMES.add(n)
end

(2...231_116).each do |n|
  p n
  next unless prime?(n)

  for i in (0...n.digits.length) do
    x = n.digits.reverse.rotate(i).join.to_i
    break unless prime?(x)

    CIRCULAR_PRIMES.add(n) if i == n.digits.length - 1
  end
end

p CIRCULAR_PRIMES.count
