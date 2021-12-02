require_relative "problem"
module Day1
  class Part1 < Problem
    @day = 1

    def process(input)
      super.map(&:to_i)
    end

    def run
      count_increases(input)
    end

    def count_increases(list)
      list.each_cons(2).map do |from, to|
        1 if to > from
      end.compact.sum
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
