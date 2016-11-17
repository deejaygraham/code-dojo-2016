
class RoverInstructions

  attr_reader :initial_position
  attr_reader :directions

  def initialize(position, directions)
    @initial_position = position
    @directions = directions
  end

end
