require_relative "../lib/day_2"

RSpec.describe Day2 do
  let(:input) do
    <<~INPUT
    forward 5
    down 5
    forward 8
    up 3
    down 8
    forward 2
    INPUT
  end

  subject { described_class.new(input) }

  describe Day2::Part1 do
    it "calculates the correct course" do
      subject.run
      expect(subject.position).to eq(15)
      expect(subject.depth).to eq(10)
    end

    it "finds the final answer" do
      expect(subject.run).to eq(150)
    end
  end

  describe Day2::Part2 do
    it "calculates the correct course" do
      subject.run
      expect(subject.position).to eq(15)
      expect(subject.depth).to eq(60)
    end

    it "finds the final answer" do
      expect(subject.run).to eq(900)
    end
  end
end
