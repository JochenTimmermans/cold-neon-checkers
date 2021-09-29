require "./lib/checkers/position"

module MoveAnalyzer
  # Checks whether the move is diagonal and only one apart
  def is_move_valid(move)
    # how to determine a valid move?
    # one for man, multiple for king
    engine = get_engine
    piece = engine.get_piece_by_position(move.pos1)
    orientation = piece.color.to_s == "b" ? -1 : 1

    if piece.is_man
      piece_left = engine.get_piece_left_front_of_position(move.pos1, piece.color.to_s == "b")
      unless piece_left.nil?
        if piece_left.color.to_s == piece.color.to_s
          return false
        end
      end

      piece_right = engine.get_piece_right_front_of_position(move.pos1, piece.color.to_s == "b")
      unless piece_right.nil?
        if piece_right.color.to_s == piece.color.to_s
          return false
        end
      end

      targets = []

      if (move.pos1.pos_x + 1) < 7
        targets.push(Position.new((move.pos1.pos_x + 1), (move.pos1.pos_y - orientation)))
      end

      if (move.pos1.pos_x - 1) >= 0
        targets.push(Position.new((move.pos1.pos_x - 1), (move.pos1.pos_y - orientation)))
      end

      targets.each do |target|
        if target.to_s == move.pos2.to_s
          return true
        end
      end
    end

    false
  end

  def get_pieces_for_color(color)
    engine = get_engine
    pieces = {}
    engine.board.board.each do |key, piece|
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

  def get_all_moves_for_color(color)
    4
  end

  def can_move(position)
    get_moves_by_position(position).size > 0
  end

  def get_moves_by_position(position)
    piece = engine.get_piece_by_position(position)

    if piece.nil?
      return []
    end

    is_white = piece.is_color(White.new)
    target_y = position.pos_y + (is_white ? -1 : +1)
    target_moves = []

    if position.pos_x > 0
      target_moves.push(
        Move.new(
          position,
          Position.new(
            (position.pos_x - 1),
            target_y
          )
        )
      )
    end

    if position.pos_x < 7
      target_moves.push(
        Move.new(
          position, Position.new(
            (position.pos_x + 1),
            target_y
          )
        )
      )
    end

    target_moves
  end

  def validate_color(move)
    piece = get_piece_by_position(move.pos1)
    if piece.color.to_s != get_turn_color.to_s
      raise WrongColorError
    end

    true
  end

  def create_move(position1, position2)
    Move.new(position1, position2)
  end

  def validate_move(move)
    piece = get_piece_by_position(move.pos1)
    if piece.nil?
      raise PieceNotFoundError
    end

    target_piece = get_piece_by_position(move.pos2)
    unless target_piece.nil?
      if piece.color.to_s == target_piece.color.to_s
        raise PositionOccupiedError
      end
    end

    unless is_move_valid(move)
      raise InvalidMoveError
    end
  end

end