require 'pry'

def initialize_board
  board = {}
  (1..9).each{|position| board[position] = ' '}
  board
end

def draw_board(board)
  system 'clear'
  puts " #{board[1]} | #{board[2]} | #{board[3]} "
  puts "---+---+---"
  puts " #{board[4]} | #{board[5]} | #{board[6]} "
  puts "---+---+---"
  puts " #{board[7]} | #{board[8]} | #{board[9]} "
end

def empty_positions(board)
  board.keys.select { |position| board[position] == ' ' }
end

def player_picks_square(board)
  puts "Pick a square (1 - 9):"
  position = gets.chomp.to_i
  valid_input = 0
  while valid_input == 0
    if position < 1 || position > 9
      puts "Number is out of bounds. Pick a square (1 - 9):"
      position = gets.chomp.to_i
    elsif board[position] == "X" || board[position] == "O"
      puts "Square taken. Pick a new square (1 - 9):"
      position = gets.chomp.to_i
    else
      valid_input = 1
    end
  end
  board[position] = "X"
end

def comp_picks_square(board)
  position = two_in_a_row(board)
  if position == nil
    position = empty_positions(board).sample
  end
  board[position] = "O"
end

def two_in_a_row(board)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  position = nil
  winning_lines.each do |line|
    if board.values_at(*line).count('O') == 2 || board.values_at(*line).count('X') == 2
      line.each do |boardIndex|
        if board[boardIndex] == ' '
          position = boardIndex
        end
      end
      #binding.pry
    end
  end
  return position
end

def check_winner(board)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  winning_lines.each do |line|
    return "Player" if board.values_at(*line).count('X') == 3
    return "Computer" if board.values_at(*line).count('O') == 3
  end
  nil
end

def nine_positions_are_filled?(board)
  empty_positions(board) == []
end

board = initialize_board

draw_board(board)

begin
  player_picks_square(board)
  draw_board(board)
  winner = check_winner(board)
  comp_picks_square(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || nine_positions_are_filled?(board)

if winner
  puts "#{winner} won!"
else
  puts "It's a tie!"
end