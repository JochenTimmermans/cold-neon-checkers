require "./lib/checkers/piece"

describe Piece do
  describe ".to_s" do
    context "given a new piece" do
      it "should output one char for type and one for color" do
        board = Board.new
        expect(board.to_array.size).to eq(8)
        expect(board.to_array[0].size).to eq(8)
      end

    end

  end

  describe ".is_color" do
    context "given a fresh board" do
      it "should be able to tell which type color the piece on a position is" do
        engine = Engine.new
        position = engine.create_position_from_string("a2")
        man = engine.get_piece_by_position(position)

        expect(man.class).to be Man
        expect(man.is_color(Black.new)).to be true

        position = engine.create_position_from_string("a1")
        empty_field = engine.get_piece_by_position(position)
        expect(empty_field).to be_nil

        position = engine.create_position_from_string("h8")
        man = engine.get_piece_by_position(position)

        expect(man.class).to be Man
        expect(man.is_color(White.new)).to be true
      end
    end
  end
end