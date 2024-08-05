class Day6
  def initialize(file)
    @groups = File.read(file).split(/\n\n/)
  end

  def p1
    @groups.map() { |group| group.gsub("\n", "").split("").uniq.size }.sum
  end

  def p2
    @groups.map() { |group|
      group.split.map { |person| Set.new(person.split("")) }.reduce(:&).size
  }.sum
  end
end