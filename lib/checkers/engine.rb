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
    # puts position.to_a[0]
    # puts position.to_a[1]
    # exit
    @board.to_array[position.to_a[0].to_i][position.to_a[1].to_i]
  end


  def set_up
    @board = Board.new
    self.add_piece_to_position(Man.new(Black.new), Position.from_string("a2"))
    self.add_piece_to_position(Man.new(Black.new), Position.from_string("a4"))
    self.add_piece_to_position(Man.new(Black.new), Position.from_string("a6"))
    self.add_piece_to_position(Man.new(Black.new), Position.from_string("a8"))
    self.add_piece_to_position(Man.new(Black.new), Position.from_string("b1"))
    self.add_piece_to_position(Man.new(Black.new), Position.from_string("b3"))
    self.add_piece_to_position(Man.new(Black.new), Position.from_string("b5"))
    self.add_piece_to_position(Man.new(Black.new), Position.from_string("b7"))
    self.add_piece_to_position(Man.new(Black.new), Position.from_string("c2"))
    self.add_piece_to_position(Man.new(Black.new), Position.from_string("c4"))
    self.add_piece_to_position(Man.new(Black.new), Position.from_string("c6"))
    self.add_piece_to_position(Man.new(Black.new), Position.from_string("c8"))

    self.add_piece_to_position(Man.new(White.new), Position.from_string("f2"))
    self.add_piece_to_position(Man.new(White.new), Position.from_string("f4"))
    self.add_piece_to_position(Man.new(White.new), Position.from_string("f6"))
    self.add_piece_to_position(Man.new(White.new), Position.from_string("f8"))
    self.add_piece_to_position(Man.new(White.new), Position.from_string("g1"))
    self.add_piece_to_position(Man.new(White.new), Position.from_string("g3"))
    self.add_piece_to_position(Man.new(White.new), Position.from_string("g5"))
    self.add_piece_to_position(Man.new(White.new), Position.from_string("g7"))
    self.add_piece_to_position(Man.new(White.new), Position.from_string("h2"))
    self.add_piece_to_position(Man.new(White.new), Position.from_string("h4"))
    self.add_piece_to_position(Man.new(White.new), Position.from_string("h6"))
    self.add_piece_to_position(Man.new(White.new), Position.from_string("h8"))

    @board = board
  end

  private :set_up

end