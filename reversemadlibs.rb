def get_words_from_file(file_name)
  if !File.exists?(file_name)
    say "#{file_name} doesn't exist!"
    return
  end

  File.open(file_name, 'r') do |f|
    f.read
  end.split
end

nouns = get_words_from_file('nouns.txt')

verbs = get_words_from_file('verbs.txt')

adjectives = get_words_from_file('adjectives.txt')

dictionary = {
  nouns: nouns,
  verbs: verbs,
  adjectives: adjectives
}

def say(msg)
  puts "=> #{msg}"
end

def exit_with(msg)
  say msg
  exit
end

def get_input(word)
  say "Input a #{word}:"
  STDIN.gets.chomp
end

exit_with("No input file!") if ARGV.empty?
exit_with("Input file doesn't exist!") if !File.exists?(ARGV[0])

contents = File.open(ARGV[0], 'r') do |f|
  f.read
end

contents.gsub!('NOUN').each do |noun|
  dictionary[:nouns].sample
end

contents.gsub!('VERB').each do
  dictionary[:verbs].sample
end

contents.gsub!('ADJECTIVE').each do
  dictionary[:adjectives].sample
end

p contents
