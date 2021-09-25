require "./lib/checkers/piece/king"

describe King do
  describe ".to_s" do
    context "given a king of the color white" do
      it "prints out as wk" do
        expect(King.new(White.new).to_s).to eq("wk")
      end
    end

    context "given a king of the color black" do
      it "prints out as bk" do
        expect(King.new(Black.new).to_s).to eq("bk")
      end
    end
  end
end