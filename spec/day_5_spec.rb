require_relative "../lib/day_5"

RSpec.describe Day5 do
  let(:input) do
    <<~DATA
    0,9 -> 5,9
    8,0 -> 0,8
    9,4 -> 3,4
    2,2 -> 2,1
    7,0 -> 7,4
    6,4 -> 2,0
    0,9 -> 2,9
    3,4 -> 1,4
    0,0 -> 8,8
    5,5 -> 8,2
    DATA
  end

  subject { described_class.new(input) }

  describe Day5::Part1 do
    it "filters only horizontal and vertical lines" do
      expect(subject.on_grid.count).to eq(6)
    end
    it "counts points with multiple lines" do
      expect(subject.run).to eq(5)
    end
    it "calculates covered points for a line" do
      line = [{x:1,y:1},{x:1,y:3}]
      points = [{x:1,y:1},{x:1,y:2},{x:1,y:3}]
      expect(subject.covered_points(*line)).to eq(points)
    end
  end

  describe Day5::Part2 do
    it "counts covered points for diagonal lines" do
      line = [{x:1,y:1},{x:3,y:3}]
      points = [{x:1,y:1},{x:2,y:2},{x:3,y:3}]
      expect(subject.covered_points(*line)).to eq(points)
    end

    it "counts diagonal points backwards" do
      line = [{x:3,y:3},{x:1,y:1}]
      points = [{x:3,y:3},{x:2,y:2},{x:1,y:1}]
      expect(subject.covered_points(*line)).to eq(points)
    end

    it "counts diagonal points leaning" do
      line = [{x:1,y:3},{x:3,y:1}]
      points = [{x:1,y:3},{x:2,y:2},{x:3,y:1}]
      expect(subject.covered_points(*line)).to eq(points)
    end

    it "counts points on multiple lines" do
      subject.visualize
      expect(subject.run).to eq(12)
    end
  end
end
