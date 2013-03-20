require 'colorize'
load './board.rb'
load './pieces.rb'

class Game

  attr_accessor :current_player, :checkmate, :board

  def initialize
    @board = Board.new
    @white = Player.new('white')
    # REV: Symbols, rather than stirngs, are better for encoding color
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
        valid_move = board.check_move(move, current_player.color)
        # check_move returns true/false
        current_player.inform_invalid_move unless valid_move
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
    if current_player == white # REV: Pseudocode? "white"? :white?
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
  attr_accessor :color

  def inform_invalid_move
    puts "Bad move, please try again."
  end

  def initialize(color)
    @color = color
  end

    def get_move   # REV: better method name may be "specify_move"
    puts "Please enter your move, #{@color}:"
    puts "Enter move as [[start],[end]] where start = '[row, column] and end =[row,column]'"
    move = gets.chomp.split(',')
    move[0][0] = move[0][0].to_i
    move[0][1] = move[0][1].to_i
    move[1][0] = move[1][0].to_i
    move[1][1] = move[1][1].to_i
    move
  end


end

class HumanPlayer < Player
end

class ComputerPlayer < Player
end

