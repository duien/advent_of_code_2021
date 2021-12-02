require_relative "../lib/day_1"

RSpec.describe Day1::Part1 do
  let(:input) do
    <<~INPUT
    199
    200
    208
    210
    200
    207
    240
    269
    260
    263
    INPUT
  end

  subject { described_class.new(input) }
  describe Day1::Part1 do
    it "correctly counts increases in test input" do
      expect(subject.run).to eq(7)
    end
  end

  describe Day1::Part2 do
    it "correctly counts increasing windows" do
      expect(subject.run).to eq(5)
    end
  end

end
