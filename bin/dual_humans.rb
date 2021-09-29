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
player_white = Human.new(White.new, engine)
player_black = Human.new(Black.new, engine)

puts engine.board.to_s

loop do
  puts "Move " + (engine.moves.size + 1).to_s

  if engine.get_turn_color.to_s == "w"
    puts "White's turn"
    player_white.move
  else
    puts "black's turn"
    player_black.move
  end

  puts engine.board.to_s
end
