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
    if self.empty_cell?(position)
      @grid.each do |row|
        (0...row.length).each do |cell|
          if row[cell] == position
            row[cell] = player.marker
          end
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

  def tie? 
    if !win?(player) && !self.empty?
      return true 
    else 
      return false
    end
  end

  def empty_grid?
    flat_grid = @grid.flatten
    flat_grid.each do |cell|
      if cell.class != Integer
        return false
      end
    end
    return true
  end

  def empty_cell?(value)
    @grid.each do |row|
      row.each do |cell|
        if cell == value 
          return true 
        end
      end
    end
    return false
  end

  def position(value)
    flat_grid = @grid.flatten 
    return flat_grid.index(value)
  end
end
# this is a test
player = Player.new
board = Board.new
while !board.win?(player)
  p board.grid
  move = player.get_move
  if board.empty_cell?(move)
    board.mark_movement(move, player)
  else 
    puts "CELL ALREADY CHOSEN"
    next
  end
  p board.grid
  board.grid.each do |row|
    puts "- - - - -"
    puts row.join(' | ')
  end
  puts "- - - - -"
  p board.empty_grid?
end



