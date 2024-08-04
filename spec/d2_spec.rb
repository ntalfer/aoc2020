require "d2"

RSpec.describe "d2" do
  before(:all) do
    @d2 = Day2.new("spec/d2_input.txt")
  end
    it "p1" do
      expect(@d2.p1()).to eq(465)
    end
    it "p2" do
      expect(@d2.p2()).to eq(294)
    end
  end