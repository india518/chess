require 'colorize'
require 'board.rb'

class Game

  attr_accessor :current_player, :checkmate

  def initialize
    board = Board.new
    white = Player.new('white')
    black = Player.new('black')
    @current_player = white

  end

  def run

    until checkmate?

      board.display

      valid_move = false

      until valid_move
        move = @current_player.get_move
        # move = [[x,y],[x,y]] but not necessarily valid
        valid_move = board.check_move(move)
        # check_move returns true/false
        @current_player.inform_invalid_move unless valid_move
      end

      board.do_move(move)
      # by now, move is completely legit
      # update board

      switch_player
    end

  end

  def check?
    # returns true/false
  end

  def checkmate?
    # returns true/false
  end

  def switch_player
    if current_player == white
      current_player = black
    else current_player == black
      current_player = white
    end
  end

  def update_check

  end

  def update_checkmate

  end


end


class Player
  attr_accessor :white_or_black

  def inform_invalid_move
    puts "Bad move, please try again."
  end

  def initialize(color)
    @white_or_black = color
  end

  def get_move
    puts "Please enter your move, #{@white_or_black}:"
    puts "Enter move as [start],[end]: '[row, column],[row,column]'"

    valid_move = false

    while valid_move
      input = gets.chomp.split(',')
    end

  end


  def

  end

end

class HumanPlayer < Player
end

class ComputerPlayer < Player
end

