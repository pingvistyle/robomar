class Plateau

  attr_reader :x
  attr_reader :y
  
  def initialize(x, y)
    @x = x.to_i
    @y = y.to_i
    raise "Incorrection size!" if @x < 0 || @y < 0
  end

  def size
    [@x,@y]
  end
end