class Dog

  def initialize
  end

  def my_function
    p fleas
  end

end

class Chihuahua < Dog
  attr_accessor :fleas

  def initialize
    @fleas = 10
  end


end