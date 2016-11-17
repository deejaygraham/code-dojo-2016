require './Size'

class Plateau

  attr_reader :size

  def initialize(width, height)
    @size = Size.new(width, height)
  end

  def is_on?(x, y)
    x >= 0 and x <= @size.width and
    y >= 0 and y <= @size.height
  end

end
