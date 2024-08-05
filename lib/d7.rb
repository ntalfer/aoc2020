class Day7
def initialize(file)
  @rules = []
  regex = /^(?<style>[a-z]*) (?<color>[a-z]*) bags contain (?<content>[a-z, 0-9]*)\.$/
  File.foreach(file, chomp: true) { |line|
    match_data = line.match(regex)
    content = match_data[:content]
    if content == "no other bags"
      children = []
    else
      children = content.split(", ").map { |s|
        match_data2 = s.match(/^(?<count>[0-9]*) (?<style>[a-z]*) (?<color>[a-z]*) bag(s)?$/)
        [match_data2[:count].to_i, {style: match_data2[:style], color: match_data2[:color]}]
      }
    end
    @rules << {style: match_data[:style], color: match_data[:color], children: children}
  }
end

def p1
  count = 0
  @rules.each { |rule|
    count += 1 if can_contain?(rule, "shiny", "gold")
  }
  count
end

def can_contain?(rule, style, color)
  children_bags = rule[:children].map { |_count, bag| bag }
  (children_bags.find { |bag|
  bag[:color] == color && bag[:style] == style} != nil) or
    (children_bags.any? { |bag|
      children_rule = find_rule(bag[:style], bag[:color])
      can_contain?(children_rule, style, color)
    })
end

def find_rule(style, color)
  @rules.find { |bag| bag[:color] == color && bag[:style] == style}
end

def p2
  rule = find_rule("shiny", "gold")
  count_rule_bags(rule) - 1
end

def count_rule_bags(rule)
  1 + count_children_bags(rule)
end

def count_children_bags(rule)
  children = rule[:children]
  return 0 if children == []
  children.map {|count, bag|
    r = find_rule(bag[:style], bag[:color])
    count * count_rule_bags(r)
}.sum
end

end