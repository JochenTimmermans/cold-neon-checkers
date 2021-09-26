require "colorize"

class Board
  attr_accessor :board

  def initialize
    super
    @board = self.generate_board
  end

  def to_array
    board_array = [
      [nil,nil,nil,nil,nil,nil,nil,nil,],
      [nil,nil,nil,nil,nil,nil,nil,nil,],
      [nil,nil,nil,nil,nil,nil,nil,nil,],
      [nil,nil,nil,nil,nil,nil,nil,nil,],
      [nil,nil,nil,nil,nil,nil,nil,nil,],
      [nil,nil,nil,nil,nil,nil,nil,nil,],
      [nil,nil,nil,nil,nil,nil,nil,nil,],
      [nil,nil,nil,nil,nil,nil,nil,nil,],
    ]
    ("a".."h").each_with_index do |letter, x|
      (1..8).each_with_index do |number, y|
        key = letter.to_s + number.to_s
        if @board.key?(key)
          unless @board[key].nil?
            board_array[y][x] = @board[key]
          end
        end
      end

    end

    board_array
  end

  def to_s
    output = "\n    A   B   C   D   E   F   G   H\n"
    board_array = self.to_array
    board_array.each_with_index do |line, index1|
      line.each_with_index do |value, index2|
        content = ""
        if index2 === 0
          output += " " + (index1 + 1).to_s + " "
        end

        if value.nil?
          content += "    "
        else
          if (value.color.to_s === "w")
            content += " " + (value.to_s).cyan + " "
          else
            content += " " + (value.to_s).black + " "
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