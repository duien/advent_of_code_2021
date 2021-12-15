require_relative "../lib/day_13"

RSpec.describe Day13 do
  let(:input) do
    <<~DATA
    6,10
    0,14
    9,10
    0,3
    10,4
    4,11
    6,0
    6,12
    4,1
    0,13
    10,12
    3,4
    3,0
    8,4
    1,10
    2,14
    8,10
    9,0

    fold along y=7
    fold along x=5
    DATA
  end

  subject { described_class.new(input) }

  describe Day13::Part1 do
    it "counts dots after the first fold" do
      expect(subject.run).to eq(17)
    end
  end

  describe Day13::Part2 do
    it "..." do

    end
  end
end
