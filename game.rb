require_relative 'player_input'
class Game
  def initalize
    @time_start
  end

  def game_start
    print_welcome
    while true
      player = PlayerInput.new
      player.get_input
      print_game_start
      @time_start = Time.now
      game_turn(player)
    end
  end

  def game_turn(player)
    game_won = false
    until game_won
      game_won = check_results(player.player_turn)
    end
  end


  def check_results(results)
    if results[:position] == 4
      print_end(results)
    else
      print_results(results)
    end
  end

  def print_end(result)
    puts "Congratulations! You guessed the sequence '#{result[:code].join}' in #{result[:round]} guesses over #{(time_taken / 60).to_i} minutes and #{(time_taken % 60).to_i} seconds."
    puts "Do you want to (p)lay again or (q)uit"
    true
  end

  def print_results(result)
    puts "'#{result[:guess].join}' has #{result[:color]} of the correct elements with #{result[:position]} in the correct positions "
    puts "You've taken #{result[:round]} guess"
    false
  end

  def print_welcome
    puts "Welcome to MASTERMIND"
    puts "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def print_game_start
    print_divider
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,"
    puts "(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
    print_divider
  end

  def print_divider
    puts "==========================================================================="
  end

  def time_taken
    Time.now - @time_start
  end
end
