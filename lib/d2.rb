class Day2
  def initialize(file)
    @rules = []
    regex = /(?<min>\d*)-(?<max>\d*) (?<letter>[a-z]): (?<password>[a-z]*)/
    File.foreach(file, chomp: true) { |line|
      hash = line.match(regex)
      @rules << [hash[:min].to_i, hash[:max].to_i, hash[:letter], hash[:password]]
    }
  end

  def p1()
    valid = 0
    @rules.each() { |min, max, letter, password|
      count = password.count(letter)
      valid += 1 if ((count >= min) && (count <= max))
    }
    valid
  end

  def p2()
    valid = 0
    @rules.each() { |i1, i2, letter, password|
      valid += 1 if (((password[i1-1] == letter) && (password[i2-1] != letter)) or ((password[i1-1] != letter) && (password[i2-1] == letter)))
    }
    valid
  end
end
