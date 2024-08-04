require "d1"

RSpec.describe Day1 do
    it "part1" do
      expect(Day1.p1("spec/d1_input.txt")).to eq(928896)
    end
    it "part2" do
      expect(Day1.p2("spec/d1_input.txt")).to eq(295668576)
    end
  end