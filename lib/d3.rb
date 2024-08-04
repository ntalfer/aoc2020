class Day3
  def initialize(file)
    @map = []
    File.foreach(file, chomp: true).with_index { |line, y|
      @map[y] = []
      line.each_char.with_index { |char, x|
        @map[y][x] = char
      }
    }
    @height = @map.size
    @width = @map[0].size
  end

  def ride(right, down)
    y, x, trees = 0, 0, 0
    while y < @height
      trees += 1 if @map[y][x] == "#"
      x = (x + right) % @width
      y += down
    end
    trees
  end

  def p1
    ride(3, 1)
  end

  def p2
    ride(1,1) * ride(3,1) * ride(5,1) * ride(7,1) * ride(1,2)
  end
end