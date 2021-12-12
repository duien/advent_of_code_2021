require_relative "problem"
module Day11
  Octo = Struct.new(:v)
  class Part1 < Problem
    @day = 11

    # Octo-Power!

    def process(input)
      super.map{ |r| r.split("").map{ |o| Octo.new(o.to_i) } }
    end

    def initialize(*args)
      super
      @flashes = 0
    end

    attr_accessor :flashes

    def do_step
      step_flashes = []
      # Increase energy level of each octopus by 1
      input.map{ |c| c.map{ |o| o.v += 1 } }
      # Flash and increase adjacent energy
      loop do
        iteration_flash = false
        input.each.with_index do |column, r|
          column.each.with_index do |octo, c|
            if octo.v > 9 and !step_flashes.include?([r,c])
              step_flashes << [r,c]
              iteration_flash = true

              adjacent = [
                [r,c+1],
                [r,c-1],
                [r+1,c],
                [r+1,c+1],
                [r+1,c-1],
                [r-1,c],
                [r-1,c+1],
                [r-1,c-1]
              ].reject{ |r,c| r < 0 || c < 0 || r >= input.count || c >= input.first.count }
              adjacent.each do |r,c|
                input[r][c].v += 1
              end
            end
          end
        end
        break unless iteration_flash
      end

      # Reset this step's flashers
      step_flashes.each do |r,c|
        input[r][c].v = 0
      end
      self.flashes += step_flashes.count
      step_flashes.count
    end

    def inspect
      input.map{ |c| c.map{ |o| print o.v } ; print "\n" }
    end

    def step(n)
      n.times{ do_step}
    end

    def run
      step(100)
      flashes
    end
  end

  class Part2 < Part1
    @day = 11

    def run
      total_octos = input.count * input.first.count
      steps = 0
      loop do
        steps += 1
        return steps if do_step == total_octos
      end
    end
  end
end
