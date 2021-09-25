require "./lib/checkers/piece/color"

describe Color do
  describe ".to_s" do
    context "given a Color class" do
      it "should have the Color class" do
        color = Color.new
        expect(color.class).to eq(Color)
      end
    end

  end
end