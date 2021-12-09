require_relative "../lib/day_9"

RSpec.describe Day9 do
  let(:input) do
    <<~DATA
    2199943210
    3987894921
    9856789892
    8767896789
    9899965678
    DATA
  end

  subject { described_class.new(input) }

  describe Day9::Part1 do
    it "finds low points" do
      expect(subject.low_points.count).to eq(4)
    end

    it "finds total risk factor" do
      expect(subject.run).to eq(15)
    end
  end

  describe Day9::Part2 do
    it "..." do

    end
  end
end
