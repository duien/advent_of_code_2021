require_relative "../lib/day_8"

RSpec.describe Day8 do
  let(:input) do
    <<~DATA
    be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
    edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc
    fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg
    fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb
    aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea
    fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb
    dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe
    bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef
    egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb
    gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce
    DATA
  end

  subject { described_class.new(input) }

  describe Day8::Part1 do
    it "counts identifiable output values" do
      expect(subject.run).to eq(26)
    end
  end

  describe Day8::Part2 do
    describe Day8::Display do
      subject { described_class.new(input.lines.first) }

      it "finds output digits" do
        expect(subject.output).to eq(8394)
      end

      it "decodes the segments" do
        digit_map = {
          1=>["b", "e"],
          2=>["a", "b", "c", "d", "f"],
          3=>["b", "c", "d", "e", "f"],
          4=>["b", "c", "e", "g"],
          5=>["c", "d", "e", "f", "g"],
          6=>["a", "c", "d", "e", "f", "g"],
          7=>["b", "d", "e"],
          8=>["a", "b", "c", "d", "e", "f", "g"],
          9=>["b", "c", "d", "e", "f", "g"],
          0=>["a", "b", "d", "e", "f", "g"],
        }
        expect(subject.decode).to eq(digit_map)
      end
    end

    it "calculates total output value" do
      expect(subject.run).to eq(61229)
    end
  end
end
