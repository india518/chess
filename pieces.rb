
class Piece

  attr_accessor :position, :color, :attacking_king?

  def check_board?(location)
    #return true if empty or location = enemy
    #return false if location = us or off board
  end

end

class Pawn < Piece
  attr_accessor :first_move?

  def legal_moves
    # pawn is unique
    possible_moves = []
    if @first_move
      return [(x,y+1), (x,y+2)]
    end

    #else
    # check if we're blocked y+1 spaces
    check_board?(x,y+1) #have it true/false
    # true, add [x,y+1] to legal moves
    possible_moves << move
    #check if there's a piece diagonal
    move = check_board?(x-1,y+1) and (x+1,y+1)
    possible_moves << move
    #NOTE - make a map!!!
    returns possible_moves
  end

end

class Rook < Piece

  def legal_moves
  end

end

def Knight < Piece

  def legal_moves
  end

end

def Bishop < Piece

  def legal_moves
  end

end

def Queen < Piece

  def legal_moves
  end

end

def King < Piece

  def legal_moves
  end

end




