require "./lib/checkers/engine"
require "./lib/checkers/move"
require "./lib/checkers/piece/color"
require "./lib/checkers/position"
require "./lib/checkers/exceptions/invalid_move_error"
require "./lib/checkers/exceptions/piece_not_found_error"
require "./lib/checkers/exceptions/position_occupied_error"

describe Engine do
  engine = Engine.new

  describe ".new" do
    context "given a new engine" do
      it "should return a new board filled with pieces" do
        expect(engine.board.to_array[0][0]).to be_nil
        expect(engine.board.to_array[0][1]).to be_instance_of(Man)
        expect(engine.board.to_array[1][0]).to be_instance_of(Man)
        expect(engine.board.to_array[1][1]).to be_nil
        expect(engine.board.to_array[5][0]).to be_instance_of(Man)
        expect(engine.board.to_array[6][1]).to be_instance_of(Man)
        expect(engine.board.to_array[7][2]).to be_instance_of(Man)
      end
    end
  end

  describe ".to_plain_string" do
    context "given a new engine with a fresh board" do
      it "should return the board as a plain string" do
        expect(engine.board.to_plain_string).to be_instance_of(String)
        expect(engine.board.to_plain_string.size).to be 88
        expect(engine.board.to_plain_string).to eq '.bm.bm.bm.bmbm.bm.bm.bm..bm.bm.bm.bm................wm.wm.wm.wm..wm.wm.wm.wmwm.wm.wm.wm.'
      end
    end
  end

  describe ".get_piece_on_position" do
    context "given a fresh board" do

      it "should return the king when requested" do
        position = engine.create_position_from_string("a2")
        expect(engine.get_piece_by_position(position)).to be_instance_of Man
      end

      it "should return nil if nothing's on the square" do
        position = engine.create_position_from_string("a1")
        expect(engine.get_piece_by_position(position)).to be_nil
      end
    end
  end

  describe ".add_piece_to_position" do
    context "given a fresh board" do
      it "should add a piece to a position" do
        man = Man.new(White.new)
        position = engine.create_position_from_string("a1")
        engine.add_piece_to_position(man, position)

        expect(engine.get_piece_by_position(position)).to be man
      end
    end
  end

  describe ".create_position_from_string" do
    context "given a string" do
      it "should be able to create a position" do
        test_positions = {
          "a1" => [0, 0],
          "a2" => [0, 1],
          "h1" => [7, 0],
          "h8" => [7, 7],
        }

        test_positions.each do |key, value|
          x, y = value
          position = engine.create_position_from_string(key)

          expect(position).to be_instance_of Position
          expect(position.to_s).to eq key
          expect(position.pos_x).to eq x
          expect(position.pos_y).to eq y
        end
      end
    end
  end

  describe ".move" do
    context "given a move" do
      it "should throw a PieceNotFoundError if there is no piece on the original position" do
        engine = Engine.new
        move = Move.create_from_string("a1 a4")

        expect {
          engine.move(move)
        }.to raise_error PieceNotFoundError
      end

      it "should throw a PositionOccupiedError when the target field has a piece of the same color on it" do
        engine = Engine.new
        move = Move.create_from_string("c2 b3")

        expect {
          engine.move(move)
        }.to raise_error PositionOccupiedError
      end

      it "should throw an InvalidMoveError when the move is not a valid one" do
        engine = Engine.new
        move = Move.create_from_string("b1 a4")

        expect {
          engine.move(move)
        }.to raise_error InvalidMoveError
      end

      it "should not throw an InvalidMoveError when the move is a valid one" do
        engine = Engine.new
        move = Move.create_from_string("b3 a4")

        expect {
          engine.move(move)
        }.not_to raise_error
      end

      it "should perform the move on the board" do
        engine = Engine.new
        move = Move.create_from_string("b3 a4")

        pos1 = Position.create_from_string("b3")
        pos2 = Position.create_from_string("a4")

        piece_original = engine.get_piece_by_position(pos1)
        engine.move(move)

        expect(engine.board).to be_a Board
        expect(engine.get_piece_by_position(pos2)).to be_a Piece
        expect(engine.get_piece_by_position(pos2)).to be_instance_of piece_original.class
        expect(engine.get_piece_by_position(pos1)).to be_nil
      end

      it "should add the move to the moves variable" do
        move = Move.create_from_string("b3 a4")
        Engine.new.move(move)

        expect(engine.moves.size).to be 1
      end
    end
  end
end