require "d5"

RSpec.describe "d5" do
  before(:all) do
    @day = Day5.new("spec/d5_input.txt")
  end
  it "p1" do
    expect(@day.p1).to eq(904)
  end
  it "p2" do
    expect(@day.p2).to eq(669)
  end
end