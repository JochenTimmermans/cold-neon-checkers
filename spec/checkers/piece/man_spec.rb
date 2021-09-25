require "./lib/checkers/piece/man"

describe Man do
  describe ".to_s" do
    context "given a man of the color white" do
      it "prints out as wp" do
        expect(Man.new(White.new).to_s).to eq("wm")
      end
    end

    context "given a man of the color black" do
      it "prints out as bp" do
        expect(Man.new(Black.new).to_s).to eq("bm")
      end
    end
  end
end