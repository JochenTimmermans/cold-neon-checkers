class MoveAnalyzer
  def initialize(move, engine)
    @move = move
    @engine = engine
  end

  # Checks whether the move is diagonal and only one apart
  def is_move_valid()
    # how to determine a valid move?
    # one for man, multiple for king
    piece = @engine.get_piece_by_position(@move.pos1)

    orientation = piece.color.to_s == "b" ? -1 : 1
    is_man = piece.is_man
    if piece.is_man

      piece_left = @engine.get_piece_left_front_of_position(@move.pos1)
      unless piece_left.nil?
        if piece_left.color.to_s == piece.color.to_s
          return false
        end
      end

      piece_right = @engine.get_piece_right_front_of_position(@move.pos1)
      unless piece_right.nil?
        if piece_right.color.to_s == piece.color.to_s
          return false
        end
      end
    end

    true
  end
end