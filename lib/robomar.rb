require "robomar/version"
require "robomar/plateau"
require "robomar/robot"

module Robomar

  def self.run
    p "create_plateau"
    plateau = create_plateau(STDIN.readline.delete("\n"))

    p STDIN.readline

    
    p "create and run robots"
    # create and run robots
    isRobot = true
    isMove = false
    STDIN.each_line do |l|
      p l
      l.delete("\n")
      next if l.empty?

      if isRobot
        isRobot = !isRobot
        isMove = !isMove
        robot = create_robot(plateau, l)
      end

      if isMove
        isRobot = !isRobot
        isMove = !isMove
        robot.programming(l)
        p "######################################{robot.state}###############################################"
      end
    end
  end

  def create_plateau(str)
    v = /\s*(?<x>\d+)\s*(?<y>\d+)\s*/.match(str)
    raise "Size for plateeau not set!" if [v, v[:x], v[:y]].any? &:nil?
    Plateau.new(v[:x].to_i, v[:y].to_i)
  end

  def create_robot(plateau, str)
    v = /\s*(?<x>\d+)\s*(?<y>\d+)\s*(?<side>[NESW])\s*/.match(str)
    raise "Size for plateeau not set!" if [v, v[:x], v[:y], v[:side]].any? &:nil?
    Robot.new(v[:x].to_i, v[:y].to_i, v[:side].to_sym)
  end
  
end
