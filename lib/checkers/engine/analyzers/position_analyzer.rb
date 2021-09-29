require "./lib/checkers/position"

module PositionAnalyzer

  def create_position_from_string(position_string)
    one, two = position_string.chars
    pos_x = nil
    ("a".."h").to_a.each_with_index do |value, key|
      if value == one
        pos_x = key
      end
    end
    pos_y = two.to_i - 1

    Position.new(pos_x, pos_y)
  end

end
