require_relative 'piece.rb'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    grid.each_with_index do |row, row_index|
      row.each_index do |col_index|
        grid[row_index][col_index] = Piece.new([row_index, col_index])
      end
    end
  end

  def move(start, end_pos)
    #update the grid
    #update the position of Piece
  end


end
