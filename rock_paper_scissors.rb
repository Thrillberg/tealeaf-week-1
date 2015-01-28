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

  if user_choice == "rock" && comp_choice == "rock"
    say msg1
  elsif user_choice == "rock" && comp_choice == "paper"
    say msg2
  elsif user_choice == "rock" && comp_choice == "scissors"
    say msg3
  elsif user_choice == "paper" && comp_choice == "rock"
    say msg3
  elsif user_choice == "paper" && comp_choice =="paper"
    say msg1
  elsif user_choice == "paper" && comp_choice == "scissors"
    say msg2
  elsif user_choice == "scissors" && comp_choice == "rock"
    say msg2
  elsif user_choice == "scissors" && comp_choice == "paper"
    say msg3
  elsif user_choice == "scissors" && comp_choice == "scissors"
    say msg1
  else
    say "Invalid choice, eh? What are you trying to do here, \
avoid war? Back to the front!"
  end
  say "Play again? (Y/N)"
  play_again = gets.chomp.downcase
  if play_again == "n"
    break
  end
end


