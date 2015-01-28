require 'pry'

def say(msg)
	puts "=> #{msg}"
end

say "Play Rock, Paper, Scissors!"

loop do
  say "Choose one: R / P / S"
  comp_choices = ["rock", "paper", "scissors"]

  user_choice = gets.chomp.downcase
  comp_choice = comp_choices.sample

  if user_choice == "r"
    user_choice = "rock"
  elsif user_choice == "p"
    user_choice = "paper"
  elsif user_choice == "s"
    user_choice = "scissors"
  else
    user_choice = "an invalid option"
  end

  say "You picked #{user_choice} and the computer \
picked #{comp_choice}!"

  msg1 = "It's a standoff! Nobody wins and nobody loses except for \
the innocent civilians."
  msg2 = "The computer wins! The future of humanity is doomed."
  msg3 = "You win! There is hope for mankind after all."

# winner = find_winner(player, computer)

  if user_choice == comp_choice
    say msg1
  elsif (user_choice == "paper" && comp_choice) == "rock" ||
    (user_choice == "rock" && comp_choice == "scissors") ||
    (user_choice == "scissors" && comp_choice == "paper")
    say msg3
  else
    say msg2
  end
  say "Play again? (Y/N)"
  play_again = gets.chomp.downcase
  if play_again == "n"
    break
  end
end


