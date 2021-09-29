class Human < Player
  def make_move(move)
    @engine.move(move)
  end

  def move
    puts "Enter move target position"
    pos1_str = gets
    puts "Enter move target position"
    pos2_str = gets

    pos1 = Position.create_from_string(pos1_str)
    pos2 = Position.create_from_string(pos2_str)
    move = Move.new(pos1, pos2)

    begin
      self.make_move(move)
    rescue PieceNotFoundError
      puts "ERROR: No piece found at position"
    rescue PositionOccupiedError
      puts "ERROR: You already occupy the target position"
    rescue InvalidMoveError
      puts "ERROR: Invalid Move"
    rescue WrongColorError
      puts "ERROR: Wrong color selected"
    end

  end
end