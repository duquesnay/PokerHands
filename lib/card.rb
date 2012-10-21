require_relative "value"
require_relative "color"

class Card
  @value
  @color

  def initialize(value, color)
    @color = Color.new color
    @value = Value.new value
  end

  def self::to_card(representation)
    return Card.new representation[0], representation[1]
  end

  def print_color
    @color.print
  end

  def print
    "#@value#@color"
  end

  def to_s
    print
  end

  def to_value
    @value.clone
  end

  def as_strong_as(card)
    (compare_strength card) == 0
  end

  def stronger_than(card)
    (compare_strength card) > 0
  end

  def weaker_than (challenger_card)
    (compare_strength challenger_card) < 0
  end

  def compare_strength(card)
    -card.compare_to_value(@value)
  end

  def compare_to_value(v)
    @value.compare_to_v(v)
  end

  def print_value
    @value.print_as_singular
  end

  def print_values
    @value.print_as_plural
  end

end