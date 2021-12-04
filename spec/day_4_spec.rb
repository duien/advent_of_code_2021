require_relative "../lib/day_4"

RSpec.describe Day4 do
  let(:input) do
    <<~DATA
    7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1

    22 13 17 11  0
     8  2 23  4 24
    21  9 14 16  7
     6 10  3 18  5
     1 12 20 15 19

     3 15  0  2 22
     9 18 13 17  5
    19  8  7 25 23
    20 11 10 24  4
    14 21 16 12  6

    14 21 17 24  4
    10 16 15  9 19
    18  8 23 26 20
    22 11 13  6  5
     2  0 12  3  7
    DATA
  end

  subject { described_class.new(input) }

  describe Day4::Part1 do
    it "finds draws from the input" do
      expect(subject.draws.first(5)).to eq([7,4,9,5,11])
      expect(subject.draws.count).to eq(27)
    end

    it "finds boards from the input" do
      expect(subject.boards.count).to eq(3)
    end

    it "finds the winning score" do
      expect(subject.run).to eq(4512)
    end

  end

  describe Day4::Part2 do
    it "finds the score for the last winning board" do
      expect(subject.run).to eq(1924)
    end
  end

  describe Day4::Board do
    let(:input) do
      <<~DATA
      22 13 17 11  0
       8  2 23  4 24
      21  9 14 16  7
       6 10  3 18  5
       1 12 20 15 19
     DATA
    end

    it "parses numbers out of the board" do
      expect(subject.rows[0][0]).to eq({n: 22, mark: false})
      expect(subject.rows[1][0]).to eq({n:  8, mark: false})
    end

    it "marks numbers" do
      subject.mark(22)
      expect(subject.rows[0][0]).to eq({n: 22, mark: true})
    end

    it "maps values into columns" do
      expect(subject.columns[0][0]).to eq({n: 22, mark: false})
      expect(subject.columns[1][0]).to eq({n: 13, mark: false})
    end

    it "detects a winning row" do
      subject.rows.first.map{ |r| subject.mark(r[:n]) }
      expect(subject.winner?).to be true
    end

    it "detects a winning columns" do
      subject.columns.first.map{ |r| subject.mark(r[:n]) }
      expect(subject.winner?).to be true
    end
  end
end
