
require './Rover'
require 'test/unit'

class TestRover < Test::Unit::TestCase

  def test_rover_has_x_y_position

    rover = Rover.new(1, 9, :N)

    assert_equal '1 9 N', rover.position.to_s

  end

  def test_rover_faces_a_direction

    rover = Rover.new(1, 9, :W)

    assert_equal :W, rover.position.heading

  end

  def test_rover_moves_positive_x_facing_east

    rover = Rover.new(1, 9, :E)
    rover.move

    assert_equal '2 9 E', rover.position.to_s

  end

  def test_rover_moves_negative_x_facing_west

    rover = Rover.new(5, 9, :W)
    rover.move

    assert_equal '4 9 W', rover.position.to_s

  end

  def test_rover_moves_positive_y_facing_north

    rover = Rover.new(1, 9, :N)
    rover.move

    assert_equal '1 10 N', rover.position.to_s

  end

  def test_rover_moves_negative_y_facing_south

    rover = Rover.new(5, 9, :S)
    rover.move

    assert_equal '5 8 S', rover.position.to_s

  end

  def test_rover_turns_ccw_left_turn

    rover = Rover.new(5, 9, :S)
    rover.turn_left

    assert_equal :E, rover.position.heading

  end

  def test_rover_turns_cw_right_turn

    rover = Rover.new(5, 9, :S)
    rover.turn_right

    assert_equal :W, rover.position.heading

  end

end
