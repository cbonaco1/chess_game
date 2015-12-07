class Piece
  attr_accessor :position

  def initialize(position)
    @position = position
  end

  def present?
    true
  end

  def to_s
    " x "
  end

end


class NullPiece
  def present?
    false
  end

  def to_s
    "   "
  end
end
