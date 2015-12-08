require_relative 'game.rb'



class Piece
  attr_accessor :position
  attr_reader :board

  def initialize(position, board)
    @position = position
    @board = board
  end

  #Returns an array of possible locations it can go to
  def moves
    #should return an array of places a Piece can move to
  end

  def present?
    true
  end

  def to_s
    " x "
  end

end


############################
#      SLIDING PIECES      #
############################

class SlidingPiece < Piece

  def down_moves
    current_row, current_column = self.position
    moves = []
    ((current_row + 1)..7).each do |row_num|
      if board.grid[row_num][current_column].is_a?(NullPiece)
        moves << [row_num, current_column]
      else
        break
      end
    end
    moves
  end

  def up_moves
    current_row, current_column = self.position
    moves = []
    (current_row - 1).downto(0) do |row_num|
      if board.grid[row_num][current_column].is_a?(NullPiece)
        moves << [row_num, current_column]
      else
        break
      end
    end

    moves
  end

  def left_moves
    current_row, current_column = self.position
    moves = []
    (current_column - 1).downto(0) do |col_num|
      if board.grid[current_row][col_num].is_a?(NullPiece)
        moves << [current_row, col_num]
      else
        break
      end
    end

    moves
  end

  def right_moves
    current_row, current_column = self.position
    moves = []
    ((current_column + 1)..7).each do |col_num|
      if board.grid[current_row][col_num].is_a?(NullPiece)
        moves << [current_row, col_num]
      else
        break
      end
    end

    moves
  end

  def diagonal_moves
    current_row, current_column = self.position
  end


  #should return an array of places a Piece can move to
  def moves
    #[1, 2]
    current_row, current_column = self.position
    up_down_moves = down_moves + up_moves
    diagonal_moves = []

    # (0..7).each do |value|
    #   #Up/Down
    #   up_down_moves << [value, current_column]
    #   #Left/Right
    #   up_down_moves << [current_row, value]
    # end

    #diagonal
    (0..7).each do |value|
      diagonal_moves << [current_row + value, current_column + value]
      diagonal_moves << [current_row - value, current_column - value]
      diagonal_moves << [current_row + value, current_column - value]
      diagonal_moves << [current_row - value, current_column + value]
    end


    #filters for diagonals that are on board
    diagonal_moves.select! do |array|
      array[0].between?(0,7) && array[1].between?(0,7)
    end
    total_possible_moves = (up_down_moves + diagonal_moves).uniq

    total_possible_moves.select {|move| move_dirs(move) && !in_the_way?(move) }
  end




end

class Bishop < SlidingPiece

  #filters for ONLY diagonal slides
  def move_dirs(move)

    current_row, current_col = self.position

    #NOT a diagnol move if the row or column is the same as current row/column
    return false if move.first == current_row || move.last == current_col
    true
  end

end

class Rook < SlidingPiece

  def move_dirs(move)
    #filters for only horitizon and vertical slides
    current_row, current_col = self.position

    #NOT a vertical/horizontal move if the row or column is NOT the same as current row/column
    return false unless (move.first == current_row || move.last == current_col)
    true
  end

  def in_the_way?(move)
    return false unless move.nil?

  end

end

class Queen < SlidingPiece

  #slides in ALL directions
  def move_dirs(move)
    true
  end

end


#############################
#      STEPPING PIECES      #
#############################

class SteppingPiece < Piece

end

class Knight < SteppingPiece
  #moves in "L" shape

end

class King < SteppingPiece

  #moves one step in any direction
end








class NullPiece
  def present?
    false
  end

  def to_s
    "   "
  end
end
