class Position

  attr_reader :x
  attr_reader :y
  attr_reader :heading

  def initialize(x, y, direction)
    @x = x
    @y = y
    @heading = direction
  end

  # Move this somewhere else?
  def to_s
    "#{@x} #{@y} #{@heading}"
  end
end
