require_relative "problem"
module Day8
  class Part1 < Problem
    @day = 8

    # identifiable digits are 1, 4, 7, 8

    attr_accessor :output
    def process(input)
      super
      # @output = super.map{ |l| l.split("|")[1].strip.split(" ") }
    end

    def output
      @output ||= input.map{ |l| l.split("|")[1].strip.split(" ") }

    end

    def run
      output.flatten.count{ |s| [2,3,4,7].include?(s.length) }
    end
  end

  class Part2 < Part1
    @day = 8

    def run
      @input.map{ |i| Display.new(i).output }.sum
    end
  end

  class Display
    def initialize(line)
      @signals, @digits = line.split(" | ").map{ |x| x.split(" ") }
      @signals.map!{ |s| s.split("").sort }
      @digits.map!{ |s| s.split("").sort }
    end

    #  -   a
    # | | b c
    #  -   d
    # | | e f
    #  -   g

    attr_accessor :digits, :signals, :signal_map, :segment_map
    def decode
      @signal_map = {}
      signal_map[1] = signals.find{ |s| s.length == 2 }
      signal_map[4] = signals.find{ |s| s.length == 4 }
      signal_map[7] = signals.find{ |s| s.length == 3 }
      signal_map[8] = signals.find{ |s| s.length == 7 }

      @segment_map = {}
      # the top segment is the one that's in 7 but not in 1
      segment_map["a"] = signal_map[7] - signal_map[1]
      signal_map[9] = signals.find{ |s|
        s.length == 6 and
          s.include? signal_map[4][0] and
          s.include? signal_map[4][1] and
          s.include? signal_map[4][2] and
          s.include? signal_map[4][3]
      }
      signal_map[0] = signals.find{ |s|
        s.length == 6 and
          s != signal_map[9] and
          s.include? signal_map[1][0] and
          s.include? signal_map[1][1]
      }
      signal_map[6] = signals.find{ |s|
        s.length == 6 and
          s != signal_map[9] and
          s != signal_map[0]
      }
      segment_map["c"] = (signal_map[8] - signal_map[6]).first
      segment_map["e"] = (signal_map[8] - signal_map[9]).first
      signal_map[5] = signals.find{ |s| s == (signal_map[6] - [segment_map["e"]]) }

      remaining = signals - signal_map.values
      remaining.partition{ |s| s.include? segment_map["e"] } => [[two], [three]]
      signal_map[2] = two
      signal_map[3] = three

      signal_map
    end

    def output
      decode
      map_signals = signal_map.invert
      out_digits = digits.map{ |d| map_signals[d].to_s }
      out_digits.join("").to_i
    end
  end
end
