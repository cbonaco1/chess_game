class Piece
  attr_accessor :position

  def initialize(position)
    @position = position
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

  #should return an array of places a Piece can move to
  def moves
    #[1, 2]
    current_row, current_column = self.position
    up_down_moves = []
    diagonal_moves = []

    (0..7).each do |value|
      #Up/Down
      up_down_moves << [value, current_column]
      #Left/Right
      up_down_moves << [current_row, value]
    end

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
    (up_down_moves + diagonal_moves).uniq
  end
end

class Bishop < SlidingPiece


  def move_dirs
    #filters for ONLY diagonal slides
  end

  def moves
    # super.select {|move| if move_dirs allows moves}
  end


end

class Rook < SlidingPiece

  def move_dirs
    #filters for horitizon and vertical slides
  end


end

class Queen < SlidingPiece

  #slides in ALL directions
  def move_dirs
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
