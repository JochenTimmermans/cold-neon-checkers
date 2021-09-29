require "./lib/checkers/engine/analyzers/move_analyzer"
require "./lib/checkers/engine"

describe MoveAnalyzer do
  engine = Engine.new
  describe ".get_all_moves_for_color" do
    it "should give back all pieces that can move for a color" do
      engine = Engine.new
      expect(engine.get_all_moves_for_color(Black.new)).to be 4
    end
  end
  # engine = Engine.new
  # analyzer = Analyzer.new(engine)
  #
  # describe ".get_pieces" do
  #   context "Given the analyzer and a fresh board" do
  #     it "should return 32 pieces on the board" do
  #       expect(analyzer.get_pieces.size).to be 24
  #     end
  #   end
  # end
  #
  # describe ".get_pieces_by_color" do
  #   context "Given the analyzer and a fresh board" do
  #     it "should return 16 pieces of one color on the board" do
  #       expect(analyzer.get_pieces_by_color(White.new).size).to be 12
  #       expect(analyzer.get_pieces_by_color(Black.new).size).to be 12
  #     end
  #   end
  # end
  #
  # describe ".get_moves_by_position" do
  #   context "Given a fresh board" do
  #     it "should return all moves for that position" do
  #       position1 = engine.create_position_from_string("a2")
  #       position2 = engine.create_position_from_string("c2")
  #       position3 = engine.create_position_from_string("h3")
  #       expect(analyzer.get_moves_by_position(position1).size).to be 1
  #       expect(analyzer.get_moves_by_position(position2).size).to be 2
  #       expect(analyzer.get_moves_by_position(position3).size).to be 1
  #     end
  #   end
  # end

  # describe ".get_possible_moves_by_position" do
  #   context "Given a fresh board" do
  #     it "should return all moves for that position" do
  #       position1 = engine.create_position_from_string("a2")
  #       position2 = engine.create_position_from_string("c2")
  #       expect(analyzer.get_possible_moves_by_position(position1).size).to be 0
  #       expect(analyzer.get_possible_moves_by_position(position2).size).to be 2
  #     end
  #   end
  # end

  # describe ".get_active_pieces" do
  #   context "Given the analyzer and a fresh board" do
  #     it "should return 16 pieces of one color on the board" do
  #       expect(analyzer.get_active_pieces(White.new).size).to be 4
  #       expect(analyzer.get_active_pieces(Black.new).size).to be 4
  #     end
  #   end
  # end
end

