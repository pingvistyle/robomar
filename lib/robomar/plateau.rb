module Robomar
  
  class Plateau

    attr_reader :x
    attr_reader :y

    def initialize(x, y)
      @x = x.to_i
      @y = y.to_i
      raise IncorrectionSizePlateau if @x < 0 || @y < 0
    end

    def size
      [@x,@y]
    end

    def outarea?(x, y)
      x < 0 || y < 0 || x > @x || y > @y
    end
  end

end