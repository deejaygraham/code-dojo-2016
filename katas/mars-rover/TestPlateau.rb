require './Plateau'
require 'test/unit'

class TestPlateau < Test::Unit::TestCase

  def test_plateau_width_and_height

    plateau = Plateau.new(2, 4)

    assert_equal 2, plateau.size.width
    assert_equal 4, plateau.size.height

  end

  def test_plateau_identifies_position_within_bounds

    plateau = Plateau.new(2, 4)

    assert plateau.is_on?(1, 1)

  end

  def test_plateau_identifies_position_outside_bounds

    plateau = Plateau.new(2, 4)

    assert !plateau.is_on?(10, 1)

  end

end
