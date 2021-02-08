require_relative 'player'

class Board
  attr_reader :grid

  def initialize
    @grid = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
  end

  def mark_movement(position, player)
    @grid.each do |row|
      (0...row.length).each do |cell|
        if row[cell] == position
          row[cell] = player.marker
        end
      end
    end
  end

  def win?(player)
    @grid.each do |row|
      if row.all?(player.marker)
        return true
      end
    end
    flat_grid = @grid.flatten
    count = 0
    while count < 3
      if flat_grid[count] == player.marker && flat_grid[count+3] == player.marker && flat_grid[count+6] == player.marker
        return true 
      elsif flat_grid[0] == player.marker && flat_grid[4] == player.marker && flat_grid[8] == player.marker 
        return true
      elsif flat_grid[2] == player.marker && flat_grid[4] == player.marker && flat_grid[6] == player.marker
        return true
      end
      count += 1
    end
    return false
  end
end

player = Player.new
board = Board.new
while !board.win?(player)
  p board.grid
  puts "choose"
  move = gets.chomp.to_i
  p board.mark_movement(move, player)
  p board.grid
  board.grid.each do |row|
    puts "- - - - -"
    puts row.join(' | ')
  end
  puts "- - - - -"
end

