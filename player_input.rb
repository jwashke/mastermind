require_relative 'code_evaluator'
class PlayerInput
  def initialize
    @code_evaluator = CodeEvaluator.new
  end

  def player_turn
    @code_evaluator.check_code(get_guess)
  end

  def get_guess
    guess_valid = false
    until guess_valid
      puts "\nWhat's your guess?"
      guess = gets.downcase.chomp
      guess_valid = check_guess(guess)
    end
    guess.split(//)
  end

  def check_guess(guess)
    if guess == 'cheat' or guess == 'c'
      puts "The secret code is #{@code_evaluator.cheat}"
    elsif guess == 'quit' or guess == 'q'
      exit
    elsif guess.length > 4
      puts "That guess is too long."
    elsif guess.length < 4
      puts "That guess is too short."
    elsif guess == 'quit' or guess == 'q'
      exit
    elsif guess =~ /[bgry][bgry][bgry][bgry]/
      guess_valid = true
    else
      puts "Please use only enter only 'b', 'g', 'r', or 'y'"
    end
  end

  def get_input
    input_valid = false
    until input_valid
      input = gets.downcase.chomp
      if input == 'play' or input == 'p'
        input_valid = true
      elsif input == 'instructions' or input == 'i'
        print_instructions
      elsif input == 'quit' or input == 'q'
        exit
      else
        puts 'Please enter a valid command'
      end
    end
  end

  def print_instructions
    puts "Instructions:"
    puts "The computer will generate a code of 4 colors consisting of any combination of (r)ed, (b)lue, (g)reen, or (y)ellow."
    puts "Try to guess the code by typing in a 4 letter combination of any of the above letters."
    puts "After each guess the computer will tell you how many colors you got correct, and how many are in the correct position."
    puts "You may use (c)heat at any time to reveal the secret code, or (q)uit to end the game."
    puts "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end
end
