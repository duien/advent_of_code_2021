require 'pp'
require 'set'
require_relative "problem"

module Day12
  Cave = Struct.new(:name, :connections) do
    def small?
      name == name.downcase
    end
  end

  class Part1 < Problem
    @day = 12

    def process(input)
      super.map{ |l| l.split("-") }
    end

    def caves
      @caves ||= begin
                   names = input.flatten.uniq
                   caves = {}
                   names.each do |name|
                     caves[name] = Cave.new(name, Set.new)
                   end
                   input.each do |a,b|
                     caves[a].connections.add(b)
                     caves[b].connections.add(a)
                   end
                   caves
                 end
    end

    def valid_continuation(cave, so_far)
      if caves[cave].small?
        !so_far.include?(cave)
      else
        true
      end
    end
    def routes(so_far = ["start"])
      return @route_map << so_far if so_far.last == "end"
      all_connections = caves[so_far.last].connections
      valid_connections = all_connections.filter do |connection|
        valid_continuation(connection, so_far)
      end
      valid_connections.each do |connection|
        routes(so_far + [connection])
      end
    end

    def run
      @route_map = []
      routes

      @route_map.count
    end
  end

  class Part2 < Part1
    @day = 12

    def valid_continuation(cave, so_far)
      return false if cave == "start"
      return true if not caves[cave].small?
      if caves[cave].small?
        visits = so_far.filter{ |c| caves[c].small? }.tally

        # if we haven't been before, it's valid
        return true unless visits[cave]

        # if we've visited it twice, it's not
        return false if visits[cave] >= 2

        # after a single visit, it depends on if another small has been visited twice
        return false if visits.values.any?{ |v| v >= 2 }
        true
      else
        true # we can always visit big caves
      end
    end
  end
end
