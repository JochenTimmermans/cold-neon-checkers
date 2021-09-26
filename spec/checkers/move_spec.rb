require "./lib/checkers/move"

describe Move do
  describe ".to_s" do
    context "given a new move" do
      it "should output the string from the first position, a space, and the string for the second" do
        engine = Engine.new
        position1 = engine.create_position_from_string("a2")
        position2 = engine.create_position_from_string("b1")
        move = engine.create_move(position1, position2)

        expect(move.to_s).to eq("a2 b1")
      end
    end
  end

end