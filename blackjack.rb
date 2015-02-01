cards = {
  "c2" => 2, "c3" => 3, "c4" => 4, "c5" => 5, "c6" => 6, "c7" => 7, "c8" => 8, "c9" => 9, "c10" => 10, "cj" => 10, "cq" => 10, "ck" => 10, "ca" => 1,
  "d2" => 2, "d3" => 3, "d4" => 4, "d5" => 5, "d6" => 6, "d7" => 7, "d8" => 8, "d9" => 9, "d10" => 10, "dj" => 10, "dq" => 10, "dk" => 10, "da" => 1,
  "h2" => 2, "h3" => 3, "h4" => 4, "h5" => 5, "h6" => 6, "h7" => 7, "h8" => 8, "h9" => 9, "h10" => 10, "hj" => 10, "hq" => 10, "hk" => 10, "ha" => 1,
  "s2" => 2, "s3" => 3, "s4" => 4, "s5" => 5, "s6" => 6, "s7" => 7, "s8" => 8, "s9" => 9, "s10" => 10, "sj" => 10, "sq" => 10, "sk" => 10, "sa" => 1
}

def draw_card(cards)
  card = cards.to_a.sample(1).flatten
  cards.delete(card[0])
  return card
end

def value_of_hand(hand)
  collection_of_card_values = hand.collect {|ind| ind[1]}
  card_values = collection_of_card_values.inject{|sum,x| sum + x }
  if collection_of_card_values.include?(1) && card_values < 12
    card_values += 10
  end
  return card_values
end

def display_hand(hand)
  card_names = {
  "c2" => "the 2 of clubs", "c3" => "the 3 of clubs", "c4" => "the 4 of clubs", "c5" => "the 5 of clubs", "c6" => "the 6 of clubs", "c7" => "the 7 of clubs", "c8" => "the 8 of clubs", "c9" => "the 9 of clubs", "c10" => "the 10 of clubs", "cj" => "the jack of clubs", "cq" => "the queen of clubs", "ck" => "the king of clubs", "ca" => "the ace of clubs",
  "d2" => "the 2 of diamonds", "d3" => "the 3 of diamonds", "d4" => "the 4 of diamonds", "d5" => "the 5 of diamonds", "d6" => "the 6 of diamonds", "d7" => "the 7 of diamonds", "d8" => "the 8 of diamonds", "d9" => "the 9 of diamonds", "d10" => "the 10 of diamonds", "dj" => "the jack of diamonds", "dq" => "the queen of diamonds", "dk" => "the king of diamonds", "da" => "the ace of diamonds",
  "h2" => "the 2 of hearts", "h3" => "the 3 of hearts", "h4" => "the 4 of hearts", "h5" => "the 5 of hearts", "h6" => "the 6 of hearts", "h7" => "the 7 of hearts", "h8" => "the 8 of hearts", "h9" => "the 9 of hearts", "h10" => "the 10 of hearts", "hj" => "the jack of hearts", "hq" => "the queen of hearts", "hk" => "the king of hearts", "ha" => "the ace of hearts",
  "s2" => "the 2 of spades", "s3" => "the 3 of spades", "s4" => "the 4 of spades", "s5" => "the 5 of spades", "s6" => "the 6 of spades", "s7" => "the 7 of spades", "s8" => "the 8 of spades", "s9" => "the 9 of spades", "s10" => "the 10 of spades", "sj" => "the jack of spades", "sq" => "the queen of spades", "sk" => "the king of spades", "sa" => "the ace of spades, aww yeah!"
}
  puts "Your hand contains the following cards:"
  hand.each do |k, v|
    puts card_names[k]
  end
end

puts 'Welcome to zero-stakes Electronic Blackjack!'
puts "Please enter your name:"
name = gets.chomp

loop do
  system 'clear'
  player_hand = []
  player_hand << draw_card(cards)
  player_hand << draw_card(cards)

  display_hand(player_hand)

  comp_hand =  []
  comp_hand << draw_card(cards)
  comp_hand << draw_card(cards)

  player_sum = value_of_hand(player_hand)
  comp_sum = value_of_hand(comp_hand)
  puts "#{name}'s total is #{player_sum}."

  choice = "h"

  until choice == "s"
    puts "Would you like to (h)it or (s)tay?"
    choice = gets.chomp
    if choice == "h"
      player_hand << cards.to_a.sample(1).flatten
      player_sum = value_of_hand(player_hand)
      display_hand(player_hand)
      puts "#{name}'s total is #{player_sum}."
      if player_sum > 21
        puts "Busted! You lose!"
        puts "#{name}'s total was #{player_sum} and the dealer's total was #{comp_sum}."
        puts "Play again? (Y/N)"
        play_again = gets.chomp.downcase
        if play_again == "n"
          break
        end
      end
    end
    if value_of_hand(comp_hand) < 17
      comp_hand << cards.to_a.sample(1).flatten
      comp_sum = value_of_hand(comp_hand)
    end
  end

  until value_of_hand(comp_hand) > 17
    comp_hand << cards.to_a.sample(1).flatten
    comp_sum = value_of_hand(comp_hand)
  end

  if player_sum > 21
    puts "Busted! You lose!"
    puts "#{name}'s total was #{player_sum} and the dealer's total was #{comp_sum}."
    puts "Play again? (Y/N)"
    play_again = gets.chomp.downcase
    if play_again == "n"
      break
    end
  elsif comp_sum >= 21 || player_sum > comp_sum
    puts "You win!"
    puts "#{name}'s total was #{player_sum} and the dealer's total was #{comp_sum}."
    puts "Play again? (Y/N)"
    play_again = gets.chomp.downcase
    if play_again == "n"
      break
    end
  elsif player_sum == comp_sum
    puts "It's a tie!"
    puts "#{name}'s total was #{player_sum} and the dealer's total was #{comp_sum}."
    puts "Play again? (Y/N)"
    play_again = gets.chomp.downcase
    if play_again == "n"
      break
    end
  elsif comp_sum > player_sum
    puts "Dealer wins!"
    puts "#{name}'s total was #{player_sum} and the dealer's total was #{comp_sum}."
    puts "Play again? (Y/N)"
    play_again = gets.chomp.downcase
    if play_again == "n"
      break
    end
  else
    puts "Uh oh--We missed a case"
  end
end