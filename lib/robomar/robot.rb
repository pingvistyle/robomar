class Robot

  DIRECTIONS = [:N, :E, :S, :W]
  COMMANDS = {:M => :move, :R  => :right, :L  => :left} 

  def initialize(area, x, y, direction)
    @x = x.to_i
    @y = y.to_i    
    raise "Incorrection position!" if @x < 0 || @y < 0

    @direction = direction.to_sym
    raise "Incorrection direction!" unless DIRECTIONS.include?(@direction)

    @area = area    
    raise "Robot outarea plateau!" if outarea?
  end

private
  def outarea?
    return @area.outarea?(@x, @y) if @area.is_a?(Plateau)
    true
  end

  def right
    i = DIRECTIONS.index(@direction)
    i = (i < DIRECTIONS.length - 1) ? i + 1 : 0
    @direction = DIRECTIONS[i]
  end

  def left
    i = DIRECTIONS.index(@direction)
    i = (i > 0) ? i - 1 : DIRECTIONS.length - 1
    @direction = DIRECTIONS[i]
  end

  def move
    case @direction
      when :N then @y += 1
      when :E then @x += 1
      when :S then @y -= 1
      when :W then @x -= 1
    end

    raise "Robot outarea plateau!" if outarea?
  end

public
  def state
    [@x,@y,@direction]
  end

  def programming(commands)
    raise "Exist incorrectly command!" unless commands.scan(/[^MRL]+/).empty?
    commands.each_char do |c|
      self.send COMMANDS[c.to_sym]
    end
    self
  end
end