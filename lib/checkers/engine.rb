require './lib/checkers/board'
require './lib/checkers/engine/analyzers/move_analyzer'
require './lib/checkers/exceptions/position_occupied_error'
require './lib/checkers/exceptions/wrong_color_error'
require './lib/checkers/piece/color/black'
require './lib/checkers/piece/color/white'
require './lib/checkers/piece/king'
require './lib/checkers/piece/man'

# Engine
#
# Handles moves:
# - make move based on Move
# - gives back board
# - raise errors:
#   - space oc
#
class Engine
  attr_accessor :board, :moves

  def initialize
    self.set_up
    @moves = []
  end

  def position_has_piece(position)
    piece = self.get_piece_by_position(position)
    !piece.nil?
  end

  def add_piece_to_position(piece, position)
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


  def move(move)
    self.validate_move(move)
    self.validate_color(move)
    piece = self.get_piece_by_position(move.pos1)

    self.add_piece_to_position(nil, move.pos1)
    self.add_piece_to_position(piece, move.pos2)

    @moves.push(move)
  end

  def validate_color(move)
    piece = self.get_piece_by_position(move.pos1)
    if piece.color.to_s != self.get_turn_color.to_s
      raise WrongColorError
    end

    true
  end

  def get_turn_color
    if @moves.size % 2 == 0
      return White.new
    end

    Black.new
  end

  def validate_move(move)
    piece = self.get_piece_by_position(move.pos1)
    if piece.nil?
      raise PieceNotFoundError
    end

    target_piece = self.get_piece_by_position(move.pos2)
    unless target_piece.nil?
      if piece.color.to_s == target_piece.color.to_s
        raise PositionOccupiedError
      end
    end

    move_analyzer = MoveAnalyzer.new(move, self)
    unless move_analyzer.is_move_valid
      raise InvalidMoveError
    end
  end

  def create_move(position1, position2)
    Move.new(position1, position2)
  end

  def get_piece_right_front_of_position(position, topdown = true)
    if topdown
      target_y = position.pos_y + 1
    else
      target_y = position.pos_y - 1
    end

    target_x = position.pos_x + 1

    if target_x > 7
      return nil
    end

    self.get_piece_by_position(Position.new(target_x, target_y))
  end

  def get_piece_left_front_of_position(position, topdown = true)
    if topdown
      target_y = position.pos_y + 1
    else
      target_y = position.pos_y - 1
    end
    target_x = position.pos_x - 1

    if target_x < 0
      return nil
    end

    self.get_piece_by_position(Position.new(target_x, target_y))
  end

  def set_up
    @board = Board.new
    blacks = ["b1", "d1", "f1", "h1", "a2", "c2", "e2", "g2", "b3", "d3", "f3", "h3"]
    whites = ["a6", "c6", "e6", "g6", "b7", "d7", "f7", "h7", "a8", "c8", "e8", "g8"]

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