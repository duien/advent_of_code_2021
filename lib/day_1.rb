module Day1
  class Part1
    attr_accessor :input

    def initialize(input = load_input)
      @input = input.strip.lines.map(&:to_i)
    end

    def run
      count_increases(input)
    end

    def count_increases(list)
      list.each_cons(2).map do |from, to|
        1 if to > from
      end.compact.sum
    end

    def load_input
      file = File.join(__FILE__, "../../data/day_1.txt")
      file = File.expand_path(file)
      File.read(file)
    end
  end

  class Part2 < Part1
    def windows(list)
      list.each_cons(3).map(&:sum)
    end

    def run
      count_increases(windows(input))
    end
  end
end
