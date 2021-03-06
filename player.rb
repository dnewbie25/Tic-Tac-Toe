class Player
  attr_reader :marker
  def initialize()
    puts 'Choose X or O'
    choice = gets.chomp.upcase
    if choice == 'X'
      @marker = :X
    elsif choice == 'O'
      @marker = :O
    else
      puts "Invalid option, try again"
      self.initialize
    end
  end

  def get_move
    puts "Choose a number in the grid"
    move = gets.chomp.to_i 
    return move
  end

  def winner?
    if win?(player)
      return true 
    else 
      return false
    end
  end
end

