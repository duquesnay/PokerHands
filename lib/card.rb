require_relative "value"
require_relative "color"

class Card
  @value
  @color

  def self::to_card(representation)
    value = Value.new(representation[0])
    color = Color.new(representation[1])
    return Card.new(value, color)
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
    card.compare_value_to_me(@value)
  end

  def compare_value_to_me(challenging_value)
    challenging_value.compare_to_v @value
  end

  def print_value
    @value.print_as_singular
  end

  private
  def initialize(value, color)
    @value, @color = value, color
  end

end