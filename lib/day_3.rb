require_relative "problem"
module Day3
  class Part1 < Problem
    @day = 3

    def process(input)
      super.map { |line| line.strip.split("") }
    end

    def run
      gamma_rate * epsilon_rate
    end

    def columns(list)
      first, *rest = *list
      first.zip(*rest)
    end

    def common_digits(list = input)
      columns(list).map do |c|
        c.select{ |v| v == "0" }.length > c.select{ |v| v == "1" }.length ? "0" : "1"
      end
    end

    def uncommon_digits(list = input)
      columns(list).map do |c|
        c.select{ |v| v == "0" }.length > c.select{ |v| v == "1" }.length ? "1" : "0"
      end
    end

    def gamma_rate
      common_digits.join("").to_i(2)
    end

    def epsilon_rate
      uncommon_digits.join("").to_i(2)
    end
  end

  class Part2 < Part1
    @day = 3
    def run
      oxygen_rating * co2_rating
    end

    def co2_rating
      position = 0
      candidates = input
      while candidates.length > 1
        candidates = candidates.select{ |c| c[position] == uncommon_digits(candidates)[position] }
        position += 1
      end
      candidates.first.join("").to_i(2)
    end

    def oxygen_rating
      position = 0
      candidates = input
      while candidates.length > 1
        candidates = candidates.select{ |c| c[position] == common_digits(candidates)[position] }
        position += 1
      end
      candidates.first.join("").to_i(2)
    end
  end
end
