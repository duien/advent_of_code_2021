require_relative "../lib/day_10"

RSpec.describe Day10 do
  let(:input) do
    <<~DATA
    [({(<(())[]>[[{[]{<()<>>
    [(()[<>])]({[<{<<[]>>(
    {([(<{}[<>[]}>{[]{[(<()>
    (((({<>}<{<{<>}{[]{[]{}
    [[<[([]))<([[{}[[()]]]
    [{[{({}]{}}([{[{{{}}([]
    {<[[]]>}<{[{[{[]{()[[[]
    [<(<(<(<{}))><([]([]()
    <{([([[(<>()){}]>(<<{{
    <{([{{}}[<[[[<>{}]]]>[]]
    DATA
  end

  subject { described_class.new(input) }

  describe Day10::Part1 do
    it "calculates the syntax error score" do
      expect(subject.run).to eq(26397)
    end

    it "finds corrupt lines" do
      expect(subject.corrupt.count).to eq(5)
    end
  end

  describe Day10::Part2 do
    it "calculates the completion score" do
      expect(subject.run).to eq(288957)
    end

    it "finds incomplete lines" do
      expect(subject.incomplete.count).to eq(5)
    end
  end
end
