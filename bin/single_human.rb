# frozen_string_literal: true

require './lib/checkers/engine'
require './lib/checkers/exceptions/invalid_move_error'
require './lib/checkers/exceptions/piece_not_found_error'
require './lib/checkers/move'
require './lib/checkers/piece/color/black'
require './lib/checkers/piece/color/white'
require './lib/checkers/player'
require './lib/checkers/player/human'
require './lib/checkers/position'

##
# Engine Only
#
# No players involved, all positions are entered manually
##

engine = Engine.new

i = 0
loop do

  i += 1
  puts engine.board.to_s

  puts "Enter move #{i} target position"
  pos1_str = gets
  puts "Enter move #{i} target position"
  pos2_str = gets

  pos1 = Position.create_from_string(pos1_str)
  pos2 = Position.create_from_string(pos2_str)
  move = Move.new(pos1, pos2)

  begin
    engine.move(move)
  rescue PieceNotFoundError
    puts "ERROR: No piece found at position"
  rescue PositionOccupiedError
    puts "ERROR: You already occupy the target position"
  rescue InvalidMoveError
    puts "ERROR: Invalid Move"
  end

end
