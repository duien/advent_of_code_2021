require_relative "problem"
require "pp"
module Day9
  class Part1 < Problem
    @day = 9

    attr_accessor :heightmap
    def process(input)
      super
      @heightmap = input.lines.map{ |r| r.strip.split("").map(&:to_i) }
    end

    def low_points
      lows = []
      heightmap.each.with_index do |row, y|
        row.each.with_index do |col, x|
          adjacent = [
            {x: x + 1, y: y},
            {x: x - 1, y: y},
            {x: x, y: y + 1},
            {x: x, y: y - 1}
          ].reject{ |p|
            p[:x] < 0 ||
              p[:x] >= row.count ||
              p[:y] < 0 ||
              p[:y] >= heightmap.count
          }.map{ |p|
            p.update(v: heightmap[p[:y]][p[:x]])
          }
          lows << {x: x, y: y, v: col, adjacent: adjacent} if adjacent.all?{ |p| p[:v] > col }
        end
      end
      lows
    end

    def run
      low_points.map{ |p| p[:v] + 1 }.sum
    end
  end

  class Part2 < Part1
    @day = 9
  end
end
