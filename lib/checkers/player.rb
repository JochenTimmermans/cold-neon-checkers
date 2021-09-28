class Player
  attr_accessor :color

  def initialize(color, engine)
    @color = color
    @engine = engine
  end

  def move()

  end

  def make_move(move)
    raise NoMethodError("Override this implementation")
  end
end