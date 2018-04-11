require "robomar/version"
require "robomar/plateau"
require "robomar/robot"

module Robomar

public
  def self.run(path)
    raise "File not exist!" unless File.exist? path
    file = File.open(path, "r")
    plateau = create_plateau(file.gets)
    
    # create and run robots
    isRobot = true
    robots_states = []
    robot = nil
    file.each do |l|
      l.delete! "\n"
      next if l.empty?

      if isRobot
        p "create_robot=#{l}"
        isRobot = !isRobot
        robot = create_robot(plateau, l)
      else
        p "programming=#{l}"
        isRobot = !isRobot
        robots_states << robot.programming(l).state
      end
    end

    robots_states
  end

private

  def self.create_plateau(str)
    v = /\s*(?<x>\d+)\s*(?<y>\d+)\s*/.match(str)
    raise "Size for plateeau not set!" if [v, v[:x], v[:y]].any? &:nil?
    Plateau.new(v[:x].to_i, v[:y].to_i)
  end

  def self.create_robot(plateau, str)
    v = /\s*(?<x>\d+)\s*(?<y>\d+)\s*(?<side>[NESW])\s*/.match(str)
    raise "Size for plateeau not set!" if [v, v[:x], v[:y], v[:side]].any? &:nil?
    Robot.new(plateau, v[:x].to_i, v[:y].to_i, v[:side].to_sym)
  end
  
end
