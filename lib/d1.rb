class Day1

  class << self
    def p1(file)
      numbers = IO.readlines(file).map(&:to_i)
      a, b = resolve_p1(numbers, 2020)
      a * b
    end

    def resolve_p1(numbers, sum)
      numbers.each do |a|
        b = sum - a
        if numbers.include?(b)
          return a, b
        end
      end
      false
    end

    def p2(file)
      numbers = IO.readlines(file).map(&:to_i)
      resolve_p2(numbers, 2020)
    end

    def resolve_p2(numbers, sum)
      numbers.each do |a|
        sum2 = sum - a
        res = resolve_p1(numbers, sum2)
        if res
          b, c = res
          return a * b * c
        end
      end
      0
    end
  end
end