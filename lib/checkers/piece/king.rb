require './lib/checkers/piece'

class King < Piece
  def initialize(color)
    super
    @abbr = "k"
  end
end