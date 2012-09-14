require "./value"
require "./color"

class Card
  include Comparable
  @value
  @color

  def initialize(value, color)
    @color = Color.new color
    @value = Value.new value
  end

  def tell_value(gatherer)
    gatherer.gather_value @value
  end

  def self::to_card(representation)
    return Card.new representation[0], representation[1]
  end

  def <=> other_card
     compare_strength other_card
  end

  def print_color
    @color.print
  end

  def print
    "#{@value}#{@color}"
  end

  def to_s
    print
  end

  def as_strong_as(card)
    return (compare_strength card) == 0
  end

  def stronger_than(card)
    return self > card
  end

  def compare_strength(card)
    Comparator.compare_objects_by_value self, card
  end

  def weaker_than (card)
    return (compare_strength card) < 0
  end

  def compare_to_v(v)
    @value.compare_to_v(v)
  end

  def print_value
    @value.name_one
  end

  def print_values
    @value.name_many
  end

end