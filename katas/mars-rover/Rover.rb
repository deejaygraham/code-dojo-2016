require './Position'

class Rover

  attr_reader :position

  def initialize(x, y, direction)
    @position = Position.new(x, y, direction)
  end

  def turn_left
    heading = case @position .heading
      when :N then :W
      when :W then :S
      when :S then :E
      when :E then :N
    end
    @position = Position.new(@position.x, @position.y, heading)
  end

  def turn_right
    heading = case @position .heading
      when :N then :E
      when :E then :S
      when :S then :W
      when :W then :N
    end
    @position = Position.new(@position.x, @position.y, heading)
  end

  def move
    x_offset, y_offset = case @position.heading
      when :N then [0, 1]
      when :S then [0, -1]
      when :E then [1, 0]
      when :W then [-1, 0]
    end

    @position = Position.new(@position.x + x_offset,
                              @position.y + y_offset,
                              @position.heading)
  end

end
