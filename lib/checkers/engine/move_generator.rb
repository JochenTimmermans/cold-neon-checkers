##
# MoveGenerator
#
# Generates all possible moves
##
class MoveGenerator
  def initialize(engine)
    @engine = engine
  end

  def get_pieces_for_color(color)
    pieces = {}
    @engine.board.board.each do |key, piece|
      if piece.nil?
        next
      end

      unless piece.is_color(color)
        next
      end

      pieces[key] = piece
    end

    pieces
  end

  def get_active_pieces_for_color(color)
    pieces = self.get_pieces_for_color(color)
    active = {}
    pieces.each do |key, piece|
      moves = self.get_moves_for_position(Position.create_from_string(key));
      if !moves.nil? && moves.size > 0
        active[key] = piece
      end
    end
  end

  def get_all_moves_for_color(color)
    4
  end

  def get_moves_for_position(position)
    # if man, for now...
    piece = @engine.get_piece_by_position(position)
    orientation = piece.color.to_s == "b" ? -1 : 1

    if position.pos_x + 1 < 7

    end
  end
end