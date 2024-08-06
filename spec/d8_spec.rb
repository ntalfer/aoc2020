require "d8"

RSpec.describe "d8" do
  before(:all) do
    @day = Day8.new("spec/d8_input.txt")
  end
  it "p1" do
    expect(@day.p1).to eq(2051)
  end
  it "p2" do
    expect(@day.p2).to eq(2304)
  end
end