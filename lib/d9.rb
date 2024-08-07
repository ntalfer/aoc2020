class Day9
  def initialize(file)
    @n = []
    File.foreach(file, chomp: true) { |line| @n << line.to_i }
  end

  def p1
    index = find_first_invalid(@n, 0, 25)
    @n[index]
  end

  def find_first_invalid(array, start_index, preamble_size)
    preamble = array[start_index..(start_index+preamble_size-1)]
    x = array[start_index+preamble_size]
    return start_index+preamble_size unless is_the_sum_of_two?(preamble, x)

    find_first_invalid(array, start_index+1, preamble_size)
  end

  def is_the_sum_of_two?(preamble, x)
    for i in 0..(preamble.size-1)
      a = preamble[i]
      b = x - a
      next if a == b
      return true if preamble.member?(b)
    end
    false
  end

  def p2
    invalid_index = find_first_invalid(@n, 0, 25)
    invalid = @n[invalid_index]
    array1 = @n[0..(invalid_index-1)]
    find_contiguous(array1, invalid, 0)
  end

  def find_contiguous(array, invalid, start_index)
    acc = 0
    for i in start_index..array.size-1
      acc += array[i]
      if acc == invalid
        a = array[start_index..i]
        return a.min + a.max
      elsif acc > invalid
        break
      else
        next
      end
    end
    find_contiguous(array, invalid, start_index + 1)
  end
end
