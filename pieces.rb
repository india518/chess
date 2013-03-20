class Piece

  attr_accessor :position, :color, :attacking_king, :display_name, :scalar

  def initialize(position, color, display_name)
    @position = position
    @color = color
    @attacking_king = false
    @display_name = display_name
    @scalar = 1
  end

  def path_to(to_row, to_col)
    # example to_row, to_col 2,2
    #
    from_row = position[0]
    from_col = position[1]
    move_path = []
    direction = []

    update_scalar(to_row,to_col)

    @VECTORS.each do |vector|
      proj = [vector[0]*@scalar + from_row, vector[1]*@scalar + from_col]
      if proj == [to_row,to_col]
        direction = vector
        # direction will equal to one vector (ie. [-1,0])
      end
    end

    return nil if direction.empty?

    @scalar.times do |index|
      move_path << [from_row + direction[0]*(index+1),
                    from_col + direction[1]*(index+1)]
    end

    move_path
  end


end

class Pawn < Piece
  attr_reader :VECTORS

  def initialize(position, color, display_name)
    super
    @VECTORS = [[1,0],[1,-1],[1,1]] #black
    #@VECTORS = [[-1,0],[-1,-1],[-1,1]] #white
    #implement flag to switch these based on color
  end



end

class Rook < Piece

  attr_reader :VECTORS

  def initialize(position, color, display_name)
    super
    @VECTORS = [[-1,0],[1,0],[0,1],[0,-1]]
  end

  def update_scalar(to_row, to_col)
    from_row = position[0]
    from_col = position[1]
    @scalar = [(to_row - from_row).abs, (to_col - from_col).abs].max
  end

end


class Knight < Piece

  attr_reader :VECTORS

  def initialize(position, color, display_name)
    super
    @VECTORS =
   [[-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]]
  end


  def update_scalar(to_row, to_col)
  end

end

class Bishop < Piece

  attr_reader :VECTORS

  def initialize(position, color, display_name)
    super
    @VECTORS = [[1, 1],[-1,  1],[ 1, -1],[ -1,  -1]]
  end

  def update_scalar(to_row, to_col)
    from_row = position[0]
    from_col = position[1]
    @scalar = (to_row - from_row).abs
  end

end

class Queen < Piece

  attr_reader :VECTORS

  def initialize(position, color, display_name)
    super
    @VECTORS = [[1,1],[-1,1],[1,-1],[-1,-1],[-1,0],[1,0],[0,1],[0,-1]]
  end

  def update_scalar(to_row, to_col)
    from_row = position[0]
    from_col = position[1]
    @scalar = [(to_row - from_row).abs, (to_col - from_col).abs].max
  end

end

class King < Piece

  attr_reader :VECTORS

  def initialize(position, color, display_name)
    super
    @VECTORS = [[1,1],[-1,1],[1,-1],[-1,-1],[-1,0],[1,0],[0,1],[0,-1]]
  end

  def update_scalar(to_row, to_col)
  end

end
