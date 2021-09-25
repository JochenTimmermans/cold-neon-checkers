require "./lib/checkers/piece/color/black"

describe Black do
  describe ".to_s" do
    context "given a black color" do
      it "prints out as b" do
        expect(Black.new.to_s).to eq("b")
      end
    end
  end
end