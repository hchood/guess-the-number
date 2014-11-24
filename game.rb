require 'pry'

# Set secret number
MAX_NUM = 1000
SECRET_NUM = rand(MAX_NUM + 1)
MAX_GUESSES = 3
guesses = []
puts "Secret number is: #{SECRET_NUM}\n\n"

# Get initial guess
print "Guess a number between 1 and #{MAX_NUM}: "
guess = gets.chomp.to_i

# re-prompt for guess until guess is within the right range
until guess >= 1 && guess <= MAX_NUM
  puts "That's not a valid input."
  print "Guess a number between 1 and #{MAX_NUM}: "
  guess = gets.chomp.to_i
end

# re-prompt for guess until provide a guess that hasn't already been guessed
while guesses.include?(guess)
  puts "You've already guessed that number!"
  print "Guess a number between 1 and #{MAX_NUM}: "
  guess = gets.chomp.to_i
end

# until out of guesses, check whether it's right or wrong
while guesses.length < MAX_GUESSES - 1
  if guess == SECRET_NUM
    puts "Congratulations! You win!"
    exit
  else
    guesses << guess
    puts "Wrong! You have #{MAX_GUESSES - guesses.length} more guesses."
    print "Guess a number between 1 and #{MAX_NUM}: "
    guess = gets.chomp.to_i
  end
end

puts "You're out of guesses! Goodbye."


    # re-prompt for guess until guess is within the right range
    # until guess >= 1 && guess <= MAX_NUM
    #   puts "That's not a valid input."
    #   print "Guess a number between 1 and #{MAX_NUM}: "
    #   guess = gets.chomp.to_i
    # end

    # # re-prompt for guess until provide a guess that hasn't already been guessed
    # while guesses.include?(guess)
    #   puts "You've already guessed that number!"
    #   print "Guess a number between 1 and #{MAX_NUM}: "
    #   guess = gets.chomp.to_i
    # end
