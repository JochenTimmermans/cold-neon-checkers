require './lib/checkers/board'
require './lib/checkers/piece/color/black'
require './lib/checkers/piece/color/white'
require './lib/checkers/piece/king'
require './lib/checkers/piece/man'

class Engine
  attr_accessor :board

  def initialize
    super
    self.set_up
  end

  def play(color)
    # pieces_in_play = self.get_pieces_of_color(color);

    # puts pieces_in_play
    # puts "Playing"
  end

  def add_piece_to_position(piece, position)
    @board.board[position.to_s] = piece
  end

  def get_piece_by_position(position)
    @board.to_array[position.to_a[0].to_i][position.to_a[1].to_i]
  end

  def set_up
    @board = Board.new
    blacks = ["a2", "a4", "a6", "a8", "b1", "b3", "b5", "b7", "c2", "c4", "c6", "c8"]
    whites = ["f2", "f4", "f6", "f8", "g1", "g3", "g5", "g7", "h2", "h4", "h6", "h8"]

    blacks.each do |position_str|
      self.add_piece_to_position(Man.new(Black.new), Position.from_string(position_str))
    end

    whites.each do |position_str|
      self.add_piece_to_position(Man.new(White.new), Position.from_string(position_str))
    end
  end

  private :set_up

end