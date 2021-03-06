class Piece
  attr_accessor :color
  @abbr = ""

  def initialize(color)
    @color = color
  end

  def to_s
    "#{@color.to_s}#{@abbr}"
  end

  def is_color(color)
    @color.to_s === color.to_s
  end

  def is_man
    is_a?(Man)
  end

  def is_king
    is_a?(King)
  end
end