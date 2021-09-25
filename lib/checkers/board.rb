require "colorize"

class Board
  attr_accessor :board

  def initialize
    super
    @board = self.generate_board
  end

  def to_array
    board_array = []
    last_letter = nil
    line = []
    @board.each do |place, value|
      letter, number = place.split('')
      letter_int = (letter.gsub(/[a-z]/) { |m| m.ord - 97 }).to_i
      if letter_int != last_letter
        unless last_letter.nil?
          board_array.push(line)
          line = []
        end
        last_letter = letter_int
      end
      line.push(value)
    end
    board_array.push(line)
    board_array
  end

  def to_s
    output = ""
    board_array = self.to_array
    board_array.each_with_index do |line, index1|
      line.each_with_index do |value, index2|
        if value.nil?
          content = "    "
        else
          if (value.color.to_s === "w")
            content = " " + (value.to_s).cyan + " "
          else
            content = " " + (value.to_s).black + " "
          end
        end

        if (index1 + index2) % 2 === 0
          output += content.on_light_yellow
        else
          output += content.on_green
        end

      end
      output += "\n"
    end

    output
  end

  def to_plain_string
    output = ""
    board_array = self.to_array
    board_array.each_with_index do |line, index1|
      line.each_with_index do |value, index2|
        if value.nil?
          output += "."
          next
        end

        output += value.to_s
      end
    end

    output
  end

  def generate_board
    board = {}
    letters = "abcdefgh"
    numbers = "12345678"
    letters.split('').each do |l|
      numbers.split('').each do |n|
        board[l + n] = nil
      end
    end
    @board = board
  end

  private :generate_board

end