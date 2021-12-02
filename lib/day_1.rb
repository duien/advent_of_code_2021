module Day1
  class Part1
    attr_accessor :input

    def initialize(input = load_input)
      @input = input.strip.lines.map(&:to_i)
    end

    def run
      input.each_cons(2).map do |from, to|
        1 if to > from
      end.compact.sum
    end

    def load_input
      file = File.join(__FILE__, "../../data/day_1.txt")
      file = File.expand_path(file)
      File.read(file)
    end
  end
end
