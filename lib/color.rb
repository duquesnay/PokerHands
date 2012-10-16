class Color
  ALL_COLOR_SYMBOLS = "hsdc"
  COLOR_NAMES = {"h" => 'heart', 's' => 'spike', 'd' => 'dagger', 'c' => 'c...'}

  @symbol

  def initialize(proposed_color_symbol)
    raise "unknown color #{proposed_color_symbol}" if !Color.is_color_symbol proposed_color_symbol
    @symbol = proposed_color_symbol
  end

  def self.is_color_symbol(color_symbol)
    ALL_COLOR_SYMBOLS.include? color_symbol
  end

  def print
    return COLOR_NAMES[@symbol]
  end

  def to_s
    @symbol
  end
end