require_relative "value"
require_relative "color"
require_relative "deck_interpreter"

class Card
  @value
  @color

  def self::to_card(representation)
    DeckInterpreter.to_card representation
  end

  def print
    "#@value#@color"
  end

  def to_s
    print
  end

  def wrap_to_pair(kickers)
    Pair.new(@value, kickers)
  end

  def same_value?(challenger_card)
    (compare_strength challenger_card) == 0
  end

  def stronger_than?(challenger_card)
    (compare_strength challenger_card) > 0
  end

  def compare_strength(card)
    card.compare_value_to_me(@value)
  end

  def print_value
    @value.print_as_singular
  end

  def compare_value_to_me(challenging_value)
    challenging_value <=> @value
  end

  private
  def initialize(value, color)
    @value, @color = value, color
  end

end