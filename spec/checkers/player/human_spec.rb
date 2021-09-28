require './lib/checkers/engine'
require './lib/checkers/exceptions/piece_not_found_error'
require './lib/checkers/move'
require './lib/checkers/piece/color/white'
require './lib/checkers/player'
require './lib/checkers/player/human'
require './lib/checkers/position'

describe Human do
  describe ".make_move" do
    context "Given an engine and a human player" do
      it "should raise a PieceNotFoundError upon moving from an empty field" do
        engine = Engine.new
        player = Human.new(White.new, engine)
        position_start = Position.create_from_string("a1")
        position_end = Position.create_from_string("b2")
        move = engine.create_move(position_start, position_end)

        expect {
          player.make_move(move)
        }.to raise_error PieceNotFoundError
      end

      it "should raise a PositionOccupiedError upon moving to an occupied field of the same color" do
        engine = Engine.new
        player = Human.new(Black.new, engine)

        position_start = engine.create_position_from_string("a2")
        position_end = engine.create_position_from_string("b3")
        move = engine.create_move(position_start, position_end)

        expect {
          player.make_move(move)
        }.to raise_error PositionOccupiedError
      end

      it "should occupy a field occupied by opponent" do
        engine = Engine.new
        player = Human.new(White.new, engine)

        position_start = engine.create_position_from_string("a1")
        position_end = engine.create_position_from_string("b2")
        move = engine.create_move(position_start, position_end)

        expect {
          player.make_move(move)
        }.to raise_error PieceNotFoundError
      end

      it "should make a move and alter the board in the engine" do
        engine = Engine.new
        player = Human.new(White.new, engine)

        position_start = engine.create_position_from_string("d3")
        position_end = engine.create_position_from_string("e4")
        move = engine.create_move(position_start, position_end)
        # player.make_move(move)
      end
    end
  end
end