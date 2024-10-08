class Day4
  def initialize(file)
    @pps = File.read(file).split(/\n\n/).map() { |s|
      s.split().map {|kv| kv.split(":")}.to_h
    }
    @mandatory = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
  end

  def p1
        valid = 0
    @pps.each { |pp|
      keys = pp.keys
      valid += 1 if @mandatory.all? { |m| keys.member?(m)}
    }
    valid
  end

  # byr (Birth Year) - four digits; at least 1920 and at most 2002.
  # iyr (Issue Year) - four digits; at least 2010 and at most 2020.
  # eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
  # hgt (Height) - a number followed by either cm or in:
  #     If cm, the number must be at least 150 and at most 193.
  #     If in, the number must be at least 59 and at most 76.
  # hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
  # ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
  # pid (Passport ID) - a nine-digit number, including leading zeroes.
  # cid (Country ID) - ignored, missing or not.

  def valid?(key, value)
    case key
    when "byr"
      v = Integer(value, exception: false)
      (v != nil) && (v >= 1920 && v <= 2002)
    when "iyr"
      v = Integer(value, exception: false)
      (v != nil) && (v >= 2010 && v <= 2020)
    when "eyr"
      v = Integer(value, exception: false)
      (v != nil) && (v >= 2020 && v <= 2030)
    when "hgt"
      data = /^(?<height>([0-9]+))(?<unit>(cm|in))$/.match(value)
      case data
      when nil
        false
      when data
        v = Integer(data[:height], exception: false)
        case data[:unit]
        when "cm"
          (v != nil) && (v >= 150 && v <= 193)
        when "in"
          (v != nil) && (v >= 59 && v <= 76)
        end
      end
    when "hcl"
      /^#[a-f0-9]{6}$/.match?(value)
    when "ecl"
      /^(amb|blu|brn|gry|grn|hzl|oth)$/.match?(value)
    when "pid"
      /^[0-9]{9}$/.match?(value)
    when "cid"
      true
    end
  end

  def p2
    valid = 0
    @pps.each { |pp|
      keys = pp.keys
      if @mandatory.all? { |m| keys.member?(m)}
        valid += 1 if keys.all? { |key| valid?(key, pp[key]) }
      end
    }
    valid
  end
end