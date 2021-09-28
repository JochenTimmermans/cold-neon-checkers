require "./lib/checkers/engine/move_generator"
require "./lib/checkers/engine"

describe MoveGenerator do
  engine = Engine.new
  describe ".get_all_moves_for_color" do
    it "should give back all pieces that can move for a color" do
      move_generator = MoveGenerator.new(engine)
      expect(move_generator.get_all_moves_for_color(Black.new)).to be 4
    end
  end

end

