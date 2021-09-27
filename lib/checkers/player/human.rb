class Human < Player
  def make_move(move)
    @engine.move(move)
  end
end