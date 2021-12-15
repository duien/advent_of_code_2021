require_relative "problem"
module Day13
  class Part1 < Problem
    @day = 13

    def process(input)
      clean = super
      points, folds = clean.slice_after(&:empty?).to_a
      points.pop # remove the trailing blank
      @points = points.map{ |p| p.split(",").map(&:to_i) }
      @folds = folds.map do |f|
        /fold along (?<dir>[xy])=(?<num>\d+)/ =~ f
        [dir, num.to_i]
      end
    end

    def fold(dir, num)
      @points = case dir
      when "x"
        @points.map do |x,y|
          x = if x >= num
                diff = x - num
                num - diff
              else
                x
              end
          [x,y]
        end
      when "y"
        @points.map do |x,y|
          y = if y >= num
                diff = y - num
                num - diff
              else
                y
              end
          [x,y]
        end
      end.reject{ |x,y| x < 0 || y < 0 }
    end

    def run
      fold(*@folds[0])
      @points.uniq.count
    end
  end

  class Part2 < Part1
    @day = 13

    def run
      @folds.each do |fold|
        fold(*fold)
      end

      x_max = @points.map(&:first).max
      y_max = @points.map(&:last).max

      puts x_max, y_max
      (0..y_max).each do |y|
        (0..x_max).each do |x|
          print @points.include?([x,y]) ? "*" : " "
        end
        print "\n"
      end
    end
  end
end
