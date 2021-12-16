require_relative "../lib/day_15"

RSpec.describe Day15 do
  let(:input) do
    <<~DATA
    1163751742
    1381373672
    2136511328
    3694931569
    7463417111
    1319128137
    1359912421
    3125421639
    1293138521
    2311944581
    DATA
  end

  subject { described_class.new(input) }

  describe Day15::Part1 do
    it "calculates the cost of lowest risk path" do
      expect(subject.run).to eq(40)
    end
  end

  describe Day15::Part2 do
    it "..." do

    end
  end
end
