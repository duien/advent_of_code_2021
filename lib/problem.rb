class Problem
  attr_accessor :input
  @day = 0

  def initialize(input = load_input)
    @input = process input
  end

  def process(input)
    input.strip.lines.map(&:strip)
  end

  def run
    raise "Subclass must implement"
  end

  def self.day
    @day
  end

  def day
    self.class.day
  end

  def load_input
    file = File.join(__FILE__, "../../data/day_#{day}.txt")
    file = File.expand_path(file)
    File.read(file)
  end


end
