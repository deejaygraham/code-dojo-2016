# Play Rock, Paper, Scissors ... against the computer.

Choices = { 'rock' => :rock, 'paper' => :paper, 'scissors' => :scissors 
# Big Bang Theory edition , 'spock' => :spock, 'lizard' => :lizard
}

Player_Winning_Moves = [ 

    [:scissors, :paper],    # cuts 
    [:paper,    :rock],     # covers
    [:rock,     :scissors], # blunts
# Big Bang Theory edition 
#     [:scissors, :paper],    # cuts 
#     [:paper,    :rock],     # covers
#     [:rock,     :lizard],   # crushes
#     [:lizard,   :spock],    # poisons
#     [:spock,    :scissors], # smashes
#     [:scissors, :lizard],   # decapitates
#     [:lizard,   :paper],    # eats
#     [:paper,    :spock],    # disproves
#     [:spock,    :rock],     # vapourizes
#     [:rock,     :scissors], # blunts
]

# def ask_for_player_choice
    
#     begin
    
#       puts "Choose between " + Choices.keys.join(", ") + ": "
#       player_choice = gets.chomp.downcase

#       understood = Choices.keys.include?(player_choice)
      
#       puts "I don't understand #{player_choice}. Please re-enter." unless understood

#     end until understood

#     Choices[player_choice]

# end

puts "Welcome to " + Choices.keys.join(", ")

human = HumanPlayer.new
computer = computer.new

play_again = 'y'

loop do

    your_choice = human.choose(Choices)
    puts "You chose: #{your_choice}"

    my_choice = computer.choose(Choices)
    puts "I choose: #{my_choice}."

    if your_choice == my_choice
        puts "It's a tie!"
    else
        if Player_Winning_Moves.include? [your_choice, my_choice]
            puts "#{your_choice} beats #{my_choice}. You win."
        else
            puts "#{your_choice} is beaten by #{my_choice}. I win."
        end
    end

    puts "Play again? (y/n)"
    play_again = gets.chomp.downcase

end until play_again != 'y'

class HumanPlayer

    def choose(available_options) 
         
         begin
            puts "Choose between " + available_options.keys.join(", ") + ": "
            player_choice = gets.chomp.downcase

            understood = available_options.keys.include?(player_choice)
      
            puts "I don't understand #{player_choice}. Please re-enter." unless understood
        end until understood

    available_options[player_choice]
    end

end

class ComputerPlayer

    def choose(available_options) 
        available_options.values.sample
    end

end

class Game

end
