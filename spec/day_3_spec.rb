require_relative "../lib/day_3"

RSpec.describe Day3 do
  let(:input) do
    <<~DATA
    00100
    11110
    10110
    10111
    10101
    01111
    00111
    11100
    10000
    11001
    00010
    01010
    DATA
  end

  subject { described_class.new(input) }

  describe Day3::Part1 do
    it "calculates gamma rate" do
      expect(subject.gamma_rate).to eq(22)
    end

    it "calculates the epsilon_rate" do
      expect(subject.epsilon_rate).to eq(9)
    end

    it "calculates the power consumption" do
      expect(subject.run).to eq(198)
    end
  end

  describe Day3::Part2 do
    @day = 3
    it "calculates life support rating" do
      expect(subject.run).to eq(230)
    end
    it "calculates oxygen_rating" do
      expect(subject.oxygen_rating).to eq(23)
    end
    it "calculate co2_rating" do
      expect(subject.co2_rating).to eq(10)
    end
  end
end
