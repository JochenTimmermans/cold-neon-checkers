class Move
  attr_accessor :pos1, :pos2

  def initialize(pos1, pos2)
    @pos1 = pos1
    @pos2 = pos2
  end

  def to_s
    @pos1.to_s + " " + @pos2.to_s
  end

  def is_priority
    puts "pos1x:" + @pos1.pos_x.to_s + ", pos1y: " + @pos1.pos_y.to_s
    if (@pos1.pos_x - @pos2.pos_x).abs > 1
      return true
    end

    false
  end


  def self.from_string(position_string)
    pos1_str, pos2_str = position_string.split(" ")
    pos1 = Position.from_string(pos1_str)
    pos2 = Position.from_string(pos2_str)

    Move.new(pos1, pos2)
  end
end
