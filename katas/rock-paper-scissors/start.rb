# Play Rock, Paper, Scissors ... against the computer.

Choices = { 'rock' => :rock, 'paper' => :paper, 'scissors' => :scissors }

Player_Winning_Moves = [ 

    [:scissors, :paper],    # cuts 
    [:paper,    :rock],     # covers
    [:rock,     :scissors], # blunts

]

def ask_for_player_choice
    
    begin
    
      puts "Choose between " + Choices.keys.join(", ") + ": "
      player_choice = gets.chomp.downcase

      understood = Choices.keys.include?(player_choice)
      
      puts "I don't understand #{player_choice}. Please re-enter." unless understood

    end until understood

    Choices[player_choice]

end

puts "Welcome to " + Choices.keys.join(", ")
play_again = 'y'

loop do

    your_choice = ask_for_player_choice
    puts "You chose: #{your_choice}"

    my_choice = Choices.values.sample
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
