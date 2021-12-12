require_relative "../lib/day_11"

RSpec.describe Day11 do
  let(:input) do
    <<~DATA
    5483143223
    2745854711
    5264556173
    6141336146
    6357385478
    4167524645
    2176841721
    6882881134
    4846848554
    5283751526
    DATA
  end

  subject { described_class.new(input) }

  describe Day11::Part1 do
    it "counts flashes after 10 cycles" do
      subject.step(10)
      expect(subject.flashes).to eq(204)
    end

    it "counts flashes after 100 cycles" do
      expect(subject.run).to eq(1656)
    end
  end

  describe Day11::Part2 do
    it "finds the first step where everyone flashes" do
      expect(subject.run).to eq(195)
    end
  end
end
