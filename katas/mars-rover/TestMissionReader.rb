require './MissionReader'
require 'test/unit'

class TestMissionReader < Test::Unit::TestCase

  def test_missionreader_understands_plateau_size

    reader = MissionReader.new

    size = reader.read_plateau_size('5 7 ')

    assert_equal 5, size.width
    assert_equal 7, size.height

  end

  def test_missionreader_understands_rover_position

    reader = MissionReader.new

    position = reader.read_initial_position('1 2 S')

    assert_equal 1, position.x
    assert_equal 2, position.y
    assert_equal :S, position.heading

  end

  def test_missionreader_understands_rover_single_movement_instruction

    reader = MissionReader.new

    instructions = reader.read_movement_instructions('L')

    assert_equal 1, instructions.count

  end

  def test_missionreader_understands_rover_multiple_movement_instruction

    reader = MissionReader.new

    instructions = reader.read_movement_instructions('LRMMMLRLR')

    assert_equal 9, instructions.count
    assert_equal :Left, instructions[0]
    assert_equal :Right, instructions[1]
    assert_equal :Move, instructions[2]

  end

  def test_missionreader_understands_rover_ignores_unknown_instruction

    reader = MissionReader.new

    instructions = reader.read_movement_instructions('X')

    assert_equal :Nothing, instructions[0]

  end

  def test_missionreader_understands_plateau_width_in_full_command

    message = "5 7\n\n1 2 N\n\nLMLMLMLMM\n\n3 3 E\n\nMMRMMRMRRM"

    reader = MissionReader.new

    reader.read(message)

    assert_equal 5, reader.plateau.width

  end

  def test_missionreader_understands_plateau_height_in_full_command

    message = "5 7\n\n1 2 N\n\nLMLMLMLMM\n\n3 3 E\n\nMMRMMRMRRM"

    reader = MissionReader.new

    reader.read(message)

    assert_equal 7, reader.plateau.height

  end

end
