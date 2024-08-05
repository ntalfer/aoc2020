require "d7"

RSpec.describe "d7" do
  before(:all) do
    @day = Day7.new("spec/d7_input.txt")
  end
  it "p1" do
    expect(@day.p1).to eq(337)
  end
  it "p2" do
    expect(@day.p2).to eq(50100)
  end
end