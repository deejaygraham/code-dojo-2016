require './Plateau'
require './RoverInstructions'
require './Size'
require './Position'

class MissionReader

  attr_reader :plateau
  attr_reader :instructions

  def read(message)

    puts

    instructions = Array.new
    line_number = 0

    message.each_line.map(&:strip).each do | line |

      line_number += 1

      if line_number == 1
        @plateau = read_plateau_size(line)
      else

        if !line.empty?
          puts "#{line_number} " + line
        end

      end
    end

  end

  def read_plateau_size(line)
    values = line.split(' ')
    Size.new(values[0].to_i, values[1].to_i)
  end

  def read_initial_position(line)
    values = line.split(' ')

    heading = case values[2]
      when 'N' then :N
      when 'S' then :S
      when 'W' then :W
      when 'E' then :E
    end

    Position.new(values[0].to_i, values[1].to_i, heading)
  end

  def read_movement_instructions(line)

    instructions = Array.new

    line.each_char do |c|
      instructions << case c
        when 'L' then :Left
        when 'R' then :Right
        when 'M' then :Move
        else :Nothing
      end
    end

    instructions

  end

end
