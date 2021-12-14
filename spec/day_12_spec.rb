require_relative "../lib/day_12"

RSpec.describe Day12 do
  let(:input) do
    <<~DATA
    start-A
    start-b
    A-c
    A-b
    b-d
    A-end
    b-end
    DATA
  end

  subject { described_class.new(input) }

  describe Day12::Part1 do
    it "counts valid paths" do
      expect(subject.run).to eq(10)
    end
  end

  describe Day12::Part2 do
    it "allows revisiting big caves" do
      path = ["start"]
      expect(subject.valid_continuation("A", path)).to be true
    end
    it "counts valid paths" do
      expect(subject.run).to eq(36)
    end
  end
end
