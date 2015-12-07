require_relative 'piece.rb'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    populate_board

  end

  # def [](*position)
  #   grid[position[0]][position[1]]
  # end

  def populate_board
    [0,1,6,7].each do |row_index|
      grid[row_index].each_index do |col_index|
        grid[row_index][col_index] = Piece.new([row_index, col_index])
      end
    end
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    grid[row][col] = mark
  end
  #start => [2,4]
  #end_pos => [3,5]
  def move(start, end_pos)
    #update the grid
    #assume move is valid for now
    if is_valid_move?(start, end_pos)
      piece = self[start]
      self[end_pos] = piece
      self[start] = nil

      #update the position of Piece
      piece.position = end_pos
    end

  end

  def is_valid_move?(start, end_pos)
    raise StandardError if self[start].nil?
    #Implement logic to determine if move is valid for the Piece
    true
  end


end
