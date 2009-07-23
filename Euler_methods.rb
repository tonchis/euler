include Math
module Generic_methods
  def fib_upto(limit = 2)
    fib_0 = 1
    fib_1 = 1
    fib_present = 0
    serie = []
    while fib_present < limit
      fib_present = fib_0 + fib_1
      serie << fib_present
      fib_0 = fib_1
      fib_1 = fib_present
    end
    serie
  end

  def fib_upto_number_of_digits(limit)
    fib_0 = 1
    fib_1 = 1
    fib_present = 0
    serie = []
    until fib_present.to_s.size == limit
      fib_present = fib_0 + fib_1
      serie << fib_present
      fib_0 = fib_1
      fib_1 = fib_present
    end
    serie.size
  end

  def generate_pythagorean_triplet(u = 1, v = 2, x = 0)
    raise RuntimeError, "First two arguments can't be equal." if u == v
    m = 4*x + u + v
    n = x + v
    a = 2*m*n
    if m > n
      b = (m**2 - n**2)
      c = (m**2 + n**2)
    else
      b = (n**2 - m**2)
      c = (n**2 + m**2)
    end
    raise RuntimeError, "Generated triplet is not pythagorean" if not [a,b,c].pythagorean_triplet?
    [a,b,c]
  end

  def collatz(n = 1)
    sequence = []
    until n == 1
      sequence << n
      (n.even?)? n = n/2 : n = 3*n + 1
    end
    sequence
  end
end

class Integer
  def prime?
    2.upto(sqrt(self.abs).to_i) {|i| return false if self.modulo(i) == 0}
    self != 0? true : false
  end

  def next_prime
    result = self + 1
    until result.prime?
      result += 1
    end
    result
  end

  def factorize
    return {self => 1} if self.prime?
    n = self
    result = {}
    2.upto(self.abs.to_i) do |i|
      next if !i.prime? or n.modulo(i) != 0
      result[i] = 0
      while n.modulo(i) == 0
        n /= i
        result[i] += 1
      end
    end
    result
  end

  def palindrome?
    self.to_s == self.to_s.reverse
  end

  def next_pandigital
    n = self + 1
    until n.pandigital?
      n += 1
    end
    n
  end

  def pandigital?
    array = self.to_s.split("").collect! {|i| i.to_i}.sort!
    array == ((array.first)..(array.last)).to_a
  end

  def factorial
    result = 1
    self.downto(2) {|i| result *= i}
    result
  end

  def number_of_divisors
    result = 1
    self.factorize.each_value {|i| result *= (i + 1)}
    result
  end

  def split_into_digits
    self.to_s.split("").collect! {|i| i.to_i}
  end
end

class Array
  def sum
    self.inject {|acum, i| acum + i}
  end

  def prod
    self.inject {|acum, i| acum * i}
  end

  def pythagorean_triplet?
    self[0] < self[1] and self[1] < self[2] and self[0]**2 + self[1]**2 == self[2]**2
  end
end

class String
  def prod
    result = 1
    0.upto(size) {|i| result *= self[i].to_i}
    result
  end
end
