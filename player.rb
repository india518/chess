class Player
  attr_accessor :color

  def inform_invalid_move
    puts "Bad move, please try again."
  end

  def initialize(color)
    @color = color
  end

  def get_move
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

