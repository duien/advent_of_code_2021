require_relative "problem"
module Day15
  class Part1 < Problem
    @day = 15

    def process(input)
      super.map{ |line| line.split("").map(&:to_i) }
    end

    def x_max = @x_max ||= input.first.length - 1
    def y_max = @y_max ||= input.length - 1


    attr_accessor :cost_cache, :to_visit

    def run
      @cost_cache = {}
      @to_visit = [[x_max,y_max]]
      until to_visit.empty?
        calculate_costs(*to_visit.shift)
      end
      # visualize
      cost_cache[[0,0]] - input[0][0]
    end

    def calculate_costs(x = x_max, y = y_max)
      neighbors = [
        [x,y+1],
        [x,y-1],
        [x+1,y],
        [x-1,y]
      ].reject{ |x,y| x < 0 || x > x_max || y < 0 || y > y_max }

      visited, unvisited = neighbors.partition{ |pair| cost_cache.key? pair }

      # Use visited neighbors to generate the cost from this square
      cheapest_visited_neighbor = cost_cache.values_at(*visited).min || 0
      cost_cache[[x,y]] = input[y][x] + cheapest_visited_neighbor

      # Use unvisited neighbors to start the next round of calculation
      to_visit.push *unvisited if unvisited.any?
      to_visit.uniq!
    end

    def visualize
      input.each.with_index do |row,y|
        row.each.with_index do |value,x|
          print "%2s (%s) | " % [cost_cache[[x,y]], value]
        end
        print "\n"
      end
    end
  end

  class Part2 < Part1
    @day = 15
  end
end
