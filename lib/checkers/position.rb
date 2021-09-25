class Position
  attr_accessor :pos_x, :pos_y

  def initialize(x, y)
    @pos_x = x
    @pos_y = y
  end

  def self.from_string(string)
    one, two = string.split('')
    pos_y = nil
    ('a'..'h').to_a.each_with_index do |value, key|
      if value == one
        pos_y = key
      end
    end
    pos_x = two.to_i - 1

    Position.new(pos_y, pos_x)
  end

  def to_s
    letter = ('a'..'h').to_a[@pos_x]
    number = @pos_y + 1

    letter.to_s + number.to_s
  end

  def to_a
    pos_y = @pos_y
    pos_x = @pos_x.to_s.gsub(/[a-z]/) { |m| m.ord - 97 }
    [pos_x.to_i, pos_y.to_i]
  end
end