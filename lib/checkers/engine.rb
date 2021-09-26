require './lib/checkers/board'
require './lib/checkers/exceptions/position_occupied_error'
require './lib/checkers/piece/color/black'
require './lib/checkers/piece/color/white'
require './lib/checkers/piece/king'
require './lib/checkers/piece/man'

class Engine
  attr_accessor :board

  def initialize
    self.set_up
  end

  def play(color)
    # pieces_in_play = self.get_pieces_of_color(color);

  end

  def position_has_piece(position)
    piece = self.get_piece_by_position(position)
    !piece.nil?
  end

  def add_piece_to_position(piece, position)
    if self.position_has_piece(position)
      raise PositionOccupiedError
    end

    @board.board[position.to_s] = piece
  end

  def get_piece_by_position(position)
    @board.to_array[position.pos_y.to_i][position.pos_x.to_i]
  end

  def create_position_from_string(position_string)
    one, two = position_string.split('')
    pos_y = pos_x = nil
    ('a'..'h').to_a.each_with_index do |value, key|
      if value == one
        pos_x = key
      end
    end
    pos_y = two.to_i - 1

    Position.new(pos_x, pos_y)
  end

  def create_position_from_array_keys(x, y)
    Position.new(x, y)
  end

  def create_move(position1, position2)
    Move.new(position1, position2)
  end

  def set_up
    @board = Board.new
    blacks = ["b1", "d1", "f1", "h1", "a2", "c2", "e2", "g2", "b3", "d3", "f3", "h3"]
    whites = ["b6", "d6", "f6", "h6", "a7", "c7", "e7", "g7", "b8", "d8", "f8", "h8"]

    blacks.each do |position_str|
      position = self.create_position_from_string(position_str)
      self.add_piece_to_position(Man.new(Black.new), position)
    end

    whites.each do |position_str|
      position = self.create_position_from_string(position_str)
      self.add_piece_to_position(Man.new(White.new), position)
    end
  end

  private :set_up

end