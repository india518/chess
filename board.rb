class Board
  # Board contains all instance variables representing the pieces

  attr_accessor :grid, :check
  # check indicates if king is checked

  def initialize
    # top is black
    @check = false
    self.grid = Array.new(8) { Array.new(8,nil) }
    grid[0][0] = Rook.new([0,0],'black','R ')
    grid[0][7] = Rook.new([0,7],'black','R ')
    grid[0][1] = Knight.new([0,1], 'black','Kn')
    grid[0][6] = Knight.new([0,6], 'black','Kn')
    grid[0][2] = Bishop.new([0,2], 'black','B ')
    grid[0][5] = Bishop.new([0,5], 'black','B ')
    grid[0][3] = Queen.new([0,3], 'black','Q ')
    grid[0][4] = King.new([0,4], 'black','K ')

    grid[7][0] = Rook.new([7,0],'white','R ')
    grid[7][7] = Rook.new([7,7],'white','R ')
    grid[7][1] = Knight.new([7,1], 'white','Kn')
    grid[7][6] = Knight.new([7,6], 'white','Kn')
    grid[7][2] = Bishop.new([7,2], 'white','B ')
    grid[7][5] = Bishop.new([7,5], 'white','B ')
    grid[7][3] = Queen.new([7,3], 'white','Q ')
    grid[7][4] = King.new([7,4], 'white','K ')

    8.times do |index|
      grid[1][index] = Pawn.new([1,index], 'black','P ')
      grid[6][index] = Pawn.new([6,index], 'white','P ')
    end

  end

  def display
   to_show =  grid.map do |array| array.map do |piece_obj|
       if piece_obj.nil?
         '  '
       else
         piece_obj.display_name
       end
     end
   end
   to_show.each {|array| p array }
  end

  def check_move(move, player_color)
    from_row = move[0][0]
    from_col = move[0][1]
    to_row = move[1][0]
    to_col = move[1][1]

    #TO ADD: If king is being checked, move can only be to save king

    return false if grid[from_row][from_col].color != player_color

    on_board?(move)
    from_piece = grid[from_row][from_col]

    move_path = from_piece.path_to(to_row, to_col, @grid)
    return path_not_blocked?(move_path,player_color)
  end

  def on_board?(move)
    # move = [[x,y],[x,y]]
    from_row = move[0][0]
    from_col = move[0][1]
    to_row = move[1][0]
    to_col = move[1][1]

    # Checks both coordinates are on board
    return false if (0..7).include?(from_row)
    return false if (0..7).include?(from_col)
    return false if (0..7).include?(to_row)
    return false if (0..7).include?(to_col)
    true
  end

  def path_not_blocked?(move_path,player_color)
    # move_path can be false or array
    # returns true or false
    unless move_path
      return false
    end
    last_pos = move_path.pop
    move_path.each do |position|
      #position is [x,y]
      row = position[0]
      col = position[1]
      unless grid[row][col].nil?
        return false
      end
    end
    # Final check: capture or move?
    return true if last_pos.nil?
    return true if grid[last_pos[0]][last_pos[1]] != player_color
    # if we reach this, we are blocked by our own piece
    false
  end

  def do_move(move)
    from_row = move[0][0]
    from_col = move[0][1]
    to_row = move[1][0]
    to_col = move[1][1]
    piece = grid[from_row][from_col]
    grid[from_row][from_col] = nil
    grid[to_row][to_col] = piece
  end

end
