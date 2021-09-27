require "./lib/checkers/engine"
require "./lib/checkers/piece"
require "./lib/checkers/piece/king"
require "./lib/checkers/piece/man"
require "./lib/checkers/piece/color/white"
require "./lib/checkers/position"

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

  describe ".is_man" do
    man = Man.new(White.new)
    king = King.new(White.new)

    context "given a fresh board" do
      it "a piece should know it's a man" do
        expect(man.is_man).to be true
        expect(king.is_man).to be false
      end

      it "a piece should know it's a king" do
        expect(man.is_king).to be false
        expect(king.is_king).to be true
      end
    end
  end
end