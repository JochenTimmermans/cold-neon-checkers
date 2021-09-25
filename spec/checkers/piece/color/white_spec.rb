require "./lib/checkers/piece/color/white"

describe White do
  describe ".to_s" do
    context "given a white color" do
      it "prints out as w" do
        expect(White.new.to_s).to eq("w")
      end
    end
  end
end