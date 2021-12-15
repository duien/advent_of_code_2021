require_relative "problem"
module Day13
  class Part1 < Problem
    @day = 13

    def process(input)
      super
    end

    attr_accessor :x_max, :y_max, :fold, :paper
    def setup
      points, folds = input.slice_after(&:empty?).map(&:to_a)
      points.pop # remove the blank
      points.map!{ |p| p.split(",").map(&:to_i) }

      @x_max = points.map(&:first).max
      @y_max = points.map(&:last).max

      @paper = Array.new(x_max + 1) do
        Array.new(y_max + 1, 0)
      end

      points.each do |x,y|
        @paper[x][y] = 1
      end

      /fold along (?<dir>[x,y])=(?<n>\d+)/ =~ folds.first
      @fold = {dir: dir, n: n.to_i}
    end

    def count_points
      @paper.flatten.filter{ |x| x == 1 }.count
    end

    def do_fold(fold)
      fold => {dir: dir, n: n }
      case dir
      when "x" # fold along vertical line
      when "y" # fold along horizontal line
        fold_factor = 2 * n - 1
        (0..x_max).each do |x|
          (n..y_max).each do |y|
            folded_y = (fold_factor-y).abs
            @paper[x][folded_y] += @paper[x][y]
            @paper[x][y] = nil
          end
        end
      end
    end

    # 0
    # 1
    # 2
    # - @3
    # 3 -> 2
    # 4 -> 1
    # 5 -> 0
    # 6

    def display
      (0..x_max).each do |x|
        (0..y_max).each do |y|
          print "#{@paper[x][y]} "
        end
        print "\n"
      end
    end
    def run
      setup
      # display
      # puts @paper.inspect
      do_fold(@fold)
      # display
      # puts @paper.inspect
      count_points
    end
  end

  class Part2 < Part1
    @day = 13
  end
end
