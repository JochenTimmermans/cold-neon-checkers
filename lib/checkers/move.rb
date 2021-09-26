class Move
  attr_accessor :pos1, :pos2

  def initialize(pos1, pos2)
    @pos1 = pos1
    @pos2 = pos2
  end

  def to_s
    @pos1.to_s + " " + @pos2.to_s
  end
end