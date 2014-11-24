require 'pry'

##############################
#        METHODS
##############################

def get_guess
  print "Guess a number between 1 and #{MAX_NUM}: "
  gets.chomp.to_i
end

def within_range?(guess)
  guess >= 1 && guess <= MAX_NUM
end

def is_valid?(guess, guesses)
  within_range?(guess) && !guesses.include?(guess)
end

def validate_guess(guess, guesses)
  until is_valid?(guess, guesses)
    errors = []

    errors << "That's not a valid input." if !within_range?(guess)
    errors << "You've already guessed that number!" if guesses.include?(guess)

    errors.each do |error|
      puts error
    end

    guess = get_guess
  end

  guess
end

##############################
#        PROGRAM
##############################

# Set secret number
MAX_NUM = 1000
SECRET_NUM = rand(MAX_NUM + 1)
MAX_GUESSES = 3
guesses = []
puts "Secret number is: #{SECRET_NUM}\n\n"

# until out of guesses, check whether it's right or wrong
while guesses.length <= MAX_GUESSES
  guess = get_guess
  guess = validate_guess(guess, guesses)
  guesses << guess

  if guess == SECRET_NUM
    puts "Congratulations! You win!"
    exit
  else
    puts "Wrong! You have #{MAX_GUESSES - guesses.length} more guesses."
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
