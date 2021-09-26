class Analyzer
  attr_accessor :engine

  def initialize(engine)
    @engine = engine
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

  def can_move(position)
    self.get_possible_moves_by_position(position).size > 0
  end

  def get_possible_moves_by_position(position)
    moves = self.get_moves_by_position(position)
  end

  def get_moves_by_position(position)
    piece = engine.get_piece_by_position(position)

    if piece.nil?
      return []
    end

    is_white = piece.is_color(White.new)
    target_y = position.pos_y + (is_white ? - 1 : + 1)
    target_moves = []

    if position.pos_x > 0
      target_moves.push(
        Move.new(
          position,
          engine.create_position_from_array_keys(
            (position.pos_x - 1),
            target_y
          )
        )
      )
    end

    if position.pos_x < 7
      target_moves.push(
        Move.new(
          position, engine.create_position_from_array_keys(
            (position.pos_x + 1),
            target_y
          )
        )
      )
    end

    target_moves
  end
end