require "./lib/checkers/engine"
require "./lib/checkers/position"

engine = Engine.new(true)
puts engine.board.to_s

position = engine.create_position_from_string("e4")
engine.add_piece_to_position(Man.new(White.new), position)

puts engine.board.to_s

moves = engine.get_moves_by_position(position)

puts moves

moves.each do |move|
  engine.add_piece_to_position(Man.new(Black.new), move.pos2)
end

puts engine.board.to_s


moves = engine.get_moves_by_position(position)

puts moves
