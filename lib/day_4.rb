require_relative "problem"
module Day4
  # Bingo with a giant squid

  class Board
    attr_reader :rows, :last_call

    def initialize(layout)
      @rows = layout.split("\n").map{ |r| r.strip.split(/\s+/).map{ |n| {n: n.to_i, mark: false} } }
    end

    def columns
      first, *rest = *rows
      first.zip(*rest)
    end
    def mark(num)
      @last_call = num
      rows.each{ |r| r.each{ |v| v[:mark] = true if v[:n] == num } }
    end

    def winner?
      rows.any? { |r| r.all? { |v| v[:mark] } } ||
        columns.any? { |c| c.all? { |v| v[:mark] } }
    end

    # sum of all unmarked positions
    def unmarked
      rows.map{ |r| r.select{ |v| !v[:mark] } }.flatten.map{ |v| v[:n] }.sum
    end

    def score
      unmarked * last_call
    end

  end

  class Part1 < Problem
    @day = 4

    attr_reader :draws, :boards

    def process(input)
      draws, *boards = *input.split("\n\n")
      @draws = draws.strip.split(",").map(&:to_i)
      @boards = boards.map{ |layout| Board.new(layout) }
    end

    def run
      calls = draws.each
      until winner = boards.find{ |b| b.winner? } do
        call = calls.next
        boards.each{ |b| b.mark(call) }
      end
      winner.score
    end
  end
end
