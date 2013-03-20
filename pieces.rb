class Piece

  attr_accessor :position, :color, :attacking_king, :display_name

  def initialize(position, color, display_name)
    @position = position
    @color = color
    @attacking_king = false
    @display_name = display_name
  end

  def path_to(to_row, to_col, grid)
    # example to_row, to_col 2,2
    from_row = position[0]
    from_col = position[1]
    move_path = []
    direction = []

    scalar = update_scalar(to_row,to_col)
    vectors = get_vectors(grid)

    vectors.each do |vector|
      proj = [vector[0]*scalar + from_row, vector[1]*scalar + from_col]
      if proj == [to_row,to_col]
        direction = vector
        # direction will equal to one vector (ie. [-1,0])
      end
    end
    return nil if direction.empty?
    scalar.times do |index|
      move_path << [from_row + direction[0]*(index+1),
                    from_col + direction[1]*(index+1)]
    end

    move_path
  end


end

class Pawn < Piece

  #   @VECTORS = [[1,0],[1,-1],[1,1]] #black
  #   #@VECTORS = [[-1,0],[-1,-1],[-1,1]] #white

  def path_to(to_row, to_col, grid)
    from_row = position[0]
    from_col = position[1]
    if color == 'white'
      if (from_col == to_col) && (from_row - to_row == 1)
        # move straight
        return [[to_row, to_col]] if grid[to_row][to_col].nil?
        nil
      elsif ((from_col - to_col).abs == 1) && (from_row - to_row == 1)
        # move diagonal
        return [[to_row, to_col]] if grid[to_row][to_col].color == 'black'
        nil
      else
        nil #not even a pawn move, bro!
      end

    else
      # color is black
      if (from_col == to_col) && (from_row - to_row == -1)
        # move straight
        return [[to_row, to_col]] if grid[to_row][to_col].nil?
      elsif ((from_col - to_col).abs == 1) && (from_row - to_row == -1)
        # move diagonal
        return [[to_row, to_col]] if grid[to_row][to_col].color == 'white'
        nil
      else
        nil # not even a pawn move, bro!
      end
    end

  end


end

class Rook < Piece

  def update_scalar(to_row, to_col)
    from_row = position[0]
    from_col = position[1]
    scalar = [(to_row - from_row).abs, (to_col - from_col).abs].max
  end

  def get_vectors(board)
    [[-1,0],[1,0],[0,1],[0,-1]]
  end

end


class Knight < Piece

  def update_scalar(to_row, to_col)
    1
  end

  def get_vectors(board)
    [[-2, -1],[-2,  1],[-1, -2],[-1,  2],[ 1, -2],[ 1,  2],[ 2, -1],[ 2,  1]]
  end
end

class Bishop < Piece

  def update_scalar(to_row, to_col)
    from_row = position[0]
    from_col = position[1]
    scalar = (to_row - from_row).abs
  end

  def get_vectors(board)
    [[1, 1],[-1,  1],[ 1, -1],[ -1,  -1]]
  end
end

class Queen < Piece

  def update_scalar(to_row, to_col)
    from_row = position[0]
    from_col = position[1]
    scalar = [(to_row - from_row).abs, (to_col - from_col).abs].max
  end

  def get_vectors(board)
    [[1,1],[-1,1],[1,-1],[-1,-1],[-1,0],[1,0],[0,1],[0,-1]]
  end
end

class King < Piece

  def update_scalar(to_row, to_col)
    1
  end

  def get_vectors(board)
    [[1,1],[-1,1],[1,-1],[-1,-1],[-1,0],[1,0],[0,1],[0,-1]]
  end
end
