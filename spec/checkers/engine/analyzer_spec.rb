require "./lib/checkers/engine"
require "./lib/checkers/engine/analyzer"
require "./lib/checkers/piece/color/white"

describe Analyzer do
  describe ".get_pieces" do
    context "Given the analyzer and a fresh board" do
      it "should return 32 pieces on the board" do
        engine = Engine.new
        analyzer = Analyzer.new(engine)

        expect(analyzer.get_pieces.size).to be 24
      end
    end
  end

  describe ".get_pieces_by_color" do
    context "Given the analyzer and a fresh board" do
      it "should return 16 pieces of one color on the board" do
        engine = Engine.new
        board = engine.board
        analyzer = Analyzer.new(engine)
        analyzer.engine.board = board

        expect(analyzer.get_pieces_by_color(White.new).size).to be 12
        expect(analyzer.get_pieces_by_color(Black.new).size).to be 12
      end
    end
  end

  # describe ".get_active_pieces_by_color" do
  #   context "Given the analyzer and a fresh board" do
  #     it "should return 4 active pieces of one color on the board" do
  #       engine = Engine.new
  #       board = engine.board
  #       analyzer = Analyzer.new
  #       analyzer.board = board
  #
  #       expect(analyzer.get_active_pieces_by_color(White.new).size).to be 12
  #       expect(analyzer.get_active_pieces_by_color(Black.new).size).to be 12
  #     end
  #   end
  # end

end