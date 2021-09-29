require "./lib/checkers/position"

module BoardHandler

  def add_piece_to_position(piece, position)
    @board.board[position.to_s] = piece
  end

  def get_pieces
    target_pieces = {}
    @engine.board.to_array.each_with_index do |line, index|
      line.each_with_index do |value, index2|
        unless value.nil?
          target_pieces[index.to_s + index2.to_s] = value
        end
      end
    end

    target_pieces
  end

  def get_pieces_by_color(color)
    target_pieces = {}
    pieces = self.get_pieces
    pieces.each do |key, piece|
      if piece.is_color(color)
        target_pieces[key] = piece
      end
    end

    target_pieces
  end

  def get_active_pieces(color)
    pieces = self.get_pieces_by_color(color)
    positions = []
    pieces.each do |pos_keys, piece|
      pos_keys_array = pos_keys.split('')
      position = Position.from_array_keys(pos_keys_array[0], pos_keys_array[1])
      if can_move(position)
        positions.push(position)
      end
    end
  end

  def get_piece_by_position(position)
    @board.to_array[position.pos_y.to_i][position.pos_x.to_i]
  end

  def get_piece_right_front_of_position(position, topdown = true)
    target_y = if topdown
      position.pos_y + 1
    else
      position.pos_y - 1
    end

    target_x = position.pos_x + 1

    if target_x > 7
      return nil
    end

    get_piece_by_position(Position.new(target_x, target_y))
  end

  def get_piece_left_front_of_position(position, topdown = true)
    target_y = if topdown
                 position.pos_y + 1
               else
                 position.pos_y - 1
               end
    target_x = position.pos_x - 1

    if target_x < 0
      return nil
    end

    get_piece_by_position(Position.new(target_x, target_y))
  end

  def get_turn_color
    if @moves.size % 2 == 0
      return White.new
    end

    Black.new
  end

end
