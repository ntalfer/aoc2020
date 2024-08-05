require "d6"

RSpec.describe "d6" do
  before(:all) do
    @day = Day6.new("spec/d6_input.txt")
  end
  it "p1" do
    expect(@day.p1).to eq(6585)
  end
  it "p2" do
    expect(@day.p2).to eq(3276)
  end
end