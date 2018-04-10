class Robot

  SIDE = [:N, :E, :S, :W]    

  def initialize(x, y, side)
    @x = x.to_i
    @y = y.to_i    
    raise "Incorrection position!" if @x < 0 || @y < 0

    @side = side.to_sym
    raise "Incorrection side!" unless SIDE.include?(@side)
  end

  def right
    i = SIDE.index(@side)
    i = (i < SIDE.length - 1) ? i + 1 : 0
    @side = SIDE[i]
    self
  end

  def left
    i = SIDE.index(@side)
    i = (i > 0) ? i - 1 : SIDE.length - 1
    @side = SIDE[i]
    self
  end

  def move
    case @side
      when :N then @y += 1
      when :E then @x += 1
      when :S then @y -= 1
      when :W then @x -= 1
    end
    self
  end

  def state
    [@x,@y,@side]
  end
end