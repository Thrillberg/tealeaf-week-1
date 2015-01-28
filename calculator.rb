require 'pry'

def say(msg)
	puts "=> #{msg}"
end

class String
  def numeric?
    Float(self) != nil rescue false
  end
end

say "Welcome to the calculator!"
say "Type 'quit' to exit."

say "What's the first number?"
num1 = gets.chomp

if num1 == "quit"
  say "Goodbye!"
  exit
end

if num1.numeric? == false
  say "Please enter a number!"
  num1 = gets.chomp
end

say "What's the second number?"
num2 = gets.chomp

if num2 == "quit"
  say "Goodbye!"
  exit
end

if num2.numeric? == false
  say "Please enter a number!"
  num2 = gets.chomp
end

say "1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp

if operator == "quit"
  say "Goodbye!"
  exit
end

if operator.numeric? == false
  say "Please enter an operator 1 - 4!"
  operator = gets.chomp
end

if operator == '1'
  result = num1.to_i + num2.to_i
elsif operator == '2'
  result = num1.to_i - num2.to_i
elsif operator == '3'
  result = num1.to_i * num2.to_i
else
  result = num1.to_f / num2.to_f
end
puts "Result is #{result}"

say "Goodbye!"