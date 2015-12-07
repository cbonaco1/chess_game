class Piece
  attr_accessor :position

  def initialize(position)
    @position = position
  end

  #Returns an array of possible locations it can go to
  def moves

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

end

class Bishop < SlidingPiece
  def move_dirs
  end
end

class Rook < SlidingPiece
  def move_dirs
  end
end

class Queen < SlidingPiece
  def move_dirs
  end
end


#############################
#      STEPPING PIECES      #
#############################

class SteppingPiece < Piece
end

class Knight < SteppingPiece
end

class King < SteppingPiece
end








class NullPiece
  def present?
    false
  end

  def to_s
    "   "
  end
end
