require_relative "problem"
require "pp"

module Day10
  class Part1 < Problem
    @day = 10

    ERROR_SCORES = {
      ")" => 3,
      "]" => 57,
      "}" => 1197,
      ">" => 25137,
    }

    MATCHES = {
      "(" => ")",
      "[" => "]",
      "{" => "}",
      "<" => ">"
    }

    def process(input)
      super
    end

    def corrupted?(line)
      stack = []
      line.split("").each do |char|
        case char
        when "(", "[", "{", "<"
          stack.push char
        else
          return char if MATCHES[stack.pop] != char
        end
      end
      return nil
    end

    def corrupt = input.map{ |line| corrupted?(line) }.compact

    def run
      corrupt.map{ |c| ERROR_SCORES[c] }.sum
    end
  end

  class Part2 < Part1
    @day = 10

    AUTO_SCORES = {
      ")" => 1,
      "]" => 2,
      "}" => 3,
      ">" => 4
    }

    def incomplete?(line)
      stack = []
      line.split("").each do |char|
        case char
        when "(", "[", "{", "<"
          stack.push char
        else
          return nil if MATCHES[stack.pop] != char
        end
      end
      return nil if stack.empty?
      stack.reverse.map{ |c| MATCHES[c] }
    end

    def incomplete = input.map{ |line| incomplete?(line) }.compact

    def run
      scores = incomplete.map do |line|
        score = 0
        line.each do |char|
          score *= 5
          score += AUTO_SCORES[char]
        end
        score
      end
      scores.sort[scores.length / 2]
    end
  end
end
