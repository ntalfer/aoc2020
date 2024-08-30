class Day11
  def initialize(file)
    @map = []
    @lines = []
    File.foreach(file, chomp: true) { |line| @lines << line.split("") }
    @width = @lines[0].size
    @height = @lines.size
    # add left and right margins
    @lines.map!() { |line| ["."] + line + ["."]}
    # add top and bottom lines
    empty_line = ("." * (@width + 2)).split("")
    @lines = [empty_line] + @lines + [empty_line]
    @map = @lines
  end

  def p1
    rounds = 0
    loop do
      changed = round()
      rounds += 1
      break if changed == 0
    end
    occupied = 0
    for y in 0..(@height+1)
      for x in 0..(@width+1)
        if @map[y][x] == "#"
          occupied += 1
        end
      end
    end
    occupied
  end

  def round
    changed = 0
    map = []
    for y in 0..(@height+1)
      map[y] = []
      for x in 0..(@width+1)
        if @map[y][x] == "."
          map[y] << "."
        elsif @map[y][x] == "L" && empty_around?(y, x)
          changed += 1
          map[y] << "#"
        elsif @map[y][x] == "#" && many_occupied_around?(y, x)
          changed += 1
          map[y] << "L"
        else
          map[y] << @map[y][x]
        end
      end
    end
    @map = map
    changed
  end

  def empty_around?(y, x)
    for yy in (y-1)..(y+1)
      for xx in (x-1)..(x+1)
        next if (x == xx) && (y == yy)
        return false if @map[yy][xx] == "#"
      end
    end
    true
  end

  def many_occupied_around?(y, x)
    count = 0
    for yy in (y-1)..(y+1)
      for xx in (x-1)..(x+1)
        next if (x == xx) && (y == yy)
        count += 1 if @map[yy][xx] == "#"
        return true if count >= 4
      end
    end
    false
  end

  def p2
    rounds = 0
    loop do
      #print_map
      changed = round_p2()
      rounds += 1
      break if changed == 0
    end
    occupied = 0
    for y in 1..@height
      for x in 1..@width
        if @map[y][x] == "#"
          occupied += 1
        end
      end
    end
    occupied
  end

  def round_p2
    changed = 0
    map = []
    for y in 0..(@height+1)
      map[y] = []
      for x in 0..(@width+1)
        if @map[y][x] == "."
          map[y] << "."
        elsif @map[y][x] == "L" && empty_around_p2?(y, x)
          changed += 1
          map[y] << "#"
        elsif @map[y][x] == "#" && many_occupied_around_p2?(y, x)
          changed += 1
          map[y] << "L"
        else
          map[y] << @map[y][x]
        end
      end
    end
    @map = map
    changed
  end

  def empty_around_p2?(y, x)
    occupied_around(y, x) == 0
  end

  def many_occupied_around_p2?(y, x)
    occupied_around(y, x) >= 5
  end

  def occupied_around(y, x)
     occupied_up(y, x) +
     occupied_down(y, x) +
     occupied_left(y, x) +
     occupied_right(y, x) +
     occupied_up_left(y, x) +
     occupied_up_right(y, x) +
     occupied_down_left(y, x) +
     occupied_down_right(y, x)
  end

  def occupied_up(y, x)
    #p "up"
    return 0 if y == 0
    yy = y-1
    return 1 if @map[yy][x] == "#"
    return 0 if @map[yy][x] == "L"
    return occupied_up(yy, x)
  end

  def occupied_down(y, x)
    #p "down"
    return 0 if y == (@height+1)
    yy = y+1
    return 1 if @map[yy][x] == "#"
    return 0 if @map[yy][x] == "L"
    return occupied_down(yy, x)
  end

  def occupied_left(y, x)
    #p "left"
    return 0 if x == 0
    xx = x-1
    return 1 if @map[y][xx] == "#"
    return 0 if @map[y][xx] == "L"
    return occupied_left(y, xx)
  end

  def occupied_right(y, x)
    #p "right"
    return 0 if x == (@width+1)
    xx = x+1
    return 1 if @map[y][xx] == "#"
    return 0 if @map[y][xx] == "L"
    return occupied_right(y, xx)
  end

  def occupied_up_left(y, x)
    #p "ul"
    yy = y-1
    xx = x-1
    while yy > 0 && xx > 0
      return 1 if @map[yy][xx] == "#"
      return 0 if @map[yy][xx] == "L"
      yy = yy-1
      xx = xx-1
    end
    return 0
  end

  def occupied_up_right(y, x)
    #p "ur"
    yy = y-1
    xx = x+1
    while yy > 0 && xx < (@width+1)
      return 1 if @map[yy][xx] == "#"
      return 0 if @map[yy][xx] == "L"
      yy = yy-1
      xx = xx+1
    end
    return 0
  end

  def occupied_down_left(y, x)
    #p "dl"
    yy = y+1
    xx = x-1
    while yy < (@height+1) && xx > 0
      return 1 if @map[yy][xx] == "#"
      return 0 if @map[yy][xx] == "L"
      yy = yy+1
      xx = xx-1
    end
    return 0
  end

  def occupied_down_right(y, x)
    #p "dr"
    yy = y+1
    xx = x+1
    while yy < (@height+1) && xx < (@width+1)
      return 1 if @map[yy][xx] == "#"
      return 0 if @map[yy][xx] == "L"
      yy = yy+1
      xx = xx+1
    end
    return 0
  end

  def print_map
    for y in 0..(@height+1)
      p @map[y].join
    end
  end
end