require_relative "problem"
module Day5
  class Part1 < Problem
    @day = 5

    attr_reader :lines, :points
    def process(input)
      super
    end

    def lines
      @lines ||= input.map do |line|
        match_data = /(\d+),(\d+) -> (\d+),(\d+)/.match(line)
        [
          {x: match_data[1].to_i, y: match_data[2].to_i},
          {x: match_data[3].to_i, y: match_data[4].to_i}
        ]
      end
    end

    def on_grid
      lines.select{ |from, to| from[:x] == to[:x] || from[:y] == to[:y] }
    end

    def covered_points(from, to)
      from => {x: x1, y: y1}
      to => {x: x2, y: y2}
      case
      when x1 == x2
        range = y2 > y1 ? y1..y2 : y2..y1
        range.map{ |y| {x: x1, y: y} }
      when y1 == y2
        range = x2 > x1 ? x1..x2 : x2..x1
        range.map{ |x| {x: x, y: y1} }
      else
        range_x = x2 > x1 ? x1..x2 : (x2..x1).to_a.reverse
        range_y = y2 > y1 ? y1..y2 : (y2..y1).to_a.reverse
        range_x.to_a.zip(range_y.to_a).map{ |x,y| {x: x, y: y} }
      end
    end

    def points
      @points ||= on_grid.map{ |from, to| covered_points(from, to) }.flatten
    end

    def run
      points.tally.count{ |p,c| c > 1 }
    end
  end

  class Part2 < Part1
    @day = 5

    def points
      @points ||= lines.map{ |from, to| covered_points(from, to) }.flatten
    end

    def visualize
      tally = points.tally
      (0..9).each do |x|
        (0..9).each do |y|
          print tally[{x:y,y:x}] || "."
        end
        print "\n"
      end
    end
  end
end
