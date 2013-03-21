require 'colorize'
load './board.rb'
load './player.rb'
load './pieces.rb'

class Chess

  attr_accessor :current_player, :checkmate, :board

  def initialize
    @board = Board.new
    @white = Player.new('white')
    @black = Player.new('black')
    @current_player = @white

  end

  def run

    until checkmate?

      board.display

      valid_move = false

      until valid_move
        move = current_player.get_move
        # move = [[x,y],[x,y]] but not necessarily valid
        valid_move = board.validate_move(move, current_player.color)
        # check_move returns true/false
        current_player.inform_invalid_move unless valid_move
      end

      board.do_move(move)
      # by now, move is completely legit
      # update board

      board.update_check(current_player) #is the enemy now in check?

      switch_player
    end

  end

  def checkmate?
    # returns true/false
  end

  def switch_player
    if current_player == @white
      @current_player = @black
    else current_player == @black
      @current_player = @white
    end
  end


  def update_checkmate

  end


end
