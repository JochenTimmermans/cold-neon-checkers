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
    context "given a piece of a certain color" do
      it "should be able to tell which color it is" do
        engine = Engine.new
        man = Man.new(White.new)

        expect(man.is_color(White.new)).to be true

        king = King.new(White.new)
        position = Position.from_string("a2")
        engine.add_piece_to_position(king, position)

        expect(engine.board.to_array[0][1]).to be king
      end
    end
  end
end