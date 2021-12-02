require_relative "problem"

module Day2
  class Part1 < Problem
    @day = 2

    attr_reader :position, :depth

    def setup
      @position = 0
      @depth = 0
    end

    def run
      setup
      input.each do |command|
        execute(*command)
      end
      position * depth
    end

    def execute(command, distance)
      case command
      when "forward"
        @position += distance
      when "down"
        @depth += distance
      when "up"
        @depth -= distance
      end
    end

    def process(input)
      lines = super
      lines.map do |line|
        command, distance = line.split
        [command, distance.to_i]
      end
    end
  end

  class Part2 < Part1
    @day = 2
    attr_reader :aim

    def setup
      super
      @aim = 0
    end

    def execute(command, distance)
      case command
      when "down"
        @aim += distance
      when "up"
        @aim -= distance
      when "forward"
        @position += distance
        @depth += distance * aim
      end
    end
  end
end
