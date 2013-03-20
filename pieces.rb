
class Piece

  attr_accessor :position, :color, :attacking_king, :display_name

  def initialize(position, color, display_name)
    @position = position
    @color = color
    @attacking_king = false
    @display_name = display_name
  end

end

class Pawn < Piece
  attr_accessor :first_move
=begin
  def path_to
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
    # return [[0,1],[3,2],...]
  end
=end
end

class Rook < Piece

  VECTORS = [[-1,0],[1,0],[0,1],[0,-1]]

  def path_to(to_row, to_col)
    # example to_row, to_col 2,2
    #
    from_row = postion[0]
    from_col = position[1]
    move_path = []
    direction = []
    if from_row != to_row && from_col != to_col
      return false
    end

    scalar = [(to_row - from_row).abs, (to_col - from_col).abs].max
    VECTORS.each do |vector|
      proj = [vector[0]*scalar + from_row, vector[1]*scalar + from_col]
      if proj == [to_row,to_col]
        direction = vector
        # direction will equal to one vector (ie. [-1,0])
      end
    end

    scalar.times do |index|
      move_path << [from_row + direction[0]*(index+1),
                    from_col + direction[1]*(index+1)]
    end

    move_path

  end

end


=begin
  def check_last(to_row,to_col, board)
    # okay, we're one step away
    # Are we moving, blocked by own, or attacking
    if board[to_row][to_col].nil?
      return true
    elsif board[to_row][to_col].color != color
      # attacking
      return true
    else
      return false
    end
  end
=end





class Knight < Piece

  VECTORS =
   [[-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]]

  def move_path(to_row, to_col)
    # example to_row, to_col 2,2
    from_row = postion[0]
    from_col = position[1]
    move_path = []
    direction = []

    VECTORS.each do |vector|
      proj = [vector[0] + from_row, vector[1] + from_col]
      if proj == [to_row,to_col]
        direction = vector
        return [[to_row, to_col]]
      end
    end
    false
  end


end

class Bishop < Piece

  def path_to
  end

end

class Queen < Piece

  def path_to
  end

end

class King < Piece

  def path_to
  end

end
