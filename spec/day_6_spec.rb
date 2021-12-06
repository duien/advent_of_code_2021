require_relative "../lib/day_6"

RSpec.describe Day6 do
  let(:input) do
    <<~DATA
    3,4,3,1,2
    DATA
  end

  subject { described_class.new(input) }

  describe Day6::Part1 do
    it "calculates population growth" do
      expect(subject.run(18)).to eq(26)
    end

    it "calculates 80 day population" do
      expect(subject.run).to eq(5934)
    end
  end

  describe Day6::Part2 do
    it "still caluclates 80 day population" do
      expect(subject.run 80).to eq(5934)
    end

    it "calculates 256 day population" do
      expect(subject.run).to eq(26_984_457_539)
    end
  end
end
