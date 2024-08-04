require "d3"

RSpec.describe "d3" do
  before(:all) do
    @day = Day3.new("spec/d3_input.txt")
  end
  it "p1" do
    expect(@day.p1).to eq(257)
  end
  it "p2" do
    expect(@day.p2).to eq(1744787392)
  end
end