load 'board.rb'
load 'pieces.rb'
require 'debugger'

myboard = Board.new
mypawn = myboard.board[1][0]
pawn_diagonal_but_empty?(mypawn, 'red', [[2,1]], myboard)

def pawn_diagonal_but_empty?(from_piece, move, board)
  debugger
  to_pos = move[-1]
  fr_pos = from_piece.position
  to_r = to_pos[0]
  to_c = to_pos[1]
#  diagonal?(fr_pos, to_pos) && from_piece.is_a?(Pawn) && @board[to_r][to_c].nil?
  diagonal?(fr_pos, to_pos) && from_piece.is_a?(Pawn) && board[to_r][to_c].nil?
  # returns true if pawn is making a diagonal move but it's empty
end

def diagonal?(from_position, to_position)
  # recieve [2,3],[3,4]
  not [[1,0],[-1,0]].include?([to_position[0]-from_position[0],                                                to_position[1]-from_position[1]])
end


