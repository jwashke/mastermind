require_relative 'code_generator'

class CodeEvaluator
  def initialize
    code_generator = CodeGenerator.new
    @code = code_generator.generate_code(4,4)
    @result = { :code => @code,
                :guess => '',
                :position => 0,
                :color => 0,
                :round => 0
              }
  end

  def check_code(guess)
    @result[:guess] = guess
    @result[:position] = check_position(guess)
    @result[:color] = check_colors(sort_code(guess))
    @result[:round] += 1
    @result
  end

  def check_position(guess)
    guess.each_with_index.count do |guess_element, index|
      guess_element == @code[index]
    end
  end

  def check_colors(sorted_guess)
    sorted_code = sort_code(@code)
    sorted_guess.each_with_index.inject(0) do |total, (guess_element, index)|
      if guess_element <= sorted_code[index]
        total += guess_element
      else
        total += sorted_code[index]
      end
    end
  end

  def sort_code(array)
    sorted_array = [0, 0, 0, 0]
    array.each do |element|
      case element
      when 'b'
        sorted_array[0] += 1
      when 'g'
        sorted_array[1] += 1
      when 'r'
        sorted_array[2] += 1
      when 'y'
        sorted_array[3] += 1
      end
    end
    sorted_array
  end

  def cheat
    @code.join
  end
end
