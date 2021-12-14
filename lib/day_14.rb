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

    def process(input)
      cleaned = input.strip.lines.map(&:strip)
      @template = cleaned.shift.split("")
      cleaned.shift
      cleaned.inject({}){ |h, l|
        pair, insert = l.split(" -> ")
        h.update(pair => insert)
      }
    end

    def run
      @counts = @template.each_cons(2).inject(Hash.new(0)) do |h, pair|
        h[pair.join("")] += 1
        h
      end
      40.times do
        recount = Hash.new(0)
        @counts.keys.each do |pair|
          insert = input[pair]
          p1 = pair[0]+insert
          p2 = insert+pair[1]
          recount[p1] += @counts[pair]
          recount[p2] += @counts[pair]
        end
        @counts = recount
      end
      @counts.keys.map{ |k| k.split("") }.flatten.uniq

      letter_counts = @counts.inject(Hash.new(0)) do |h, (pair, count)|
        h[pair[0]] += count
        h[pair[1]] += count
        h
      end
      letter_counts[template[0]] += 1
      letter_counts[template[-1]] += 1

      (letter_counts.values.max / 2) - (letter_counts.values.min / 2)
    end
  end
end
