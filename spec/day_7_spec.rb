require_relative "../lib/day_7"

RSpec.describe Day7 do
  let(:input) do
    <<~DATA
    16,1,2,0,4,2,7,1,2,14
    DATA
  end

  subject { described_class.new(input) }

  describe Day7::Part1 do
    it "calculates the cost of a position" do
      expect(subject.align_at(2)).to eq(37)
    end

    it "finds the optimal position" do
      expect(subject.run).to eq(37)
    end
  end

  describe Day7::Part2 do
    it "calculates the cost of a position" do
      expect(subject.align_at(2)).to eq(206)
    end
    it "finds the optimal position" do
      expect(subject.run).to eq(168)
    end
    it "calculates cost for distance" do
      expect(subject.cost(3)).to eq(6)
    end
  end
end
