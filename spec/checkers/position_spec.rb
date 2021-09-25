require "./lib/checkers/position"

describe Position do
  describe ".to_s" do
    context "given a new piece" do
      it "should output one letter for x and one number for y" do
        position = Position.new(1,2)
        expect(position.pos_x).to be 1
        expect(position.pos_y).to be 2
        expect(position.to_s).to eq "b3"
      end
    end
  end

  describe ".to_a" do
    context "Given a position" do
      it "should be exportable via an Array" do
        position = Position.new(1,2)

        expect(position).to be_instance_of(Position)
        expect(position.to_a).to be_instance_of(Array)
        expect(position.to_a[0]).to be 1
        expect(position.to_a[1]).to be 2
      end
    end
  end

  describe ".from_string" do
    context "Having initialized a position from string" do
      it "should return the correct position" do
        position = Position.from_string("a1")
        expect(position.pos_x).to be 0
        expect(position.pos_y).to be 0

        position = Position.from_string("c3")
        expect(position.pos_x).to be 2
        expect(position.pos_y).to be 2
      end
    end
  end
end