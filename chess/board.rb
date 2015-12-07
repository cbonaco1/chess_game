require_relative 'piece.rb'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    [0,1,6,7].each do |row_index|
      grid[row_index].each_index do |col_index|
        grid[row_index][col_index] = Piece.new([row_index, col_index])
      end
    end

  end



  def move(start, end_pos)
    #update the grid


    #update the position of Piece
    #start => [2,4]
    #end_pos => [3,5]

    grid[end_pos] = grid[start]
  end


end
