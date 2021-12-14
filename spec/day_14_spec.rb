require_relative "../lib/day_14"

RSpec.describe Day14 do
  let(:input) do
    <<~DATA
    NNCB

    CH -> B
    HH -> N
    CB -> H
    NH -> C
    HB -> C
    HC -> B
    HN -> C
    NN -> C
    BH -> H
    NC -> B
    NB -> B
    BN -> B
    BB -> N
    BC -> B
    CC -> N
    CN -> C
    DATA
  end

  subject { described_class.new(input) }

  describe Day14::Part1 do
    it "polymerizes" do
      subject.polymerize
      result = "NCNBCHB".split("")
      expect(subject.template).to eq(result)
    end
    it "calculates polymerization checksum" do
      expect(subject.run).to eq(1588)
    end
  end

  describe Day14::Part2 do
    it "..." do

    end
  end
end
