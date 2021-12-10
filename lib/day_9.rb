require_relative "problem"
require "pp"
require "set"

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
    def process(input)
      @heightmap = HeightMap.new(super)
    end

    attr_accessor :heightmap

    def run
      heightmap.basins.map(&:count).sort.last(3).reduce(&:*)
    end

  end

  class HeightMap
    # takes 2D array
    def initialize(rows)
      @rows = rows.map.with_index do |cols, y|
        cols.map.with_index do |v, x|
          Point.new(x: x, y: y, v: v)
        end
      end
      @basins = []
      @max_x = @rows.flatten.max_by(&:x).x
      @max_y = @rows.flatten.max_by(&:y).y
      build_basins
    end

    attr_accessor :basins, :rows, :max_x, :max_y

    def at(x,y)
      return nil if x > max_x || x < 0 || y > max_y || y < 0
      rows[y][x]
    end


    def build_basins
      rows.each do |cols|
        cols.each do |point|
          next if point.basin? || point.boundary?
          basin = basin_extent(point)
          @basins << basin
        end
      end
    end

    def basin_extent(point, depth = 0)
      return [] if point.nil? || point.basin? || point.boundary?
      point.basin = true

      [point] |
        basin_extent(at(point.x+1, point.y), depth + 1) |
        basin_extent(at(point.x-1, point.y), depth + 1) |
        basin_extent(at(point.x, point.y+1), depth + 1) |
        basin_extent(at(point.x, point.y-1), depth + 1)
    end
  end

  Point = Struct.new(:x, :y, :v, :basin, keyword_init: true) do
    def basin?
      !!basin
    end

    def boundary?
      v == 9
    end
  end
end
