class Board
  # Board contains all instance variables representing the pieces

  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8,nil) }
    # put pieces to initial spots
  end

  def display
     self
  end

  def do_move
    # move pieces
    # and removes if necessary
  end

end
