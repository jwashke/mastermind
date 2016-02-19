class CodeGenerator

  def generate_code(game_size, num_colors)
    code_array = []
    game_size.times do
      code_array.push(rand(1..num_colors))
    end
    numbers_to_letters(code_array)
  end

  def numbers_to_letters(code_array)
    code_array.map do |code|
      case code
      when 1 then 'b'
      when 2 then 'g'
      when 3 then 'r'
      when 4 then 'y'
      end
    end
  end
end
