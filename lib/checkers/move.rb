class Move
  attr_accessor :pos1, :pos2

  def initialize(pos1, pos2)
    @pos1 = pos1
    @pos2 = pos2
  end

  def to_s
    @pos1.to_s + " " + @pos2.to_s
  end

  def self.create_from_string(position_string)
    pos1_str, pos2_str = position_string.split(' ')
    pos1 = Position.create_from_string(pos1_str)
    pos2 = Position.create_from_string(pos2_str)

    Move.new(pos1, pos2)
  end
end