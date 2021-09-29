require "./lib/checkers/board"
require "./lib/checkers/engine/analyzers/move_analyzer"
require "./lib/checkers/engine/analyzers/position_analyzer"
require "./lib/checkers/engine/board_handler"
require "./lib/checkers/exceptions/position_occupied_error"
require "./lib/checkers/exceptions/wrong_color_error"
require "./lib/checkers/piece/color/black"
require "./lib/checkers/piece/color/white"
require "./lib/checkers/piece/king"
require "./lib/checkers/piece/man"

# Engine
#
# Handles moves:
# - make move based on Move
# - gives back board
# - raise errors:
#   - space oc
#
class Engine
  include BoardHandler
  include PositionAnalyzer
  include MoveAnalyzer

  attr_accessor :board, :moves

  def initialize
    set_up
    @moves = []
  end

  def get_engine
    self
  end

  def move(move)
    validate_move(move)
    validate_color(move)
    piece = get_piece_by_position(move.pos1)

    add_piece_to_position(nil, move.pos1)
    add_piece_to_position(piece, move.pos2)

    @moves.push(move)
  end

  def set_up
    @board = Board.new
    blacks = %w[b1 d1 f1 h1 a2 c2 e2 g2 b3 d3 f3 h3]
    whites = %w[a6 c6 e6 g6 b7 d7 f7 h7 a8 c8 e8 g8]

    blacks.each do |position_str|
      position = create_position_from_string(position_str)
      add_piece_to_position(Man.new(Black.new), position)
    end

    whites.each do |position_str|
      position = create_position_from_string(position_str)
      add_piece_to_position(Man.new(White.new), position)
    end
  end

  private :set_up

end
