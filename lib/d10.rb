class Day10
  def initialize(file)
    @n = []
    File.foreach(file, chomp: true) { |line| @n << line.to_i }
    @n.sort!
  end

  def p1
    diffs = get_diffs()
    diffs[0] * (diffs[1] + 1)
  end

  def get_diffs(diff1=0, diff3=0, index=0)

    if index > (@n.size-1)
      return [diff1, diff3]
    end

    curr = @n[index]
    prev = (index == 0) ? 0 : @n[index-1]

    case (curr - prev)
    when 1
      diff1 += 1
    when 3
      diff3 += 1
    end
    get_diffs(diff1, diff3, index+1)
  end

  def p2
    array = @n + [@n.max + 3]
    ans = {}
    ans[0] = 1
    for x in array
      ans[x] = ans.fetch(x - 1, 0) + ans.fetch(x - 2, 0) + ans.fetch(x - 3, 0)
    end
    ans[array[-1]]
  end

end