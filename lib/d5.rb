class Day5
  def initialize(file)
    @seats = []
    File.foreach(file, chomp: true) { |line|
      data = /^(?<row>[A-Z]{7})(?<column>[A-Z]{3})$/.match(line)
      row = data[:row]
      column = data[:column]
      @seats << [row, column]
    }
  end

  def p1
    seat_ids().max
  end

  def seat_ids
    @seats.map { |row_path, column_path|
    row = get_place(row_path, 0, 127)
    column = get_place(column_path, 0, 7)
    row * 8 + column
    }
  end

  def get_place(path, min, max)
    return min if min == max

    if ["F", "L"].member?(path[0])
      get_place(path[1..-1], min, min + (max-min)/2)
    else
      get_place(path[1..-1], min + (max-min)/2 + 1, max)
    end
  end

  def p2
    seat_ids = seat_ids()
    seat_id = seat_ids.max
    while seat_id > 0
        return seat_id if !seat_ids.member?(seat_id)
        seat_id -= 1
    end
  end

end