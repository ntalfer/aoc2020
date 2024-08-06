class Day8
  def initialize(file)
    @steps = []
    File.foreach(file, chomp: true) { |line|
      inst, count = line.split()
      @steps << {inst: inst, count: count.to_i, visited: false}
    }
  end

  def p1
    steps = @steps.clone.map(&:clone)
    res = traverse(steps)
    res[:loop]
  end

  def traverse(steps, index=0, acc=0)
    return {finished: acc} if index > (steps.size - 1)
    step = steps[index]
    return {loop: acc} if step[:visited]
    case step[:inst]
    when "acc"
      acc += step[:count]
      index += 1
    when "jmp"
      index += step[:count]
    when "nop"
      index += 1
    end
    step[:visited] = true
    traverse(steps, index, acc)
  end

  def p2
    traverse_p2()
  end

  def traverse_p2(to_change_index=0)
    inst = @steps[to_change_index][:inst]
    return traverse_p2(to_change_index + 1) if inst == "acc"
    inst = (inst == "jmp") ? "nop" : "jmp"
    steps = @steps.clone.map(&:clone)
    steps[to_change_index][:inst] = inst
    case traverse(steps)
    in {finished: acc}
      acc
    else
      traverse_p2(to_change_index + 1)
    end
  end

end