require "./lib/checkers/engine"
require "./lib/checkers/piece/color"
require "./lib/checkers/position"

describe Engine do
  describe ".new" do
    context "given a new engine" do
      it "should return a new board filled with pieces" do
        engine = Engine.new
        # puts engine.board.to_plain_string
        # puts engine.board
        # puts engine.board.board
        # puts engine.board.to_array
        # expect(engine.board.to_array[0][0]).to be_nil
        # expect(engine.board.to_array[0][1]).to be_instance_of(Man)
        # expect(engine.board.to_array[1][0]).to be_instance_of(Man)
        # expect(engine.board.to_array[1][2]).to be_nil
        # expect(engine.board.to_array[5][1]).to be_instance_of(Man)
        # expect(engine.board.to_array[6][0]).to be_instance_of(Man)
        # expect(engine.board.to_array[7][1]).to be_instance_of(Man)
      end
    end
  end

  # describe ".play" do
  #   context "given a new engine" do
  #     it "should make a move for white" do
  #       engine = Engine.new
  #       before_hash = engine.board.to_plain_string
  #       engine.play(White.new)
  #       after_hash = engine.board.to_plain_string
  #       # expect(after_hash).not_to eq(before_hash)
  #     end
  #   end
  # end
  #
  # describe ".to_plain_string" do
  #   context "given a new engine with a fresh board" do
  #     it "should return the board as a plain string" do
  #       engine = Engine.new
  #       expect(engine.board.to_plain_string).to be_instance_of(String)
  #       expect(engine.board.to_plain_string.size).to be 88
  #       expect(engine.board.to_plain_string).to eq(".bm.bm.bm.bmbm.bm.bm.bm..bm.bm.bm.bm.................wm.wm.wm.wmwm.wm.wm.wm..wm.wm.wm.wm")
  #     end
  #   end
  # end
  #
  # describe ".get_piece_on_position" do
  #   context "given a fresh board" do
  #     engine = Engine.new
  #
  #     it "should return the king when requested" do
  #       position = engine.create_position_from_string("a2")
  #       expect(engine.get_piece_by_position(position)).to be_instance_of Man
  #     end
  #
  #     it "should return nil if nothing's on the square" do
  #       position = engine.create_position_from_string("a1")
  #       expect(engine.get_piece_by_position(position)).to be_nil
  #     end
  #   end
  # end

  describe ".add_piece_to_position" do
    context "given a fresh board" do
      engine = Engine.new
      # it "should add a piece to a position" do
        # man = Man.new(White.new)
        # position = engine.create_position_from_string("a1")
        # engine.add_piece_to_position(man, position)
        # expect(engine.get_piece_by_position(position)).to be man

        # king = King.new(White.new)
        # position = engine.create_position_from_string("a2")
        # engine.add_piece_to_position(king, position)
        # expect(engine.get_piece_by_position(position)).to be king
      # end

      it "should raise an error if a spot is already occupied" do
        king = King.new(White.new)
        position = engine.create_position_from_string("a2")
        expect {
          engine.add_piece_to_position(king, position)
        }.to raise_error { |error|
          expect(error).to be_a PositionOccupiedError
        }
        # expect(engine.get_piece_by_position(position)).to be king
      end
    end
  end

  # describe ".create_position_from_string" do
  #   context "given a string" do
  #     it "should be able to create a position" do
  #       engine = Engine.new
  #       position = engine.create_position_from_string("a1")
  #       expect(position).to be_instance_of Position
  #       expect(position.to_s).to eq "a1"
  #       expect(position.pos_x).to eq 0
  #       expect(position.pos_y).to eq 0
  #
  #       position = engine.create_position_from_string("a2")
  #       expect(position).to be_instance_of Position
  #       expect(position.to_s).to eq "a2"
  #       expect(position.pos_x).to eq 0
  #       expect(position.pos_y).to eq 1
  #
  #       position = engine.create_position_from_string("h1")
  #       expect(position).to be_instance_of Position
  #       expect(position.to_s).to eq "h1"
  #       expect(position.pos_x).to eq 7
  #       expect(position.pos_y).to eq 0
  #
  #       position = engine.create_position_from_string("h8")
  #       expect(position).to be_instance_of Position
  #       expect(position.to_s).to eq "h8"
  #       expect(position.pos_x).to eq 7
  #       expect(position.pos_y).to eq 7
  #     end
  #   end
  # end
end