require "./lib/checkers/board"
require "./lib/checkers/position"

describe Board do

  describe ".to_array" do
    context "Given a new board" do
      it "should " do

      end
    end
  end

  describe ".to_s" do
    context "given a new board" do
      it "should have the right dimensions of 8 by 8" do
        board = Board.new
        expect(board.to_array.size).to eq(8)
        expect(board.to_array[0].size).to eq(8)
      end

      it "should be all nil values" do
        board_array = Board.new.to_array
        expect(board_array[0][0]).to be nil
        expect(board_array[1][1]).to be nil
        expect(board_array[2][2]).to be nil
        expect(board_array[3][3]).to be nil
        expect(board_array[4][4]).to be nil
        expect(board_array[5][5]).to be nil
        expect(board_array[6][6]).to be nil
        expect(board_array[7][7]).to be nil
      end
    end

  end


end