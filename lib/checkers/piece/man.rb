require './lib/checkers/piece'

class Man < Piece

  def initialize(color)
    super
    @abbr = "m"
  end
end