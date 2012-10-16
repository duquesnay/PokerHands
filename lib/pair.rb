require_relative 'deck'
require_relative "comparator"

class Pair
  include Comparable

  def initialize (card1, card2)
    @cards = Deck.new [card1,card2]
  end

  def <=> another_pair
    return 1 if !another_pair
    return 1 if !another_pair.is_a? Pair
    return Comparator.compare_objects_by_value self, another_pair
  end

  def tell_value(visitor)
    @cards[0].tell_value( visitor )
  end

  def print
    "a pair of #{@cards[0].print_values}"
  end

end