require_relative "problem"
module Day14
  class Part1 < Problem
    @day = 14

    def process(input)
      cleaned = super
      @template = cleaned.shift.split("")
      cleaned.shift
      cleaned.inject({}){ |h, l|
        pair, insert = l.split(" -> ")
        h.update(pair.split("") => insert)
      }
    end

    def polymerize
      insertions = template.each_cons(2).map do |pair|
        if insert = input[pair]
          [insert, pair[1]]
        else
          pair
        end
      end.flatten
      @template = [template[0], *insertions]
    end

    attr_accessor :template
    def run
      10.times{ polymerize }
      counts = template.tally.values
      counts.max - counts.min
    end
  end

  class Part2 < Part1
    @day = 14
  end
end
