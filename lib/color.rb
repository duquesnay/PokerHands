class Color
  ALL_COLOR_SYMBOLS = "hsdc"
  HEART_SYMBOL = 'h'
  SPADE_SYMBOL = 's'
  CLUB_SYMBOL = 'c'
  DIAMOND_SYMBOL = 'd'
  COLOR_NAMES = {HEART_SYMBOL => 'heart', SPADE_SYMBOL => 'spade', DIAMOND_SYMBOL => 'diamond', CLUB_SYMBOL => 'club'}

  @symbol

  def initialize(color_symbol)
    raise "unknown color #{color_symbol}" if !Color.is_color_symbol color_symbol
    @symbol = color_symbol
  end

  def self.is_color_symbol(color_symbol)
    ALL_COLOR_SYMBOLS.include? color_symbol
  end

  def to_s
    @symbol
  end
end