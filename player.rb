class Player
  attr_accessor :color

  def inform_invalid_move
    puts "Bad move, please try again."
  end

  def initialize(color)
    @color = color
  end

  def get_move
    move = [[],[]]
    puts "It's your turn, #{@color}."
    puts "Enter the location of the piece you want to move: ie. 6-0 "
    start_move = gets.chomp.split('-')
    move[0][0] = start_move[0].to_i
    move[0][1] = start_move[1].to_i
    puts "Enter the location of where you want to move to: ie. 5-0"
    end_move = gets.chomp.split('-')
    move[1][0] = end_move[0].to_i
    move[1][1] = end_move[1].to_i
    move
  end


end

class HumanPlayer < Player
end

class ComputerPlayer < Player
end

