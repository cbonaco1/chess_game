require_relative "board.rb"
require_relative "player.rb"

class Game

  attr_accessor :board, :player

  def initialize
    @board = Board.new
    @player = Player.new(@board)
  end

  def run
    #puts "Mark all the spaces on the board!"
    #puts "WASD or arrow keys to move the cursor, enter or space to confirm."
    until board.full?
      #puts("Please select a piece.")
      start_pos = player.select_pos
      #puts("Where would you like to move?")
      end_pos = player.select_pos

      board.move(start_pos, end_pos)

      # @board.mark(pos)
    end
    #puts "Hooray, the board is filled!"
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.run
end
