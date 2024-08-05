require "d4"

RSpec.describe "d4" do
  before(:all) do
    @day = Day4.new("spec/d4_input.txt")
  end
  it "p1" do
    expect(@day.p1).to eq(254)
  end
  it "p2" do
    expect(@day.p2).to eq(184)
  end
end