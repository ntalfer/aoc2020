require "d9"

RSpec.describe "d9" do
  before(:all) do
    @day = Day9.new("spec/d9_input.txt")
  end
  it "p1" do
    expect(@day.p1).to eq(167829540)
  end
  it "p2" do
    expect(@day.p2).to eq(28045630)
  end
end