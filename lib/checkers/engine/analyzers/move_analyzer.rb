require "./lib/checkers/position"

class MoveAnalyzer
  def initialize(move, engine)
    @move = move
    @engine = engine
  end

  # Checks whether the move is diagonal and only one apart
  def is_move_valid
    # how to determine a valid move?
    # one for man, multiple for king
    piece = @engine.get_piece_by_position(@move.pos1)
    orientation = piece.color.to_s == "b" ? -1 : 1

    if piece.is_man

      piece_left = @engine.get_piece_left_front_of_position(@move.pos1, piece.color.to_s == "b")
      unless piece_left.nil?
        if piece_left.color.to_s == piece.color.to_s
          return false
        end
      end

      piece_right = @engine.get_piece_right_front_of_position(@move.pos1, piece.color.to_s == "b")
      unless piece_right.nil?
        if piece_right.color.to_s == piece.color.to_s
          return false
        end
      end

      targets = []

      if (@move.pos1.pos_x + 1) < 7
        targets.push(Position.new((@move.pos1.pos_x + 1), (@move.pos1.pos_y - orientation)))
      end

      if (@move.pos1.pos_x - 1) >= 0
        targets.push(Position.new((@move.pos1.pos_x - 1), (@move.pos1.pos_y - orientation)))
      end

      targets.each do |target|
        if target.to_s == @move.pos2.to_s
          return true
        end
      end
    end

    false
  end
end