# Builder
class Robot
  attr_accessor :head, :body
end

class Head
  attr_reader :description, :speed
  def initialize(description, speed)
    @description = description
    @speed = speed
  end
end

class Body
  attr_reader :strength
  def initialize(strength)
    @strength = strength
  end
end

class RobotBuilder
  attr_reader :robot
  def initialize
    @robot = Robot.new
    @robot.head = Head.new('すごく固いぞ!', 100)
    @robot.body = Body.new(100)
  end

  def head=(head)
    @robot.head = head
  end

  def body_strength=(strength)
    @robot.body = Body.new(strength)
  end
end

r = RobotBuilder.new
r.body_strength = 1000
p r.robot
