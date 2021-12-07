require_relative "problem"
module Day7
  class Part1 < Problem
    @day = 7

    def process(input)
      super.first.split(",").map(&:to_i)
    end

    def median
      input.sort[input.count / 2]
    end

    def align_at(n)
      input.map{ |c| (c - n).abs }.sum
    end

    def run
      align_at(median)
    end
  end

  class Part2 < Part1
    @day = 7

    def align_at(n)
      input.map{ |c| cost((c - n).abs).to_i }.sum
    end

    def cost(distance)
      (distance/2.0)*(distance + 1)
    end

    def run
      0.upto(input.max).map{ |n| align_at(n) }.min
    end
  end
end
