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
  describe ".to_plain_string" do
    context "given a new engine with a fresh board" do
      it "should return the board as a plain string" do
        engine = Engine.new
        expect(engine.board.to_plain_string).to be_instance_of(String)
        expect(engine.board.to_plain_string.size).to be 88
        expect(engine.board.to_plain_string).to eq(".bm.bm.bm.bmbm.bm.bm.bm..bm.bm.bm.bm.................wm.wm.wm.wmwm.wm.wm.wm..wm.wm.wm.wm")
      end
    end
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

  def get_active_pieces_by_color(color)
    target_pieces = {}
    pieces = self.get_pieces_by_color(color)
    pieces.each do |key, piece|
      if self.can_move(key)
        target_pieces[key] = piece
      end
    end

    target_pieces
  end

  def can_move(key)
    one, two = key.split('')
    position = Position.from_array_keys(one, two)
    piece = board.get_piece_on_position
    puts piece
  end
end