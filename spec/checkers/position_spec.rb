require "./lib/checkers/engine"
require "./lib/checkers/position"

describe Position do
  describe ".to_s" do
    context "given a new piece" do
      it "should output one letter for x and one number for y" do
        position = Position.new(1, 2)
        expect(position.pos_x).to be 1
        expect(position.pos_y).to be 2
        expect(position.to_s).to eq "b3"
      end
    end
  end

  describe ".to_a" do
    context "Given a position" do
      it "should be exportable via an Array" do
        position = Position.new(1, 2)

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
        engine = Engine.new

        check_positions = {
          "a1" => [0, 0],
          "a2" => [0, 1],
          "a3" => [0, 2],
          "a4" => [0, 3],
          "a5" => [0, 4],
          "a6" => [0, 5],
          "a7" => [0, 6],
          "a8" => [0, 7],
          "b1" => [1, 0],
          "c1" => [2, 0],
          "c2" => [2, 1],
          "c3" => [2, 2],
          "d1" => [3, 0],
          "e1" => [4, 0],
          "f1" => [5, 0],
          "g1" => [6, 0],
          "h1" => [7, 0],
          "h2" => [7, 1],
          "h3" => [7, 2],
          "h4" => [7, 3],
          "h5" => [7, 4],
          "h6" => [7, 5],
          "h7" => [7, 6],
          "h8" => [7, 7],
        }

        check_positions.each do |key, value|
          x, y = value
          position = engine.create_position_from_string(key)
          expect(position.pos_x).to be x
          expect(position.pos_y).to be y
        end
      end
    end
  end

  describe ".from_array_keys" do
    context "Having initialized a position from array_keys" do
      it "should return the correct string positions" do
        engine = Engine.new

        test_positions = {
          "a1" => [0, 0],
          "a2" => [0, 1],
          "a3" => [0, 2],
          "a4" => [0, 3],
          "a5" => [0, 4],
          "a6" => [0, 5],
          "a7" => [0, 6],
          "a8" => [0, 7],
          "b1" => [1, 0],
          "c2" => [2, 1],
          "d3" => [3, 2],
          "e4" => [4, 3],
          "f5" => [5, 4],
          "g6" => [6, 5],
          "h8" => [7, 7],
        }

        test_positions.each do |key, value|
          x, y = value
          position = engine.create_position_from_array_keys(x, y)
          expect(position.to_s).to eq key
        end

      end
    end
  end
end