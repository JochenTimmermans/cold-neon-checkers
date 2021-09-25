require "./lib/checkers/engine"
require "./lib/checkers/piece/color"

describe Engine do
  describe ".new" do
    context "given a new engine" do
      it "should return a new board filled with pieces" do
        engine = Engine.new
        expect(engine.board.to_array[0][0]).to be_nil
        expect(engine.board.to_array[0][1]).to be_instance_of(Man)
        expect(engine.board.to_array[1][0]).to be_instance_of(Man)
        # expect(engine.board.to_array[1][2]).to be_nil
        expect(engine.board.to_array[5][1]).to be_instance_of(Man)
        expect(engine.board.to_array[6][0]).to be_instance_of(Man)
        expect(engine.board.to_array[7][1]).to be_instance_of(Man)
      end
    end
  end

  describe ".play" do
    context "given a new engine" do
      it "should make a move for white" do
        engine = Engine.new
        before_hash = engine.board.to_plain_string
        engine.play(White.new)
        after_hash = engine.board.to_plain_string
        # expect(after_hash).not_to eq(before_hash)
      end
    end
  end

  describe ".to_plain_string" do
    context "given a new engine with a fresh board" do
      it "should return the board as a plain string" do
        engine = Engine.new
        expect(engine.board.to_plain_string).to be_instance_of(String)
        expect(engine.board.to_plain_string.size).to be 88
        expect(engine.board.to_plain_string).to eq(".bm.bm.bm.bmbm.bm.bm.bm..bm.bm.bm.bm.................wm.wm.wm.wmwm.wm.wm.wm..wm.wm.wm.wm")
      end
    end
  end

  describe ".get_piece_on_position" do
    context "given a fresh board" do
      engine = Engine.new

      it "should return the king when requested" do
        position = Position.from_string("a2")
        expect(engine.get_piece_by_position(position)).to be_instance_of Man
      end

      it "should return nil if nothing's on the square" do
        position = Position.from_string("a1")
        expect(engine.get_piece_by_position(position)).to be_nil
      end
    end
  end

  describe ".add" do
    context "given an empty board" do
      it "should add a piece to a position" do
        engine = Engine.new
        man = Man.new(White.new)
        engine.add_piece_to_position(man, Position.from_string("a1"))
        expect(engine.board.to_array[0][0]).to be man

        king = King.new(White.new)
        engine.add_piece_to_position(king, Position.from_string("a2"))
        expect(engine.board.to_array[0][1]).to be king
      end
    end
  end
end