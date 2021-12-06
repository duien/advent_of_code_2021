require_relative "problem"
module Day6
  # Lanternfish reproduction

  class Part1 < Problem
    @day = 6

    def process(input)
      input.split(",").map(&:to_i)
    end

    def advance
      offspring = []
      advanced = input.map{ |fish| next_state(fish,offspring) }
      @input = advanced + offspring
    end

    def next_state(fish, offspring)
      case fish
      when 0
        offspring.push(8)
        6
      else
        fish - 1
      end
    end

    def run(days = 80)
      # days.times { advance }
      initial_count = input.count
      days.times do |d|
        advance
      end
      input.count
    end
  end

  class Part2 < Part1
    @day = 6

    attr_reader :population

    def process(input)
      population = [0,0,0,0,0,0,0,0,0]
      super.each{ |f| population[f] += 1 }
      @population = population
    end

    def advance
      created = population.shift
      population[6] += created
      population[8] = created
    end

    def run(days = 256)
      days.times { advance }
      population.sum
    end
  end
end
