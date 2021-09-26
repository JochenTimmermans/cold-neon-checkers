class Position
  attr_accessor :pos_x, :pos_y

  def initialize(x, y)
    @pos_x = x
    @pos_y = y
  end

  def to_s
    letter = ('a'..'h').to_a[@pos_x]
    number = @pos_y + 1

    letter.to_s + number.to_s
  end

  def to_a
    pos_y = @pos_y
    pos_x = @pos_x.to_s.gsub(/[a-z]/) { |m| m.ord - 97 }
    [pos_x.to_i, pos_y.to_i]
  end
end