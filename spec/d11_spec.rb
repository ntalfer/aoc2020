require "d11"

RSpec.describe "d11" do
  before(:each) do
    @day = Day11.new("spec/d11_input.txt")
  end
  it "p1" do
    expect(@day.p1).to eq(2424)
  end
  it "p2" do
    expect(@day.p2).to eq(2208)
  end
end